package sub2;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;

/* 
/* 날짜 : 2024/07/24
* 이름 : 김소희
* 내용 : 소켓 통신 실습하기
*/
public class SocketSever {
	public static void main(String[] args) {
		
		System.out.println("[Sever]");
		
		ServerSocket severSocket = null;
		
		try {
			severSocket = new ServerSocket();
			severSocket.bind(new InetSocketAddress("127.0.0.1",50001));
			
			System.out.println("연결 대기...");
			Socket socket = severSocket.accept();
			
			System.out.println("연결 수립...");
			
			// 데이터 수신(Client -> Server)
			InputStream is = socket.getInputStream();
			byte[] bytes = new byte[100];
			int readBytes = is.read(bytes);
			
			String message = new String(bytes, 0, readBytes, "UTF-8");
			System.out.println(message);
			
			System.out.println("데이터 수신 완료...");
			
			// 데이터 송신(Client <- Server)
			OutputStream os = socket.getOutputStream();
			
			String sendmessage = "Hello Client!";
			
			byte[] messageBytes = sendmessage.getBytes();
			
			os.write(messageBytes);
			os.flush();
			
			System.out.println("데이터 송신 완료...");
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if (!severSocket.isClosed()) {
			try {
				severSocket.close();
			} catch (IOException e) {
				e.printStackTrace();
				
			}
			
		}
		System.out.println("Server 종료...");
	}

}
