package sub1;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse;

/* 
/* 날짜 : 2024/07/24
* 이름 : 김소희
* 내용 : HTTP 통신 실습하기
*/
public class HttpGetTest {
	public static void main(String[] args) {
		
		HttpClient client = HttpClient.newHttpClient();
		
		HttpRequest request = (HttpRequest) HttpRequest.newBuilder()
				.uri(URI.create("http://naver.com"))
				.GET()
				.build();
				
		
		
		try {
			HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
			
			System.out.println("상태코드 : " + response.statusCode());
			System.out.println("응답내용 : " + response.body());
		
		} catch (IOException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}

}
