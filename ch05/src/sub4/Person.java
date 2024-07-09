package sub4;

/*
 * <속성>
 * -name(String)
 * -age(int)
 * <생성자>
 * -이름과 나이를 받아서 name,age 속성 초기화
 * <메소드>
 * -work():기본적으로 "Person is working"출력
 * -introduce() : "제 이름은 [name]이고 나이는 [age]세 입니다"출력
 * 
 * Person 클래스를 상속받아 Doctor, Engineer 클래스 정의
 */
public class Person {

		// <속성>
		protected String name;
		protected int age;
		
		// 생성자
		public Person(String name, int age) {
			this.name = name;
			this.age = age;
		}
		// 메소드
		public void work() {
			System.out.println("Person is working");
		}
		
		public void introduce() {
			System.out.println("제 이름은 "+name+"이고 나이는 "+age+"세 입니다.");
		}	
}
