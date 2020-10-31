package com.tomorrow.pjt.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tomorrow.pjt.user.model.UserDMI;
import com.tomorrow.pjt.user.model.UserPARAM;
import com.tomorrow.pjt.user.model.UserVO;

@Mapper
public interface UserMapper 
{
	int insUser(UserVO param);
	int insFavorite(UserPARAM param);
	int delFavorite(UserPARAM param);
	UserDMI selUser(UserPARAM param);
	List<UserDMI> selFavoriteList(UserPARAM param);
}
