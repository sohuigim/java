package step1;

import java.util.Scanner;

public class Test05 {

public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		double a = sc.nextDouble();
		double b = sc.nextDouble();
		
		if(0<a && b<10) {
			System.out.println(a/b);
		}else {
			System.out.println("0<a && b<10 범위이내로 설정하세요.");	
		}
	}
}