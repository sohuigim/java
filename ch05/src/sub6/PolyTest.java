package sub6;
/*
 * 날짜 : 2024/07/10
 * 이름 : 김소희
 * 내용 : 다형성 실습하기
 * 
 * 다형성(polymorphism)
 * - 상속관계에서 부모클래스의 기능을 자식클래스에서 다양한 기능으로 정의하는 특징
 * - 객체(참조변수)의 타입선언을 부모클래스 타입으로 선언(업캐스팅)
 * - 다형성을 활용해서 효율적인 프로그래밍을 수행
 * 
 */

public class PolyTest {
	public static void main(String[] args) {
		
		// 다향성 적용된 객체 생성(업캐스팅)
		Animal a1 = new Tiger();
		Animal a2 = new Eagle();
		Animal a3 = new Shark();
		
		a1.move();
		a1.hunt();
		
		a2.move();
		a2.hunt();
		
		a3.move();
		a3.hunt();
		
		// 다운캐스팅
		// 문법적으로 업캐스팅이 있으면 다운캐스팅도 있음
		Tiger tiger = (Tiger) a1;
		Eagle eagle = (Eagle) a2;
		Shark shark = (Shark) a3;
		
		tiger.move();
		tiger.hunt();
		
		eagle.move();
		eagle.hunt();
		
		shark.move();
		shark.hunt();
		
		// 객체 타입 비교연산
		// a1이 타이거냐
		if(a1 instanceof Tiger) {
			System.out.println("a1은 Tiger 입니다.");
		}if(a2 instanceof Eagle) {
			System.out.println("a2은 egale 입니다.");
		
		}if(a3 instanceof Shark) {
			System.out.println("a3은 shark 입니다.");
		}
		// 다형성을 활용한 객체배열
		Animal arr[] = {tiger, eagle, shark};
		
		for(Animal animal : arr) {
		animal.move();
		animal.hunt();
		}
		
		// 다형성 연습문제
		/* 1)pet 클래스 정의
		 * 
		 * 2) pet클래스를 상속받는 dog, cat클래스를 정의하시오.
		 * - dog,cat 클래스는 makeSound()메서드를 재정의 하세요.
		 * -Dog는 "멍멍" 출력
		 * -Cat은 "야옹" 출력
		 * 
		 * 3) Main 클래스에서 Dog,Cat 객체를 생성하고 정적 메서드 printSound()를 정의하시오.
		 * -main() 메서드에서 printSound() 메서드를 호출하시오
		 * -printSound()는 Dog, Cat 객체를 인자로 받는 매개변수를 선언하세요.
		 * -printSound()는 매개변수를 이용해 Dog, Cat의 makeSound()를 호출하시오.
		 */
		
		Dog dog = new Dog();
		Cat cat = new Cat();
		
		printSound(dog);
		printSound(cat);
		
	}
	
	public static void printSound(Pet pet) {
		pet.makeSound();
	
	}
}
