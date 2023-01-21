package com.hbu.dao;


import com.hbu.entity.TUser;
import com.hbu.entity.TUserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TUserMapper {
    int countByExample(TUserExample example);

    int deleteByExample(TUserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TUser record);

    int insertSelective(TUser record);

    List<TUser> selectByExample(TUserExample example);

    TUser selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TUser record, @Param("example") TUserExample example);

    int updateByExample(@Param("record") TUser record, @Param("example") TUserExample example);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);

    List<TUser> selectAll();

    TUser selectAllByUsername(@Param("username") String username);//Check all by username, username is the unique identifier

    List<TUser> selectByDepartment(@Param("department") String department); //Search all by department

    String selectDepartment(@Param("username") String username);//Find your department by username

    TUser selectByUUid(@Param("uuid") String uuid);//Find the user through uuid

    String selectByUsername(@Param("username") String username);  //Find out the password pw through username

    String selectMailByUsername(@Param("username") String username);  //Find out the mailbox through username
}