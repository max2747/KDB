package kodb.day09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBTest {

	public static void main(String[] args) {
		//DB관련 변수는 제일 처음 선언해주자. (나중에 이 3가지를 전부 다 반납 ; rs, st, conn순으로 반납)
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		// TODO Auto-generated method stub
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql = "select * from employees";
		//1. JDBC Driver load
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver"); //class이름을 메모리에 올린다.
			System.out.println("driver load성공");
		//2. connection을 생성. (url, ID, password) 넣어줌.
			conn = DriverManager.getConnection(url, "hr", "hr");
			System.out.println("DB연결 성공");
			
		//3. Statement를 만들어주자 (conn을 통해 DB와 연결한다)
			st = conn.createStatement();
			rs = st.executeQuery(sql); //sql결과를 ResultSet으로 받아온다.
			//table로 온다.
			
		//4. 칼럼에 맞춰서 결과를 출력해주자.
			while(rs.next()){
				int id = rs.getInt(1); //직원의 ID는 첫번째.
				String fname = rs.getString("first_name"); //몇번째인지 모르면 column의 이름을 주자.
				System.out.println(id + "\t" + fname);
			}
			System.out.println("------조회 성공------------");
			
			
		}
			catch (ClassNotFoundException e){
			System.out.println("driver load실패");
			e.printStackTrace(); //이거 써야 error의 과정을 볼 수 있음.
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}finally{ //5. 꼭 마지막에 자원을 반납하자(rs, st, conn 순서)
			try {
				if(rs != null) rs.close();
				if(st != null) st.close();
				if(conn != null) conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("끄는데 오류");
				e.printStackTrace();
			}
			
		}
		
		
		
	}

}
