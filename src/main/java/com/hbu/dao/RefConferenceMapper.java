package com.hbu.dao;

import com.hbu.entity.RefConference;
import com.hbu.entity.RefConferenceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RefConferenceMapper {
    int countByExample(RefConferenceExample example);

    int deleteByExample(RefConferenceExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(RefConference record);

    int insertSelective(RefConference record);

    List<RefConference> selectByExample(RefConferenceExample example);

    RefConference selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") RefConference record, @Param("example") RefConferenceExample example);

    int updateByExample(@Param("record") RefConference record, @Param("example") RefConferenceExample example);

    int updateByPrimaryKeySelective(RefConference record);

    int updateByPrimaryKey(RefConference record);

    int count();//Query the total number of appointments

    List<RefConference> selectByDate(@Param("date") String date);
    List<RefConference> selectByDateRoomId(@Param("date") String date,@Param("conferenceRoomId") long conferenceRoomId);
    //int usedRoomId(@Param("date") String date,@Param("time") String time);//Query the id of the conference room that has been reserved under this condition
}