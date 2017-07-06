package kodb.day09;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.DeptDTO;
import util.DBUtil;
import view.DeptView;

public class DBTest3 {

	public static void main(String[] args) {
		Connection conn = DBUtil.getConnect();
		Statement st = null;
		ResultSet rs = null;
		String sql = "select * from departments";
		
		
		//DeptDTO만 들어가는 제너릭스
		List<DeptDTO> deptlist = new ArrayList<>();
		
		
		//throw로 하면 자원반납이 안된상태에서 종료되기 때문에(비정상종료) try catch문을 써주자.
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next(); //이렇게하면 rs에서 한번만 데이터를 읽고 끝난다.
			
			
			while(rs.next()){
				int id = rs.getInt(1);
				String name = rs.getString(2);
				DeptDTO dept = new DeptDTO(id, name);
				deptlist.add(dept);
			}
			
			  
			DeptView.print(deptlist);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		DBUtil.dbclose(conn, st, rs);		
	}

}
