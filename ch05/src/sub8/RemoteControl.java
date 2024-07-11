package sub8;
/*
 인터페이스 : 표준화된 클래스 설계에 사용되는 구조체
 - 표준회되 클래스 설계에 사용되는 구조체
 - 오직 추상 메서드만 선언
*/
 public interface RemoteControl {

	public abstract void powerOn();
	public abstract void powerOff();
	
	public void chUp(); //abstract 생략가능
	public void chDown();

	public void soundUp();
	public void soundDown();
	
	
}
