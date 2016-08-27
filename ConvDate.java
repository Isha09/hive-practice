package HiveMaven.HiveMavenProj;

import java.util.HashMap;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.Text;

/**
 * Created by cloudera on 8/7/16.
 */
public class ConvDate extends UDF {
    HashMap<String, String> hmap = new HashMap<String, String>();
    String day ;
    String year;
    String month;
    String time;
    String monthNum;

    public String evaluate(String str){
        if(str == null) {
            return null;
        }
        else{
            day = str.substring(8,10);
            year = str.substring(26);
            month = str.substring(4,7);
            time = str.substring(11,19);
            hmap.put("Jan","01");
            hmap.put("Feb","02");
            hmap.put("Mar","03");
            hmap.put("Apr","04");
            hmap.put("May","05");
            hmap.put("Jun","06");
            hmap.put("Jul","07");
            hmap.put("Aug","08");
            hmap.put("Sep","09");
            hmap.put("Oct","10");
            hmap.put("Nov","11");
            hmap.put("Dec","12");
            monthNum = hmap.get(month);
            return year+"-"+monthNum+"-"+day+" "+time;

        }
    }
}