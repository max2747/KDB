package kodb.day09;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest2 {

	public static Connection getConnect() throws SQLException{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("connect failed");
			e.printStackTrace();
		}
		Connection conn = DriverManager.getConnection(url,"hr","hr");
		return conn;
	}
	
	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		//직원의 정보.... 직원번호, 이름, 급여, 입사일, 부서이름
		Connection conn = getConnect();
		Statement st;
		ResultSet rs;
		String sql = "select employee_id, first_name, salary,"+
					 "hire_date, department_name "+
					 "from employees join departments using(department_id)";
		
		st = conn.createStatement();
		rs = st.executeQuery(sql);
		
		while(rs.next()){
			int employee_id = rs.getInt("employee_id");
			String first_name = rs.getString("first_name");
			int salary = rs.getInt("salary");
			Date hire_date = rs.getDate("hire_date");
			String dept_name = rs.getString("department_name");
			
			System.out.println(employee_id +" " + first_name +" "+ salary +" "+hire_date+" "+dept_name);
		}
		
		if(rs != null) rs.close();
		if(st != null)st.close();
		if(conn != null)conn.close();
		
	}

}
