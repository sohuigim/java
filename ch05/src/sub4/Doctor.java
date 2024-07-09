package sub4;
/*
 *  Doctor 클래스
 * <속성>
 * -specialty (String)
 * <생성자>
 * -모든 인스턴스 변수 초기화
 * <메서드>
 * -work()
 * "제 이름은 [name]이고 나이는 [age]세 입니다." 출력
 * "저는 의사이며 전공은 [specialty]입니다." 출력
 * 
 */

public class Doctor extends Person {
	
	// <속성>
		protected String specialty;
			
	// 생성자
		public Doctor(String name, int age, String specialty) {
		super(name, age);
		this.specialty = specialty;
		}
	// 메소드
		public void work() {
			super.introduce();
		System.out.println("저는 의사이며 전공은 "+specialty+" 입니다.");
		}	

}
