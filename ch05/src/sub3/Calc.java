package sub3;

/*
 * 날짜 : 2024/07/09
 * 이름 : 김소희
 * 내용 : 클래스 변수, 메서드 실습하기
 *  
 */

public class Calc {
	
	//싱글톤 객체
	private static Calc instance = new Calc();
	public static Calc getInstance() {
		return instance;
	}
	private Calc() {}
	
	public int plus(int x, int y) {
		return x + y;
	}
	
	public int minus(int x, int y) {
		return x - y;
	}
	
	public int multi(int x, int y) {
		return x * y;
	}
	
	public int div(int x, int y) {
		return x / y;
	}
	

}
