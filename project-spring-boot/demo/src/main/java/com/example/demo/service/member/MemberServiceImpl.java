package com.example.demo.service.member;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.domain.dto.MemberDto;
import com.example.demo.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository memberRepository;

	public int getNextId() {
		return memberRepository.getNextId();
	};

	public List<MemberDto> findAll() {
		return memberRepository.findAll();
	};

	public int save(MemberDto memberDto) {
		return memberRepository.save(memberDto);
	};

	public int saveWithId(MemberDto memberDto) {
		return memberRepository.saveWithId(memberDto);
	};

	public Optional<MemberDto> findByEmail(String email) {
		return memberRepository.findByEmail(email);
	};
}