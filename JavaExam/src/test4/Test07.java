package test4;
/*
 * 날짜 : 2024/07/16
 * 이름 : 김소희
 * 내용 : 로또번호 연습문제
 */
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class Test07 {
    public static void main(String[] args) {
        for (int count = 1; count <= 5; count++) {
            System.out.println(makeLotto());
        }
    }

    public static Set<Integer> makeLotto() {
        Set<Integer> lottoSet = new HashSet<>();
        //HashSet을 사용하여 중복을 허용하지않는 lotteSet을 생성
       //for(;;) : 무한 루프
       for(;;) {
            int num = (int) (Math.random() * 45) + 1;
            
            lottoSet.add(num);
            
            if(lottoSet.size() == 6) {
            	break;
            }
       }

        // 정렬을 위해 TreeSet 사용
       Set<Integer> treeSet = new TreeSet<>(lottoSet);
        return treeSet;
    }
}
