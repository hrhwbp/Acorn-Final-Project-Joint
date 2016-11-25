package com.remind.model;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.dao.DataAccessException;

import com.remind.controller.AnniversaryBean;
import com.remind.controller.BoardBean;
import com.remind.controller.FollowBean;
import com.remind.controller.LikeBean;
import com.remind.controller.MemberBean;
import com.remind.controller.ReplyBean;
import com.remind.controller.ScrollBean;
import com.remind.controller.WishlistBean;

public interface AnnoInter {
   // sns board
//   @Select("select b_no, b_image, b_content, b_date, b_like, (select m_name from member where m_no = b_mno) b_mname from board where b_mno = (select f_mno from follow where f_sno=#{m_no}) or b_mno = #{m_no}")
//   List<BoardDto> showBoard(String m_no);
   
	@Select("select distinct b_no, b_mno, b_image, b_content, b_date, b_like, (select m_name from member where m_no = b_mno) b_mname from board left outer join follow on b_mno = f_sno where b_mno = any(select f_mno from follow where f_sno = #{m_no}) or b_mno = #{m_no}  order by b_no desc limit 0,3")
   List<BoardDto> showBoard(String m_no);
   @Select("select distinct b_no, b_mno, b_image, b_content, b_date, b_like, (select m_name from member where m_no = b_mno) b_mname from board  left outer join follow on b_mno = f_sno where (b_mno = any(select f_mno from follow where f_sno = #{m_no}) or b_mno = #{m_no} )and b_no < #{last_b_no} order by b_no desc limit 0,3")
   List<BoardDto> scrollingBoard(ScrollBean bean);
   
   @Select("select max(b_no)+1 from board")
   String selectMaxNo();
   
   @Select("select * from board where b_no=#{b_no}")
   BoardDto showBoardDetail(String b_no);

   @Delete("delete from board where b_no=#{b_no}")
   boolean eraseBoard(String b_no);

   @Insert("insert into board (b_mno, b_image, b_content, b_like) values (#{b_mno}, #{b_image}, #{b_content}, 0)")
   boolean write(BoardBean bean);
   
   @Update("update board set b_content=#{b_content},b_image=#{b_image} where b_no=#{b_no}")
   boolean updateBoard(BoardBean bean);


	
	
	// member=================================================================================
	@Select("select * from board where b_mno = #{b_mno} order by b_no desc")
	List<BoardDto> showMyMain(String b_mno);
	@Select("select * from member where m_name like #{name} or m_email like #{name}")
	List<MemberDto> searchMember(String name);
	
	@Select("select * from member where m_no=#{m_no}")
	MemberDto showMemberDetail(String m_no);
	
	@Select("select * from member where m_name=#{m_name}")
	MemberDto memberDetail(String m_name);
	
	@Select("select count(*) from member where m_email=#{m_email_check}")
	Integer email_join_check(String m_email_check);
	
	@Insert("insert into member (m_name, m_bdate, m_email, m_gender, m_password, m_introduce) values (#{m_name}, #{m_bdate}, #{m_email}, #{m_gender}, #{m_password}, #{m_introduce})")
	boolean joinMember(MemberBean bean);
	
	@Delete("delete from member where m_no = #{m_no}")
	boolean outMember(String m_no);
	
	@Update("update member set m_name = #{m_name}, m_bdate = #{m_bdate}, m_image = #{m_image}, m_introduce = #{m_introduce} where m_no = #{m_no}")
	boolean updateMember(MemberBean bean);
	
	@Select("select * from member where m_email = #{m_email} and m_password = #{m_password}")
	MemberDto login(MemberBean bean);

   

  
   
   // follow
   // �굹瑜� �뙏濡쒖슦 �븳�궗�엺. 
   @Select("select f_no,f_mno,f_sno,m_name,m_image,m_email,f_ms from follow left outer join member on f_sno = m_no where f_mno = #{m_no}")
   List<FollowDto> showMyFollower(String m_no);
   // 
   @Select("select * from follow where f_sno = #{f_sno} and f_mno = #{f_mno}")
   FollowDto selectFollwer(FollowBean bean);
   
