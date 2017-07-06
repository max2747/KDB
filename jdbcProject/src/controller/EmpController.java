package controller;

import java.util.List;

import model.EmpDAO;
import model.EmpDTO;
import view.EmpView;

public class EmpController {

	public static void main(String[] args) {
		// 20번 부서의 직원을 조회
		int deptid = 20;
		EmpDAO dao = new EmpDAO();
		List<EmpDTO>emplist = dao.selectByDept(deptid);
		EmpView.print(emplist);
		
	}

}
