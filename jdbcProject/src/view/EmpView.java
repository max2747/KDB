package view;

import java.util.List;

import model.EmpDTO;

public class EmpView {

	
	public static void print(List<EmpDTO> emplist){
		System.out.println("======== ���� ������ =======");
		for(EmpDTO e : emplist){
			System.out.println(e);
		}
	}
}
