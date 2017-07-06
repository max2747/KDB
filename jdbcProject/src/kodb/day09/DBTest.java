package kodb.day09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest {

	public static void main(String[] args) {
		//DB���� ������ ���� ó�� ����������. (���߿� �� 3������ ���� �� �ݳ� ; rs, st, conn������ �ݳ�)
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		// TODO Auto-generated method stub
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select * from employees";
		//1. JDBC Driver load
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //class�̸��� �޸𸮿� �ø���.
			System.out.println("driver load����");
		//2. connection�� ����. (url, ID, password) �־���.
			conn = DriverManager.getConnection(url, "hr", "hr");
			System.out.println("DB���� ����");
			
		//3. Statement�� ��������� (conn�� ���� DB�� �����Ѵ�)
			st = conn.createStatement();
			rs = st.executeQuery(sql); //sql����� ResultSet���� �޾ƿ´�.
			//table�� �´�.
			
		//4. Į���� ���缭 ����� ���������.
			while(rs.next()){
				int id = rs.getInt(1); //������ ID�� ù��°.
				String fname = rs.getString("first_name"); //���°���� �𸣸� column�� �̸��� ����.
				System.out.println(id + "\t" + fname);
			}
			System.out.println("------��ȸ ����------------");
			
			
		}
			catch (ClassNotFoundException e){
			System.out.println("driver load����");
			e.printStackTrace(); //�̰� ��� error�� ������ �� �� ����.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB���� ����");
			e.printStackTrace();
		}finally{ //5. �� �������� �ڿ��� �ݳ�����(rs, st, conn ����)
			try {
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(conn != null) conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("���µ� ����");
				e.printStackTrace();
			}
			
		}
		
		
		
	}

}
