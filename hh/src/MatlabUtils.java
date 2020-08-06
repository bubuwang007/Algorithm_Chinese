import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/**
 * 工具类
 */
public class MatlabUtils {

    /**
     * 生成x1,y1,x2,y2.....
     * @param length 需要的长度
     * @return 返回生成的字符串
     */
    public static String generateXy(int length){
        StringBuffer s1 =new StringBuffer();
        for (int i = 0; i <length ; i++) {
            s1.append("x"+(i+1)+","+"y"+(i+1));
            if(i!=length-1){
                s1.append(",");
            }
        }
        return s1.toString();
    }

    /**
     * 以字符输入流读取文件
     * @param src
     * @return 返回一个StringBuffer
     * @throws IOException
     */
      public static String readFile(String src) {

          FileReader fileReader = null;
          StringBuffer stringBuffer = new StringBuffer();
          try {

              fileReader = new FileReader(src);
              char[] chars = new char[1*1024];
              int len;

              while((len = fileReader.read(chars))!=-1){
                  stringBuffer.append(chars,0,len);
              }

          } catch (FileNotFoundException e) {
              e.printStackTrace();
          } catch (IOException e) {
              e.printStackTrace();
          }finally {

              if (fileReader != null){
                  try {
                      fileReader.close();
                  } catch (IOException e) {
                      e.printStackTrace();
                  }
              }

          }
          return stringBuffer.toString();
      }

    /**
     * 以字符输出流的形式输出
     * @param src 输出文件路径
     * @param string 输出的字符串
     * @param append 是否在文件中追加
     */
      public static void writeFile(String src,String string,boolean append)  {

          FileWriter fileWriter = null;

          try {

              fileWriter = new FileWriter(src,append);
              fileWriter.write(string);

          } catch (IOException e) {
              e.printStackTrace();
          }finally {

              if (fileWriter != null){
                  try {
                      fileWriter.close();
                  } catch (IOException e) {
                      e.printStackTrace();
                  }
              }

          }

      }

    /**
     * 用于生成刚度矩阵组装的表达式
     * @param args i,j,m,n....
     * @return 返回生成的表达式
     */
      public static String generateKk(String...args){

          String[] strings =new String[args.length*2];
          StringBuffer stringBuffer = new StringBuffer();

          for (int i = 0; i < args.length; i++) {
              strings[2*i]="2*"+args[i]+"-1";
              strings[2*i+1]="2*"+args[i];
          }

          for (int i = 0; i < strings.length ; i++) {
              String first = strings[i];
              for (int j = 0; j < strings.length; j++) {
                  String second = strings[j];
                  stringBuffer.append("K("+first+","+second+")=K("+first+","+second+")"+
                          "+k("+String.valueOf(i+1)+","+String.valueOf(j+1)+");");
                  stringBuffer.append("\n");
              }
          }
          return stringBuffer.toString();
      }

}
