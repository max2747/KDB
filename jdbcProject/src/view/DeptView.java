package view;

import java.util.List;

import model.DeptDTO;

//View���.... �������� �����Ѵ�... JSP�ڵ� ��ġ
public class DeptView {
	
	public static void print(List<DeptDTO> deptlist){
		System.out.println("============�μ�����===========");
		for(DeptDTO d : deptlist){
			System.out.println(d);
		}
	}
	
}
