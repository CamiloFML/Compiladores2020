import java.io.*;
import java.util.*;
public class Test{
	public static void main(String[] args) {
	    Lexer l;
	    parser p;
		try{
		    l=new Lexer(new PushbackReader(new InputStreamReader(System.in), 1024));
		    p=new parser(l);
		    Object o=p.parse();
		    System.out.println("FIN DEL PROGRAMA");
	    } catch (Exception e) {
	      e.printStackTrace();
	      System.exit(0);
		}
	}
}