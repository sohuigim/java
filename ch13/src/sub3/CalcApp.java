package sub3;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import javax.swing.SwingConstants;
import java.awt.Font;

public class CalcApp {

	private JFrame frame;
	private JTextField textField;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					CalcApp window = new CalcApp();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public CalcApp() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 340, 380);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		textField = new JTextField();
		textField.setFont(new Font("굴림", Font.BOLD, 20));
		textField.setHorizontalAlignment(SwingConstants.RIGHT);
		textField.setText("0");
		textField.setBounds(12, 10, 286, 47);
		frame.getContentPane().add(textField);
		textField.setColumns(10);
		
		JButton btnNewButton = new JButton("7");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnNewButton.setBounds(12, 67, 63, 55);
		frame.getContentPane().add(btnNewButton);
		
		JButton btnNewButton_1 = new JButton("8");
		btnNewButton_1.setBounds(86, 67, 63, 55);
		frame.getContentPane().add(btnNewButton_1);
		
		JButton btnNewButton_2 = new JButton("9");
		btnNewButton_2.setBounds(161, 67, 63, 55);
		frame.getContentPane().add(btnNewButton_2);
		
		JButton btnNewButton_3 = new JButton("/");
		btnNewButton_3.setBounds(236, 67, 63, 55);
		frame.getContentPane().add(btnNewButton_3);
		
		JButton btnNewButton_4 = new JButton("4");
		btnNewButton_4.setBounds(12, 132, 63, 55);
		frame.getContentPane().add(btnNewButton_4);
		
		JButton btnNewButton_1_1 = new JButton("5");
		btnNewButton_1_1.setBounds(86, 132, 63, 55);
		frame.getContentPane().add(btnNewButton_1_1);
		
		JButton btnNewButton_2_1 = new JButton("6");
		btnNewButton_2_1.setBounds(161, 132, 63, 55);
		frame.getContentPane().add(btnNewButton_2_1);
		
		JButton btnNewButton_3_1 = new JButton("x");
		btnNewButton_3_1.setBounds(236, 132, 63, 55);
		frame.getContentPane().add(btnNewButton_3_1);
		
		JButton btnNewButton_5 = new JButton("1");
		btnNewButton_5.setBounds(12, 197, 63, 55);
		frame.getContentPane().add(btnNewButton_5);
		
		JButton btnNewButton_1_2 = new JButton("2");
		btnNewButton_1_2.setBounds(86, 197, 63, 55);
		frame.getContentPane().add(btnNewButton_1_2);
		
		JButton btnNewButton_2_2 = new JButton("3");
		btnNewButton_2_2.setBounds(161, 197, 63, 55);
		frame.getContentPane().add(btnNewButton_2_2);
		
		JButton btnNewButton_3_2 = new JButton("-");
		btnNewButton_3_2.setBounds(236, 197, 63, 55);
		frame.getContentPane().add(btnNewButton_3_2);
		
		JButton btnNewButton_6 = new JButton("c");
		btnNewButton_6.setBounds(11, 262, 63, 55);
		frame.getContentPane().add(btnNewButton_6);
		
		JButton btnNewButton_1_3 = new JButton("0");
		btnNewButton_1_3.setBounds(85, 262, 63, 55);
		frame.getContentPane().add(btnNewButton_1_3);
		
		JButton btnNewButton_2_3 = new JButton("=");
		btnNewButton_2_3.setBounds(160, 262, 63, 55);
		frame.getContentPane().add(btnNewButton_2_3);
		
		JButton btnNewButton_3_3 = new JButton("+");
		btnNewButton_3_3.setBounds(235, 262, 63, 55);
		frame.getContentPane().add(btnNewButton_3_3);
	}

}
