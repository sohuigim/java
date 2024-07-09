package sub4;

/*
Engineer 클래스
* <속성>
* -field(String)
* <생성자>
* -모든 인스턴스 변수 초기화
* <메서드>
* -work()
* "저는 (field) 엔지니어 입니다." 출력
*/

public class Engineer extends Person {
	//<속성>
	private String field;
	
	//<생성자>
	public Engineer(String name, int age, String field) {
		super(name, age);
		this.field = field;
	
	}
	
	//<메서드>
	public void work() {
		super.introduce();
		System.out.println("저는 "+field+"엔지니어 입니다.");
	}
}
