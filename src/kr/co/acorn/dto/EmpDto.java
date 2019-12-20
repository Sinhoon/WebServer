package kr.co.acorn.dto;

public class EmpDto {
	private int no;
	private String name;
	private String job;
	private String hiredate;
	private int mgr;
	private int sal;
	private int comm;
	private DeptDto depto;

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getName() {
		return name;
	}


	public DeptDto getDepto() {
		return depto;
	}


	public void setDto(DeptDto depto) {
		this.depto = depto;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getHiredate() {
		return hiredate;
	}


	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}


	public int getMgr() {
		return mgr;
	}


	public void setMgr(int mgr) {
		this.mgr = mgr;
	}


	public int getSal() {
		return sal;
	}


	public void setSal(int sal) {
		this.sal = sal;
	}


	public int getComm() {
		return comm;
	}


	public void setComm(int comm) {
		this.comm = comm;
	}


	public EmpDto() {
		super();
		// TODO Auto-generated constructor stub
	}

}
