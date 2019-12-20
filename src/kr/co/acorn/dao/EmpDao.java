package kr.co.acorn.dao;

import kr.co.acorn.dto.EmpDto;

public class EmpDao {
	private static EmpDao single;
	
	public static EmpDao getInstance() {
		if (single == null) {
			single = new EmpDao();
		}
		return single;
	}



}
