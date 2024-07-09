package sub2;

public class Book {
	
/* 도서관 관리 시스템의 일부로 book 클래스를 정의하세요. 이 클래스는 다음 요구사항을 충족해야 합니다.
<속성>
title (String) : 책 제목
author (String) : 저자 이름
isbn (String) : ISBN 번호
availableCopies (int): 이용 가능한 복사본 수

<생성자>
모든 인스턴스 변수를 초기화하는 생성자

<매서드>
borrowBook()
이용 가능한 복사본이 있으면 availableCopies를 1감소시키고 true를 반환
이용 가능한 복사본이 없으면 false를 반환

returnBook()
availableCopies를 1 증가

show()
모든 인스턴스 변수 값을 출력

<Getter, Setter>
각 인스턴스 변수에 대한 getter와 setter 메서드 정의
*/
	
	//속성
		private String title;
		private String author ;
		private String isbn ;
		private int availableCopies ;
		
		public Book(String title, String author, String isbn, int availableCopies) {
			this.title = title ;
			this.author = author ;
			this.isbn = isbn ;
			this.availableCopies = availableCopies ;
		}

		public boolean borrowBook() {
			if(availableCopies > 0) {
				availableCopies--;
				return true;
			}
			return false;
		}
		public void returnBook() {
			availableCopies++;
		}

		public void show() {
			System.out.println("책 제목 : " + this.title);
			System.out.println("책 저자 : " + this.author);
			System.out.println("책 ISBN : " + this.isbn);
			System.out.println("이용 가능한 복사본 수 : " + this.availableCopies);
		}
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public String getIsbn() {
			return isbn;
		}
		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}
		public int getAvailableCopies() {
			return availableCopies;
		}
		public void setAvailableCopies(int availableCopies) {
			this.availableCopies = availableCopies;
		}
}