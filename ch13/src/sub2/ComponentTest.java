package sub2;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.awt.event.ActionEvent;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.JCheckBox;
import javax.swing.JTable;

public class ComponentTest extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField txtUid;
	private JTextField txtName;
	private JTextField txtHp;
	private JLabel lblNewLabel_2;
	private JTextField txtPlus1;
	private JTextField txtPlus2;
	private JTextField textPlusResult1;
	private JTextField textField_3;
	private JTextField textField_4;
	private JTextField textField_5;
	private JTextField textField_6;
	private JTextField textField_7;
	private JTextField textField_8;
	private JTextField textField_9;
	private JTextField textField_10;
	private JTextField textField_11;
	private JTable table;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ComponentTest frame = new ComponentTest();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public ComponentTest() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 734);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("컴포넌트 실습");
		lblNewLabel.setBounds(12, 10, 97, 15);
		contentPane.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("버튼 실습");
		lblNewLabel_1.setBounds(12, 35, 57, 15);
		contentPane.add(lblNewLabel_1);
		
		JButton btn1 = new JButton("확인1");
		btn1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			
			System.out.println("확인1 버튼 클릭...");
				
			}
		});
		btn1.setBounds(12, 60, 97, 23);
		contentPane.add(btn1);
		
		JButton btn2 = new JButton("확인2");
		btn2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				JOptionPane.showMessageDialog(null, "버튼2 클릭...");
				
			}
		});
		btn2.setBounds(132, 60, 97, 23);
		contentPane.add(btn2);
		
		
		JButton btn3 = new JButton("확인3");
		    btn3.addActionListener(new ActionListener() {
		       public void actionPerformed(ActionEvent e) {
		          int answer = JOptionPane.showConfirmDialog(null, "버튼3 클릭...", "확인대화상자", JOptionPane.YES_NO_OPTION);
		            
		            if(answer == 0) {
		               System.out.println("Yes 클릭!");
		            } else {
		               System.out.println("No 클릭!");
		            }
		            
		            
		         }
		      });

		btn3.setBounds(255, 60, 97, 23);
		contentPane.add(btn3);
		
		JLabel lblNewLabel_1_1 = new JLabel("텍스트필드 실습");
		lblNewLabel_1_1.setBounds(12, 98, 97, 15);
		contentPane.add(lblNewLabel_1_1);
		
		JLabel lblNewLabel_2_2 = new JLabel("아이디");
		lblNewLabel_2_2.setBounds(14, 123, 57, 15);
		contentPane.add(lblNewLabel_2_2);
		
		txtUid = new JTextField();
		txtUid.setBounds(58, 120, 116, 21);
		contentPane.add(txtUid);
		txtUid.setColumns(10);
		
		JLabel lbResultUid = new JLabel(" 결과 :");
		lbResultUid.setBounds(255, 123, 109, 15);
		contentPane.add(lbResultUid);
		
		JButton btnUid = new JButton("확인");
		btnUid.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				String uid = txtUid.getText();
				lbResultUid.setText("결과 : " + uid);
				
			}
		});
		btnUid.setBounds(186, 119, 57, 23);
		contentPane.add(btnUid);
		
		JLabel lblNewLabel_2_1 = new JLabel("이름");
		lblNewLabel_2_1.setBounds(12, 152, 57, 15);
		contentPane.add(lblNewLabel_2_1);
		
		txtName = new JTextField();
		txtName.setColumns(10);
		txtName.setBounds(56, 149, 116, 21);
		contentPane.add(txtName);
		
		JLabel lbResultName = new JLabel(" 결과 :");
		lbResultName.setBounds(253, 152, 116, 15);
		contentPane.add(lbResultName);
		
		JButton btnName = new JButton("확인");
		btnName.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				String Name = txtName.getText();
				lbResultUid.setText("결과 : " + Name);
			}
		});
		btnName.setBounds(184, 148, 57, 23);
		contentPane.add(btnName);
		
		
		
		lblNewLabel_2 = new JLabel("휴대폰");
		lblNewLabel_2.setBounds(12, 181, 57, 15);
		contentPane.add(lblNewLabel_2);
		
		txtHp = new JTextField();
		txtHp.setColumns(10);
		txtHp.setBounds(56, 178, 116, 21);
		contentPane.add(txtHp);
		
		
		
		JButton btnHp = new JButton("확인");
		btnHp.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String Hp = txtHp.getText();
				lbResultUid.setText("결과 : " + Hp);
				
			}
		});
		btnHp.setBounds(184, 177, 57, 23);
		contentPane.add(btnHp);
		
		JLabel lbResultHp = new JLabel(" 결과 :");
		lbResultHp.setBounds(253, 181, 111, 15);
		contentPane.add(lbResultHp);
		
		JLabel lblNewLabel_2_3 = new JLabel("덧셈");
		lblNewLabel_2_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3.setBounds(12, 232, 49, 15);
		contentPane.add(lblNewLabel_2_3);
		
		txtPlus1 = new JTextField();
		txtPlus1.setColumns(10);
		txtPlus1.setBounds(58, 229, 62, 21);
		contentPane.add(txtPlus1);
		
		txtPlus2 = new JTextField();
		txtPlus2.setColumns(10);
		txtPlus2.setBounds(152, 229, 82, 21);
		contentPane.add(txtPlus2);
		
		JLabel lblNewLabel_2_3_1 = new JLabel("+");
		lblNewLabel_2_3_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1.setBounds(119, 232, 39, 15);
		contentPane.add(lblNewLabel_2_3_1);
		
		JLabel lblNewLabel_2_3_1_1 = new JLabel("=");
		lblNewLabel_2_3_1_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_1.setBounds(234, 232, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_1);
		
		textPlusResult1 = new JTextField();
		textPlusResult1.setColumns(10);
		textPlusResult1.setBounds(271, 229, 82, 21);
		contentPane.add(textPlusResult1);
		
		JButton btnPlus = new JButton("확인");
		btnPlus.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String strNum1 = txtPlus1.getText();
				String strNum2 = txtPlus2.getText();
				
				int num1 = Integer.parseInt(strNum1);
				int num2 = Integer.parseInt(strNum2);
				int num3 = num1 + num2;
				
				txtPlusResult.setText(""+num3);
			}
		});
		btnPlus.setBounds(365, 228, 57, 23);
		contentPane.add(btnPlus);
		
		JLabel lblNewLabel_2_3_2 = new JLabel("뺄셈");
		lblNewLabel_2_3_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_2.setBounds(12, 261, 49, 15);
		contentPane.add(lblNewLabel_2_3_2);
		
		textField_3 = new JTextField();
		textField_3.setColumns(10);
		textField_3.setBounds(58, 258, 62, 21);
		contentPane.add(textField_3);
		
		JLabel lblNewLabel_2_3_1_2 = new JLabel("-");
		lblNewLabel_2_3_1_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_2.setBounds(119, 261, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_2);
		
		textField_4 = new JTextField();
		textField_4.setColumns(10);
		textField_4.setBounds(152, 258, 82, 21);
		contentPane.add(textField_4);
		
		JLabel lblNewLabel_2_3_1_1_1 = new JLabel("=");
		lblNewLabel_2_3_1_1_1.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_1_1.setBounds(234, 261, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_1_1);
		
		textField_5 = new JTextField();
		textField_5.setColumns(10);
		textField_5.setBounds(271, 258, 82, 21);
		contentPane.add(textField_5);
		
		JButton btnHp_1_1 = new JButton("확인");
		btnHp_1_1.setBounds(365, 257, 57, 23);
		contentPane.add(btnHp_1_1);
		
		JLabel lblNewLabel_2_3_3 = new JLabel("곱셈");
		lblNewLabel_2_3_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_3.setBounds(12, 290, 49, 15);
		contentPane.add(lblNewLabel_2_3_3);
		
		textField_6 = new JTextField();
		textField_6.setColumns(10);
		textField_6.setBounds(58, 287, 62, 21);
		contentPane.add(textField_6);
		
		JLabel lblNewLabel_2_3_1_3 = new JLabel("x");
		lblNewLabel_2_3_1_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_3.setBounds(119, 290, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_3);
		
		textField_7 = new JTextField();
		textField_7.setColumns(10);
		textField_7.setBounds(152, 287, 82, 21);
		contentPane.add(textField_7);
		
		JLabel lblNewLabel_2_3_1_1_2 = new JLabel("=");
		lblNewLabel_2_3_1_1_2.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_1_2.setBounds(234, 290, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_1_2);
		
		textField_8 = new JTextField();
		textField_8.setColumns(10);
		textField_8.setBounds(271, 287, 82, 21);
		contentPane.add(textField_8);
		
		JButton btnHp_1_2 = new JButton("확인");
		btnHp_1_2.setBounds(365, 286, 57, 23);
		contentPane.add(btnHp_1_2);
		
		JLabel lblNewLabel_2_3_4 = new JLabel("나눗셈");
		lblNewLabel_2_3_4.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_4.setBounds(12, 319, 49, 15);
		contentPane.add(lblNewLabel_2_3_4);
		
		textField_9 = new JTextField();
		textField_9.setColumns(10);
		textField_9.setBounds(58, 316, 62, 21);
		contentPane.add(textField_9);
		
		JLabel lblNewLabel_2_3_1_4 = new JLabel("/");
		lblNewLabel_2_3_1_4.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_4.setBounds(119, 319, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_4);
		
		textField_10 = new JTextField();
		textField_10.setColumns(10);
		textField_10.setBounds(152, 316, 82, 21);
		contentPane.add(textField_10);
		
		JLabel lblNewLabel_2_3_1_1_3 = new JLabel("=");
		lblNewLabel_2_3_1_1_3.setHorizontalAlignment(SwingConstants.CENTER);
		lblNewLabel_2_3_1_1_3.setBounds(234, 319, 39, 15);
		contentPane.add(lblNewLabel_2_3_1_1_3);
		
		textField_11 = new JTextField();
		textField_11.setColumns(10);
		textField_11.setBounds(271, 316, 82, 21);
		contentPane.add(textField_11);
		
		JButton btnHp_1_3 = new JButton("확인");
		btnHp_1_3.setBounds(365, 315, 57, 23);
		contentPane.add(btnHp_1_3);
		
		JLabel lblNewLabel_1_1_1 = new JLabel("체크박스 실습");
		lblNewLabel_1_1_1.setBounds(12, 358, 97, 15);
		contentPane.add(lblNewLabel_1_1_1);
		
		JCheckBox chk1 = new JCheckBox("서울");
		chk1.setBounds(8, 386, 69, 23);
		contentPane.add(chk1);
		
		JCheckBox chk2 = new JCheckBox("대전");
		chk2.setBounds(77, 386, 69, 23);
		contentPane.add(chk2);
		
		JCheckBox chk3 = new JCheckBox("대구");
		chk3.setBounds(165, 386, 69, 23);
		contentPane.add(chk3);
		
		JCheckBox chk4 = new JCheckBox("부산");
		chk4.setBounds(231, 386, 69, 23);
		contentPane.add(chk4);
		
		JCheckBox chk5 = new JCheckBox("광주");
		chk5.setBounds(295, 386, 69, 23);
		contentPane.add(chk5);
		
		JLabel lbResultCheck = new JLabel(" 결과 :");
		lbResultCheck.setBounds(12, 415, 111, 15);
		contentPane.add(lbResultCheck);
		
		JButton btnCheck = new JButton("확인");
		btnCheck.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				List<String> cities = new ArrayList<>();
	            
	            if(chk1.isSelected()) {
	               cities.add(chk1.getText());
	            }
	            
	            if(chk2.isSelected()) {
	               cities.add(chk2.getText());
	            }
	            
	            if(chk3.isSelected()) {
	               cities.add(chk3.getText());
	            }
	            
	            if(chk4.isSelected()) {
	               cities.add(chk4.getText());
	            }
	            
	            
	            if(chk5.isSelected()) {
	               cities.add(chk5.getText());
	            }
	            
	            lblResultCheck.setText("결과 : " + cities);
	            
			}
		});
		btnCheck.setBounds(365, 386, 57, 23);
		contentPane.add(btnCheck);
		
		
		JLabel lblNewLabel_1_1_1_1 = new JLabel("테이블 실습");
		lblNewLabel_1_1_1_1.setBounds(12, 440, 97, 15);
		contentPane.add(lblNewLabel_1_1_1_1);
		
		table = new JTable();
		table.setBounds(14, 465, 350, 118);
		contentPane.add(table);
		
		
		// 테이블 설정
		String[] columnNames = {"아이디", "이름", "나이", "휴대폰"};
		
		DefaultTableModel model = new DefaultTableModel(columnNames, 0);
		model.setRowCount(0);
		table.setModel(model);
		
		JButton btnTable = new JButton("출력");
		btnTable.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				List<Person> persons = new ArrayList<>();
				persons.add(new Person("a101", "김유신", 23, "010-1234-1001"));
				persons.add(new Person("a102", "김춘추", 21, "010-1234-1002"));
				persons.add(new Person("a103", "장보고", 33, "010-1234-1003"));
				persons.add(new Person("a104", "강감찬", 43, "010-1234-1004"));
				persons.add(new Person("a105", "이순신", 53, "010-1234-1005"));
				
				for(Person person : persons) {
					Object[] rowData = {person.getId(),person.getName(),person.getAge(),person.getHp()};
					model.addRow(rowData);
				}
				
			}
		});
		btnTable.setBounds(14, 593, 97, 23);
		contentPane.add(btnTable);
		
		
	}
}
