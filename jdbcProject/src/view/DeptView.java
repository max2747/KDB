package view;

import java.util.List;

import model.DeptDTO;

//View담당.... 업무로직 사용안한다... JSP코드 대치
public class DeptView {
	
	public static void print(List<DeptDTO> deptlist){
		System.out.println("============부서정보===========");
		for(DeptDTO d : deptlist){
			System.out.println(d);
		}
	}
	
}
