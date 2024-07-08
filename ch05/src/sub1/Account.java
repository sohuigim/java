package sub1;

/*
 * 날짜 : 2024/07/8
 * 이름 : 김소희
 * 내용 : 클래스와 객체 실습하기
 */
public class Account {
	
	// 속성
	String bank;
	String acc;
	String name;
	int balance;
	
	
	// 기능
	public void deposit(int money) {
		this.balance += money;
		
	}
	
	public void withdraw(int money) {
		this.balance -= money;
	}
	
	public void show( ) {
		System.out.println("------------");
		System.out.println("은행명 : " + this.bank);
		System.out.println("계좌번호 : " + this.acc);
		System.out.println("이름 : " + this.name);
		System.out.println("현재잔액 : " + this.balance);
		System.out.println("-------- ");
		
	}
}