   // �궡媛� �뙏濡쒖슦 �븯怨좎엳�뒗�궗�엺
   @Select("select f_no,f_mno,f_sno,m_name,m_image,m_email,f_ms from follow left outer join member on f_mno = m_no where f_sno = #{m_no}")
   List<FollowDto> showIFollow(String m_no);
   
   @Insert("insert into follow (f_sno,f_mno,f_ms) values(#{f_sno},#{f_mno},#{f_ms})")
   boolean follow(FollowBean bean);   //f_sno占쏙옙 f_mno占쏙옙 follow
   
   @Delete("delete from follow where f_sno = #{f_sno} and f_mno = #{f_mno}")
   boolean followCancel(FollowBean bean);
   
   @Update("update follow set f_ms = 2 where f_no = #{f_no}")
   boolean followUpdate(String f_no);

   @Update("update follow set f_ms = 1 where f_no = #{f_no}")
   boolean followUpdate2(String f_no);
   
   // reply
   @Select("select r_no, r_bno, r_content, r_mno , r_date, (select m_name from member where m_no = r_mno) r_name from reply where r_bno = #{b_no} limit ${limit},5")
   List<ReplyDto> showReply(@Param("b_no") String b_no, @Param("limit")int limit);
   @Select("select count(*) from reply where r_bno = #{b_no}")
   int countreply(String b_no);
   
   @Select("select r_no, r_bno, r_content, r_date, (select m_name from member where m_no = r_mno) r_name from board "
         + "left outer join reply on b_no = r_bno where b_mno = (select f_mno from follow where f_sno=#{m_no}) or b_mno = #{m_no}")
   List<ReplyDto> showReplyall(String m_no);
   
   @Select("select * from reply where r_no = #{r_no}")
   ReplyDto showReplyDetail(String r_no);
   @Select("select r_no, r_bno, r_content, r_mno , r_date, (select m_name from member where m_no = r_mno) r_name from reply where r_bno = #{b_no}")
   List<ReplyDto> showReplyMore(String b_no);
   
   @Insert("insert into reply (r_mno, r_bno, r_content) values(#{r_mno}, #{r_bno},#{r_content})")
   boolean writeReply(ReplyBean bean);
   
   @Delete("delete from reply where r_no = #{r_no}")
   boolean deleteReply(String r_no);
   
   @Update("update reply set r_content = #{r_content} where r_no = #{r_no}")
   boolean updateReply(ReplyBean bean);
   
   
   //wishlist
   @Select("select * from wishlist where w_mno = #{w_mno}")
   List<WishlistDto> showWishList(String w_mno);
   
   @Select("select * from wishlist where w_no = #{w_no}")
   List<WishlistDto> showInsertedList(String w_no);
   
   @Insert("insert into wishlist (w_mno, w_pname, w_price, w_image, w_addr, w_detail, w_lock, g_num) values(#{w_mno}, #{w_pname}, #{w_price}, #{w_image}, #{w_addr}, #{w_detail}, #{w_lock}, #{g_num})")
   boolean writeWishlist(WishlistBean bean);
   
   @Delete("delete from wishlist where w_no = #{w_no}")
   boolean deleteWishlist(String w_pname);
   
   @Update("update wishlist set w_pname=#{w_pname}, w_price=#{w_price}, w_detail=#{w_detail} where w_no = #{w_no}")
   boolean updateWishlist(WishlistBean bean);
   
   @Update("update wishlist set w_lock=#{w_lock}, w_like=#{w_mno} where w_no = #{w_no}")
   boolean updateLock(WishlistBean bean);
   
   //WishGroup
   @Select("select * from wishgroup where wg_mno=#{wg_mno}")
   List<WishlistDto> showWishGroup(String wg_mno);
   
   @Select("select * from wishgroup where wg_no=#{wg_no}")
   WishlistDto showWishAGroup(String wg_no);
   
   @Insert("insert into wishgroup (wg_mno, wg_detail) values(#{wg_mno},#{wg_detail})")
   boolean insertWishGroup(WishlistBean bean);
   
