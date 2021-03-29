package com.example.demo.config.auth.dto;

import java.io.Serializable;

import com.example.demo.domain.dto.MemberDto;

import lombok.Getter;

@Getter
public class SessionMember implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String nickname;
	private String email;
	private String profileImg;

	public SessionMember(MemberDto member) {
		this.id = member.getId();
		this.nickname = member.getNickname();
		this.email = member.getEmail();
		this.profileImg = member.getProfileImg();
	}

}