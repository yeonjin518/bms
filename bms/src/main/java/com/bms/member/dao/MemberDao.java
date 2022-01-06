package com.bms.member.dao;

import java.util.List;
import java.util.Map;

import com.bms.member.dto.MemberDto;

public interface MemberDao {
	
	public MemberDto login(Map<String,String> loginMap) throws Exception;
	public void insertNewMember(MemberDto memberDto) throws Exception;
	public String selectOverlappedID(String id) throws Exception;
	public List<String> findId(Map<String, String> accountMap) throws Exception;

}