   @Delete("delete from wishgroup where wg_no = #{wg_no}")
   boolean deleteWishGroup(String wg_no);
   
   @Update("update wishgroup set wg_detail=#{wg_detail} where wg_no = #{wg_no}")
   boolean updateWishGroup(WishlistBean bean);

   // like
   /*@Select("select l_bno, l_mno, (select m_name from member where m_no = l_mno) l_mname from likeTable left outer join board on l_bno = b_no "
         + "where b_mno = #{m_no} or b_mno = (select f_mno from follow where f_sno=#{m_no})")
   List<LikeDto> showLike(String m_no);
   */
   @Select("select l_bno, l_mno, (select m_name from member where m_no = l_mno) l_mname from likeTable where l_bno = #{b_no}")
   List<LikeDto> showLike(String b_no);
   
   @Select("select * from likeTable where l_bno = #{l_bno} and l_mno = #{l_mno}")
   LikeDto likeYN(LikeBean bean);
   
   /*@Select("select count(*) l_count, l_bno from likeTable left outer join board on l_bno = b_no "
         + "where b_mno = #{m_no} or b_mno = (select f_mno from follow where f_sno=#{m_no})")
   List<LikeDto> countLike(String m_no);
   */
   @Select("select count(*) l_count, l_bno from likeTable where l_bno = #{b_no}")
   LikeDto countLike(String b_no);
   
   @Insert("insert into likeTable (l_bno, l_mno) values(#{l_bno}, #{l_mno})")
   boolean like(LikeBean bean);
   @Update("update board set b_like=#{b_like} where b_no=#{b_no}")
   boolean likeupd(@Param("b_no") String b_no, @Param("b_like")String b_like);
   @Delete("delete from likeTable where l_bno = #{l_bno} and l_mno = #{l_mno} ")
   boolean likeCancel(LikeBean bean);
   
   //Anniversary
   @Select("SELECT distinct f_mno, a_no, a_mno, a_detail, a_date, (select m_image from member where m_no = a_mno) a_mimage, (select m_name from member where m_no = a_mno) a_mname,case when date_format(a_date, '%m-%d')>=date_format(curdate(),'%m-%d') then 1 else 2 end as sort, case when date_format(a_date, '%m-%d')>=date_format(curdate(),'%m-%d') then to_days(concat('16-',date_format(a_date, '%m-%d')))-to_days(now()) else to_days(concat('17-',date_format(a_date, '%m-%d')))-to_days(now()) end as a_dday from anniversary left outer join follow on a_mno = f_mno where f_sno = #{m_no} or a_mno = #{m_no} order by sort , date_format(a_date, '%m-%d') asc")
   List<AnniversaryDto> showAnniversary(String m_no);
   @Select("SELECT distinct f_mno, a_no, a_mno, a_detail, a_date, (select m_name from member where m_no = a_mno) a_mname,case when date_format(a_date, '%m-%d')>=date_format(curdate(),'%m-%d') then 1 else 2 end as sort, case when date_format(a_date, '%m-%d')>=date_format(curdate(),'%m-%d') then to_days(concat('16-',date_format(a_date, '%m-%d')))-to_days(now()) else to_days(concat('17-',date_format(a_date, '%m-%d')))-to_days(now()) end as a_dday from anniversary left outer join follow on a_mno = f_mno where f_sno = #{m_no} or a_mno = #{m_no} order by sort , date_format(a_date, '%m-%d') asc limit 0,5")
   List<AnniversaryDto> showAnniversaryPart(String m_no);
   @Insert("insert into anniversary (a_mno, a_date, a_detail) values(#{a_mno}, #{a_date},#{a_detail})")
   boolean insertAnniversary(AnniversaryBean bean);
   @Delete("delete from anniversary where a_no = #{a_no}")
   boolean deleteAnniversary(String a_no);
   @Update("update anniversary set a_detail = #{a_detail}, a_date = #{a_date} where a_no = #{a_no}")
   boolean updateAnniversary(AnniversaryBean bean);
}   