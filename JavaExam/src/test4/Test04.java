package test4;
/*
 * 날짜 : 2024/07/16
 * 이름 : 김소희
 * 내용 : 자바 문자열 연습문제
 */
public class Test04 {
    public static void main(String[] args) {
        // 파일명과 확장자 분리
        String fileName = "HelloWorld.java";

        int idx = fileName.lastIndexOf(".");
        
        String title = fileName.substring(0, idx);
        String ext = fileName.substring(idx + 1);

        System.out.println("파일명 : " + title);
        System.out.println("확장자 : " + ext);

        // 문자열로 된 점수 목록을 정수 배열로 변환하고 총점 계산
        String strScores = "60, 72, 82, 86, 92";
        String[] scores = strScores.split(", ");

        int total = 0;

        for (String score : scores) {
            
        	total += Integer.parseInt(score.trim());
        }

        System.out.println("strScores 총점 : " + total);
    }
}