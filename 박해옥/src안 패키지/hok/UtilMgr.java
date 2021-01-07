package hok;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.text.*;

public class UtilMgr {

	 public static String getContent(String comment){
        return br("", "<br/>", comment);
   }

  public static String br(String first, String brTag, String comment){
        StringBuffer buffer = new StringBuffer();
        StringTokenizer st = new StringTokenizer(comment, "\n");
        int count = st.countTokens();
        buffer.append(first);
        int i = 1;
         while(st.hasMoreTokens()){ 
           if(i==count){
             buffer.append(st.nextToken());
           }else{ 
             buffer.append(st.nextToken()+ brTag);
		   }
           i++;
         }
       return buffer.toString(); 
  } 

  public static String monFormat(String b){
         String won;
		 double bb = Double.parseDouble(b); 
		 won = NumberFormat.getIntegerInstance().format(bb);
		 return won;
  }
  public static String monFormat(int b){
         String won;
		 double bb = b;
		 won = NumberFormat.getIntegerInstance().format(bb);
		 return won;
  }
  public static String intFormat(int i){
         String s = String.valueOf(i);
		 return monFormat(s);		  
  }
  
  //2009. 9. 28
  public static String getDay(){
	  Date now = new Date();
	  DateFormat df = DateFormat.getDateInstance();
	  return df.format(now).toString();
  }
  
	public static int parseInt(HttpServletRequest request, 
			String name) {
		return Integer.parseInt(request.getParameter(name));
	}
	
	public static String replace(String str, String pattern, String replace) {
		int s = 0, e = 0;
		StringBuffer result = new StringBuffer();

		while ((e = str.indexOf(pattern, s)) >= 0) {
			result.append(str.substring(s, e));
			result.append(replace);
			s = e + pattern.length();
		}
		result.append(str.substring(s));
		return result.toString();
	}

	public static void delete(String s) {
		File file = new File(s);
		if (file.isFile()) {
			file.delete();
		}
	}

	public static String con(String s) {
		String str = null;
		try {
			str = new String(s.getBytes("8859_1"), "ksc5601");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}
	
	public static String getKBytes(int i) {
		i = i/1000;
		return monFormat(i);
	}
}
