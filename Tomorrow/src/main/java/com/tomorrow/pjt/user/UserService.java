package com.tomorrow.pjt.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tomorrow.pjt.Const;
import com.tomorrow.pjt.common.SecurityUtils;
import com.tomorrow.pjt.user.model.UserDMI;
import com.tomorrow.pjt.user.model.UserPARAM;
import com.tomorrow.pjt.user.model.UserVO;

@Service
public class UserService 
{
	@Autowired
	private UserMapper mapper;
	
	/*
	 * @Autowired private ProdMapper prodMapper;
	 */
	
	//1번 로그인 성공, 2번 아이디 없음, 3번 비번 틀림
	public int login(UserPARAM param) 
	{
		if(param.getUser_id().equals("")) { return Const.NO_ID; }
		
		UserDMI dbUser = mapper.selUser(param);		
		if(dbUser == null) { return Const.NO_ID; }
		
		String cryptPw = SecurityUtils.getEncrypt(param.getUser_pw(), dbUser.getSalt());
		if(!cryptPw.equals(dbUser.getUser_pw())) { return Const.NO_PW; }
		
		param.setI_user(dbUser.getI_user());
		param.setUser_pw(null);
		param.setNm(dbUser.getNm());
		return Const.SUCCESS;		
	}
	
	public int join(UserVO param) 
	{
		String pw = param.getUser_pw();
		String salt = SecurityUtils.generateSalt();
		String cryptPw = SecurityUtils.getEncrypt(pw, salt);
		
		param.setSalt(salt);
		param.setUser_pw(cryptPw);
		
		return mapper.insUser(param);
	}
	
	public int ajaxToggleFavorite(UserPARAM param) //i_user, i_proc, proc_type
	{
		switch(param.getProc_type()) 
		{
		case "ins":
			return mapper.insFavorite(param);
		case "del":
			return mapper.delFavorite(param);
		}
		return 0;
	}
	
	/*
	 * public List<UserDMI> selFavoriteList(UserPARAM param) { List<UserDMI> list =
	 * mapper.selFavoriteList(param);
	 * 
	 * for(UserDMI vo : list) { ProdPARAM param2 = new ProdPARAM();
	 * param2.setI_rest(vo.getI_rest());
	 * 
	 * List<ProdRecMenuVO> eachRecMenuList = prodMapper.selProdRecMenus(param2);
	 * vo.setMenuList(eachRecMenuList); }
	 * 
	 * return list; }
	 */
}
