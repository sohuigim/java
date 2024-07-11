package test3;
// 추상클래스, 다형성 연습문제
? class Shape {
	public abstract void draw();
}

class Triangle extends ? {
	public void draw() {
		System.out.println("draw Triangle!");
	}
}

class Circle extends ? {
	public void draw() {
		System.out.println("draw Circle!");
	}
}
public class Test09 {
	public static void main(String[] args) {
		
		Test09 here = new Test09();
		
		Circle circle = new Circle();
		Triangle triangle = new Triangle();
		
		here.draw(circle);
		here.draw(triangle);
	}
	
	public void draw( ? obj ) {
		obj.draw();
	}
}
