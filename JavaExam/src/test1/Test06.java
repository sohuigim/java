package test1;

import java.util.Scanner;

/*
 * 날짜 : 2024/07/03
 * 이름 : 김소희
 * 내용 : 메서드 오버로딩 실습하기
 */

public class Test06 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("x값 입력 : ");
		int x = sc.nextInt();
		
		System.out.print("y값 입력 : ");
		int y = sc.nextInt();
		
		String result = x > y ? "x가 더 큽니다." : "y가 더 큽니다.";
		
		System.out.println(result);
	}

}
