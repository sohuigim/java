package shop;

import java.util.List;
import java.util.Scanner;

import shopDAO.CustomerDAO;
import shopDAO.OrderDAO;
import shopDAO.ProductDAO;
import shopVO.CustomerVO;
import shopVO.OrderVO;

/*
 * 날짜 : 2024/07/31
 * 이름 : 김소희
 * 내요 : Shop 미니 프로젝트 실습하기
 */
public class ShopMain {
	public static void main(String[] args) {
		
		System.out.println("-------------------");
		System.out.println("쇼핑몰에 오신것을 환영합니다.");
		System.out.println("-------------------");
		
		Scanner sc = new Scanner(System.in);
		
		CustomerDAO customerDAO = CustomerDAO.getInstance();
		ProductDAO productDAO = ProductDAO.getInstance();
		OrderDAO orderDao = OrderDAO.getInstance();
		
		// 로그인 사용자 객체
		CustomerVO loginedCustomer = null;
		
		while(true) {
			
			if(loginedCustomer == null) {
				System.out.println("종료:0, 로그인:1, 회원가입:2, 상품목록:3, 주문하기:4");
			}else {
				System.out.println("종료:0, 로그아웃:1, 주문현황:2, 상품목록:3, 주문하기:4");
			}
			System.out.print("선택>");
				
			int answer = sc.nextInt();
			
			if(answer == 0) {
				break;
			}else if(answer == 1) {
				
				if(loginedCustomer == null) {
					// 로그인
					System.out.print("아이디 입력 : ");
					String custId = sc.next();
					
					loginedCustomer = customerDAO.selectCustomer(custId);
					
					if(loginedCustomer != null) {
						System.out.println(loginedCustomer.getName() + "님 어서오세요.");
					}else {
						System.out.println("일치하는 회원이 없습니다.");
					}
				}else {
					// 로그아웃
					System.out.println(loginedCustomer.getName() + "님 안녕히 가세요.");
					loginedCustomer = null;
				}
				
			}else if(answer == 2) {
				// 회원가입
				CustomerVO customerVO = new CustomerVO();
				
				System.out.print("아이디 입력 : ");
				customerVO.setCustId(sc.next());
				
				System.out.print("이름 입력 : ");
				customerVO.setName(sc.next());
				
				System.out.print("휴대폰 입력 : ");
				customerVO.setHp(sc.next());
				
				System.out.print("주소 입력 : ");
				customerVO.setAddr(sc.next());
				
				int result = customerDAO.insertCustomer(customerVO);
				
				if(result > 0) {
					System.out.println("회원가입을 축하합니다.");
				}else {
					System.out.println("회원가입에 실패했습니다.");
				}
				
			}else if(answer == 3) {
				// 상품목록
				
				List<ProductDAO> products = productDAO.selectProducts();
				
				System.out.println("---------상품목록---------");
				products.stream().forEach(System.out::println);
				System.out.println("------------------------");
				
			}else if(answer == 4) {
				// 주문하기
				
				if(loginedCustomer == null) {
					System.out.println("로그인을 먼저 하십시요.");
					continue;
				}
				
				OrderVO orderVo = new OrderVO();
				
				System.out.println("주문 상품번호 입력 : ");
				orderVo.setOrderProduct(sc.nextInt());
				
				System.out.println("주문 상품수량 입력 : ");
				orderVo.setOrderCount(sc.nextInt());
				
				int result = OrderDAO.insertOrder(orderVo);
				
				if(result > 0) {
					System.out.println("상품 주문이 완료되었습니다.");
				}else {
					System.out.println("상품 주문이 실패하였습니다.");
				}
			}
			
			
		}// end while
		
		sc.close();
		System.out.println("안녕히 가십시요.");
		
	}// end main
}