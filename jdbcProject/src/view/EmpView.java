package view;

import java.util.List;

import model.EmpDTO;

public class EmpView {

	
	public static void print(List<EmpDTO> emplist){
		System.out.println("======== 직원 여러건 =======");
		for(EmpDTO e : emplist){
			System.out.println(e);
		}
	}
}
