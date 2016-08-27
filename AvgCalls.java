package HiveMaven.HiveMavenProj;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;

public class AvgCalls {
	private static String driverName = "org.apache.hive.jdbc.HiveDriver";
	public static void main(String[] args) throws SQLException{
		try {
		      Class.forName(driverName);
		    } catch (ClassNotFoundException e) {
		      e.printStackTrace();
		      System.exit(1);
		    }
		Connection con = DriverManager.getConnection("jdbc:hive2://localhost:10000/default", "hive", "cloudera");
	    Statement stmt = con.createStatement();
	    
	    String sqlForUniquePairs = "WITH cte AS    "
	    		+ "(SELECT caller_no, receiver_no, count(*) as countCalls "
	    		+ "FROM   calls where length(caller_no) = 11 and length(receiver_no) in (10,11) group by caller_no, receiver_no) "
	    		+ "select count(distinct(col1)) from "
	    		+ "(SELECT concat(caller_no,receiver_no) as col1 FROM cte WHERE  caller_no <= receiver_no "
	    		+ "UNION ALL SELECT concat(receiver_no,caller_no) as col1 FROM cte WHERE  caller_no >  receiver_no ) a";
	    
	    ResultSet resUniquePairs = stmt.executeQuery(sqlForUniquePairs);
	    
	    String sqlForTotalCalls ="Select count(*) "
	    		+ "from calls where length(caller_no) = 11 and length(receiver_no) in (10,11)";
	    
	    ResultSet resTotalCalls = stmt.executeQuery(sqlForTotalCalls);
	    
	    int uniquePairs = 0;
	    int totalCalls = 0;
	    
	    if (resUniquePairs.next())
	    {
	    	uniquePairs =Integer.parseInt(resUniquePairs.getString(1));
	    }
	    if (resTotalCalls.next())
	    {
	    	totalCalls =Integer.parseInt(resTotalCalls.getString(1));
	    }
	    
	    int averageCallsForPairsApprox = -1;
	    
	    if(uniquePairs > 0)
	    {
	    	averageCallsForPairsApprox = totalCalls/uniquePairs;
	    }
	    else
	    	averageCallsForPairsApprox = -1;
	    System.out.println("Average is" + averageCallsForPairsApprox);
	    
	    resTotalCalls.close();
	    resUniquePairs.close();
	    stmt.close();
	    con.close();   
	}
}