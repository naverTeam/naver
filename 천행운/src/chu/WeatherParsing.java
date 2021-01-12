package chu;

import java.io.*;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* Name of the class has to be "Main" only if the class is public. */
class WeatherParsing
{
    public static void main (String[] args) throws java.lang.Exception
    {
        String category = "",  obsrValue = "";
        try{
            // XML 데이터를 읽어옴
        	String myKey = "rxer6cgsWYHj6pOhO6r%2BqyHG08lVTB111%2FAF8amEeF3AlMj5OCnY%2BYm48JpyLW2V2Mu1J%2F2jIYxyd15%2By7pqOw%3D%3D";
        	String time = "0100";
        	String date = "20210112";
        	String nx = "55";
        	String ny = "127";
            URL url = new URL("http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?serviceKey="
            		+myKey+"&numOfRows=10&pageNo=1&base_date="+date+"&base_time="+time+"&nx="+nx+"&ny="+ny+"");
            
            InputStream in = url.openStream();
            
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = factory.newDocumentBuilder();
            Document doc = db.parse(in);
            
            Element el = doc.getDocumentElement();
            // <item> ~ </item>을 하나의 노드로 노드 리스트를 만듬
            NodeList itemList = el.getElementsByTagName("item");
            
            for(int i = 0 ; i < itemList.getLength() ; i++){
                // <item> ~ </item> 노드를 하나씩 읽어옴
                Node itemNode = itemList.item(i);
                // <item> ~ </item> 사이의 태그들로 노드 리스트를 만듬
                NodeList subList = itemNode.getChildNodes();
                
                // <item> ~ </item> 사이의 태그를 하나씩 읽어와 해당 태그와 일치할 경우 변수에 저장
                for(int j = 0 ; j < subList.getLength() ; j++){
                    Node subNode = subList.item(j);
                    if(subNode.getNodeName().equals("category"))
                        category = subNode.getTextContent();
                    if(subNode.getNodeName().equals("obsrValue"))
                    	obsrValue = subNode.getTextContent();
                }

                if(i==0) {
                	System.out.println("item #" + i);
	                System.out.println("category : " + category + "\s(강수형태)");
//	                System.out.println("baseDate : " + baseDate);
//	                System.out.println("baseTime : " + baseTime);
	                System.out.println("obsrValue : " + obsrValue + "\n");
	                obsrValue = "2";
	                int stat = Integer.parseInt(obsrValue);
	                String sky = "";
	                switch(stat) {
	                	case 0: sky="선글라스";
	                			break;
	                	case 1: sky="우산캐릭터";
	                			break;
	                	case 2: sky="눈사람";
	                			break;
	                	case 3: sky="소나기";
	                			break;
	                	case 4: sky="올듯말듯";
	                			break;
	                	case 5: sky="진눈개비";
	                			break;
	                	case 6: sky="진눈개비";
	                			break;
	                	case 7: sky="진눈개비";
	                			break;
	                
	                }
	                System.out.println("obsrValue : " + sky + "\n");
                }
                if(i==3) {
                	System.out.println("item #" + i);
	                System.out.println("category : " + category + "\s(기온)");
//	                System.out.println("baseDate : " + baseDate);
//	                System.out.println("baseTime : " + baseTime);
	                System.out.println("obsrValue : " + obsrValue + "\n");
	                break;
                }
            }
            
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}