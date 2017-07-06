package model;


//DTO(Data Transfer Object)... data를 전달하는 틀
//VO(Value Object)... data를 넣는 가방
//JavaBeans규격서... 멤버변수+기본생성자+getter/setter
public class DeptDTO {
	private int department_id; //table의 칼럼 이름이랑 같이 두는게 좋음 ( Department table의 컬럼 )
	private String department_name;
	
	public DeptDTO(){}
	
	
	public DeptDTO(int department_id, String department_name){
		super();
		this.department_id = department_id;
		this.department_name = department_name;
	}
	
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}


	@Override
	public String toString() {
		return "DeptDTO [department_id=" + department_id + ", department_name=" + department_name + "]";
	}
	
	
	
}
