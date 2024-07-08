package test2;

/*
 * 날짜 : 2024/07/05
 * 이름 : 김소희
 * 내용 : 자바 배열 최대값 찾기 연습문제
 */
public class Test03 {
	public static void main(String[] args) {
		
		int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10	};
		
		// 현재 배열 출력
		for (int i = 0; i < 10; i++) {
			System.out.print(arr[i]+", ");
		}
		
		System.out.println("\n");
		
		// 배열의 원소를 역순으로 정렬
		for (int j = 0; i < 5; i++) {
			int temp = arr[j];
			
			arr[9 - j] = temp;
		}
		
		// 역순으로 정렬된 배열 출력
		for () {
			System.out.print(n+", ");
		}
	}
}