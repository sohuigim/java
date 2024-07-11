package test3;
// 다형성 연습문제
class Product {
	protected String category;
	protected int price;
	
	public Product(String category, int price) {
		this.category = category;
		this.price = price;
	}
	//서브 클래스에서 구현할 추상 메소드
	public void  info() {}
}

class Television extends Product {
	
	public Television(String category, int price) {
		super(category, price);
	}
	
	public void info() {
		System.out.println("제품분류 : " +category);
		System.out.println("제품가격 : " +price);
	}
}

class Computer extends Product {
	
	public Computer(String category, int price) {
		super(category, price);
	}
	
	public void info() {
		System.out.println("제품분류 :  "+category);
		System.out.println("제품가격 : " +price);
	}
}

public class Test08 {
	public static void main(String[] args) {
		
		Product p1 = new Television("가전", 100);
		Product p2 = new Computer("컴퓨터", 150);
		
		p1.info();
		p2.info();
	}
}