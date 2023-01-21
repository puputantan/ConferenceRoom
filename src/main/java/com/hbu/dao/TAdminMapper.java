package com.hbu.dao;

import com.hbu.entity.TAdmin;
import com.hbu.entity.TAdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TAdminMapper {
    int countByExample(TAdminExample example);

    int deleteByExample(TAdminExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TAdmin record);

    int insertSelective(TAdmin record);

    List<TAdmin> selectByExample(TAdminExample example);

    TAdmin selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TAdmin record, @Param("example") TAdminExample example);

    int updateByExample(@Param("record") TAdmin record, @Param("example") TAdminExample example);

    int updateByPrimaryKeySelective(TAdmin record);

    int updateByPrimaryKey(TAdmin record);

    //Find out the password pw through the job number
    String selectByUsername(@Param("username") String username);

    //Find out the mailbox through the job number
    String selectMailByUsername(@Param("username") String username);
}