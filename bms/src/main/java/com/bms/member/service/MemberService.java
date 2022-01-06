package com.bms.member.service;

import java.util.List;
import java.util.Map;

import com.bms.member.dto.MemberDto;

public interface MemberService {
	
	public MemberDto login(Map<String,String> loginMap) throws Exception;
	public void addMember(MemberDto memberDTO) throws Exception;
	public String overlapped(String id) throws Exception;
	public List<String> findAccount(Map<String, String> accountMap) throws Exception;

}
