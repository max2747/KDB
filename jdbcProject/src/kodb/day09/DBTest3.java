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
		
		
		//DeptDTO�� ���� ���ʸ���
		List<DeptDTO> deptlist = new ArrayList<>();
		
		
		//throw�� �ϸ� �ڿ��ݳ��� �ȵȻ��¿��� ����Ǳ� ������(����������) try catch���� ������.
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next(); //�̷����ϸ� rs���� �ѹ��� �����͸� �а� ������.
			
			
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
