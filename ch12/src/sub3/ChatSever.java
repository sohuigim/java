package sub3;

import java.net.ServerSocket;
import java.net.Socket;

import sub2.SocketSever;

public class ChatSever {
	public static void main(String[] args) {
		
		System.out.println("[Sever]");
		
		ServerSocket severSocket = null;
		Socket socket = null;
		
		try {
			severSocket = new ServerSocket(9001);
			
			System.out.println("연결 대기...");
			socket = severSocket.accept();
			
			System.out.println("연결 수립...");
			
			Thread t1 = new SendThread(socket);
			Thread t2 = new ReceiveThread(socket);
			
			t1.start();
			t2.start();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
