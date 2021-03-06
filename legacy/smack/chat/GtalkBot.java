package chat;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Properties;

import org.jivesoftware.smack.ChatManager;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.filter.MessageTypeFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smackx.packet.VCard;
import org.apache.commons.dbcp.BasicDataSource;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smack.packet.DefaultPacketExtension;
public class GtalkBot implements Runnable{
	 public static Hashtable hashTable;
	    public static HashMap nonAuthorizedMap;
	    public ArrayList nonAuthorizedList;
	    public static ArrayList commandList;
	    public static XMPPConnection connection;
	    public static HashMap pendingMsgMap;
	    public static HashMap chatMap;
	    public static ArrayList hideList;
	    public static HashMap profileMap;
	    public static HashMap profile_gmailIdMap;
	    
	    public static HashMap jsChatThreadMap;
	    public static HashMap gtalkChatThreadMap;
	    
	    public static HashMap UserGtalkMap;
	    
	    public static HashMap ProfileMapGtalk;
	    
	    public static String xmpp_server_name=null;
	    public static int xmpp_port=0;
	    public static String bot_name=null;
	    public static String bot_password=null;
	    public static String newjs_url=null;
	    public static String newjs_username=null;
	    public static String newjs_password=null;
	    public static String bot_js_url=null;
	    public static String bot_js_url_username=null; 
	    public static String bot_js_url_password=null;
	    public static String domain_name=null;
	    public static String help_msg1=null;
	    public static String help_msg2=null;
	    public static String conflict_msg1=null;
	    public static String conflict_msg2=null;
	    public static String conflict_msg3=null;
	    public static String tag_line=null;
	    public static String subscription=null;
	    
	    public static String userplane_url=null;
	    public static String userplane_username=null;
	    public static String userplane_password=null;
	    
	    
		public void run() {
			// TODO Auto-generated method stub
			 if(commandList == null)
		        {
		            commandList = new ArrayList();
		            commandList.add("@yes");
		            commandList.add("@no");
		            commandList.add("yes");
		            commandList.add("no");
		            commandList.add("@end");
		            commandList.add("@show");
		            commandList.add("@hide");
		        }
//		        FileInputStream in = null;
		        boolean bool = true;
		        
		        
		        try
		        {
			        InputStream in = getClass().getClassLoader().getResourceAsStream("conf/gTalkBot.properties");
//		            in = new FileInputStream(f);
		            Properties pro = new Properties();
		            pro.load(in);
		            xmpp_server_name = pro.getProperty("XMPP_SERVER_NAME");
		            xmpp_port = Integer.parseInt(pro.getProperty("XMPP_PORT"));
		            bot_name = pro.getProperty("BOT_NAME");
		            bot_password = pro.getProperty("BOT_PASSWORD");
		            newjs_url = pro.getProperty("NEWJS_URL");
		            newjs_username = pro.getProperty("NEWJS_USERNAME");
		            newjs_password = pro.getProperty("NEWJS_PASSWORD");
		            bot_js_url = pro.getProperty("BOT_JS_URL");
		            bot_js_url_username = pro.getProperty("BOT_JS_URL_USERNAME");
		            bot_js_url_password = pro.getProperty("BOT_JS_URL_PASSWORD");
		            domain_name=pro.getProperty("DOMAIN_NAME");
		            help_msg1=pro.getProperty("HELP_MSG1");
		            help_msg2=pro.getProperty("HELP_MSG2");
		            conflict_msg1=pro.getProperty("CONFLICT_MSG1");
		            conflict_msg2=pro.getProperty("CONFLICT_MSG2");
		            conflict_msg3=pro.getProperty("CONFICT_MSG3");
		            tag_line=pro.getProperty("TAG_LINE");
		            subscription=pro.getProperty("SUBSCRIPTION");
		            
		            //FOR USERPLANE DATABASE AND USERNAME AND PASSWORD
		            
		            userplane_url=pro.getProperty("USERPLANE_URL");
		            userplane_username=pro.getProperty("USERPLANE_USERNAME");
		            userplane_password=pro.getProperty("USERPLANE_PASSWORD");
		            
		        }
		        catch(Exception e)
		        {
		            e.printStackTrace();
		        }
		        ConnectionConfiguration connConfig = new ConnectionConfiguration(xmpp_server_name, xmpp_port);
		        XMPPConnection connection = new XMPPConnection(connConfig);
		        try
		        {
		            connection.connect();
					System.out.println(bot_name+"+==="+bot_password);
		            connection.login(bot_name, bot_password);
		            Presence presence = new Presence(Presence.Type.available);
		            presence.setStatus(tag_line);
		            connection.sendPacket(presence);
		        }
		        catch(Exception ex)
		        {
		            System.out.println("Failed to log in as >>");
		            
		            ex.printStackTrace();
		            System.exit(1);
		        }
		      
				//Gmail subscription thread
				Thread GmailAdderThread = new Thread(new GmailSubscriptionThread(connection));
                 GmailAdderThread.start();
		      
		        PacketFilter filters=new MessageTypeFilter(Message.Type.normal);
		        PresenceMessagePacket Parrot = new PresenceMessagePacket(connection);
		        connection.addPacketListener(Parrot, filters);
		        
		         
				hashTable = new Hashtable();//contain key as msgFrom and gmailid as value
		        nonAuthorizedMap = new HashMap();
		        pendingMsgMap = new HashMap();
		        chatMap = new HashMap();
		        profileMap = new HashMap();
		        profile_gmailIdMap = new HashMap();
		        jsChatThreadMap = new HashMap();
		        gtalkChatThreadMap = new HashMap();
		        UserGtalkMap=new HashMap();
		        ProfileMapGtalk=new HashMap();
		        System.out.println("Bot up");
		        
		        
			    synchronized (this) {
			        try {
				    	this.wait();
		               //Thread.sleep(1000);
		            } catch (InterruptedException e) {
		               e.printStackTrace();
		            }
				}			
		}

}
