package com.example.demo.service.project;

import java.util.List;

import com.example.demo.domain.dto.CommunityDto;
import com.example.demo.domain.vo.CommunityVo;

public interface CommunityService {

	public List<CommunityVo> findByProjectId(Integer projectId, Integer category);
	
	public List<CommunityVo> findReply(Integer parentId);

	public CommunityVo findById(Integer id);

	public void save(CommunityDto communityDto);

	public void saveReply(CommunityDto communityDto);
	
	public int getCount(Integer projectId);

	public void update(CommunityDto communityDto);

	public void delete(Integer communityId);
}
