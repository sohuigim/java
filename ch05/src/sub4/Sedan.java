package sub4;

// Car 부모 클래스 Sedan 자식 클래스. 자식은 부모 초기화 필
public class Sedan extends Car {
	
	private int cc;
	
	public Sedan(String name, String color, int speed, int cc) {
		super(name, color, speed); // 부모클래스 생성자 호출
		this.cc = cc;
	}
	
	public void show() {
		super.show(); // 부모클래스 = super
		System.out.println("배기량 : " + cc);
	}
	
	
}
