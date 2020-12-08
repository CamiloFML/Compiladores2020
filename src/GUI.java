import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
public class GUI extends JFrame{
	GridBagLayout gbl;
	GridBagConstraints gbc;
	JTextArea codePad;

	public GUI(){
		super();
		init();
	}
	private void init(){
		this.setTitle("AZ2K16-GUI");
		this.setResizable(false);
		this.setSize(200,400);
		//this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setLayout(new BorderLayout());
		codePad=new JTextArea(0,0);
		codePad.setEditable(false);
		JScrollPane jsp=new JScrollPane(codePad);
		this.codePad.setFont(this.codePad.getFont().deriveFont(20f));
		this.add(jsp,BorderLayout.CENTER);
	}

	public void mostrar_si(){
		if(!this.isVisible()){
			this.setVisible(true);
		}
	}

	public void updateVarList(Hashtable ht){
		this.codePad.setText("Variables");
		Enumeration<String> enumKey = ht.keys();
		while(enumKey.hasMoreElements()) {
		    String key = enumKey.nextElement();
		    String val = ht.get(key)+"";
		    this.codePad.setText(this.codePad.getText()+"\n"+key+"="+val);
		}
	}
}