package sub6;
/* 1)pet 클래스 정의
 * 2) pet클래스를 상속받는 dog, cat클래스를 정의하시오.
 * - dog,cat 클래스는 makeSound()메서드를 재정의 하세요.
 * -Dog는 "멍멍" 출력
 * -Cat은 "야옹" 출력
 * 
 *  3) Main 클래스에서 Dog,Cat 객체를 생성하고 정적 메서드 printSound()를 정의하시오.
 *  -main() 메서드에서 printSound() 메서드를 호출하시오
 *  -printSound()는 Dog, Cat 객체를 인자로 받는 매개변수를 선언하세요.
 *  -printSound()는 매개변수를 이용해 Dog, Cat의 makeSound()를 호출하시오.
 */
public class Pet {
	public void makeSound() {
		System.out.println("Pet sound...");
	}
	
}
