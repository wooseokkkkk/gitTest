		select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from review where review_no = 162
		) r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no
		
		select * from member;
		
		select id, count(id) from review where review_no in (SELECT review_no FROM review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_gb_date, 'YYYY-MM-DD')) and review_gb = 1) group by id
		
		select * from member
		
				select id, count(id) count from review where 365 >
		(TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_post_date,
		'YYYY-MM-DD')) group by id
		
		select id, nick, profile, member_score, grade from member order by member_score desc
		
		리뷰에 좋아요 된 개수
		select id, count(id) from review where review_no in (SELECT review_no FROM review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_gb_date, 'YYYY-MM-DD')) and review_gb = 1) group by id;
		select id, count(id) from review where review_no in (SELECT review_no FROM review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_gb_date, 'YYYY-MM-DD')) and review_gb = -1) group by id;
		
		리뷰 올린 점수
		select id, count(id) from review where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_post_date, 'YYYY-MM-DD')) group by id
		
		리뷰 신고
		select id, count(id) from review where review_no in (select review_no from review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_rep_date, 'YYYY-MM-DD')) and review_rep_yn = 1) group by id;
		
		리뷰 스크랩
		select id, count(id) from review where review_no in (select review_no from review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_scrap_date, 'YYYY-MM-DD')) and review_scrap_yn = 1) group by id;
		
		리뷰 차단
		select id, count(id) count from review where review_no in (select review_no from review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_block_date, 'YYYY-MM-DD')) and review_block_yn = 1) group by id;
		
		select id, count(id) count from review where review_no in (select review_no from review_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_block_date, 'YYYY-MM-DD')) and review_block_yn = 1) group by id;
		
		select id, count(id) count from review where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(review_post_date, 'YYYY-MM-DD')) group by id;
		
		멤버 팔로우
		select m.id id, count(mm.id) count from member m, member_member mm where m.id = mm.id and m.id in (select id from member_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(member_follow_date, 'YYYY-MM-DD')) and member_follow_yn = 1) group by mm.id;
		
		멤버 신고
		select id, count(id) count from member where id in (select id from member_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(member_report_date, 'YYYY-MM-DD')) and member_rep_yn = 1) group by id;
		
		멤버 차단
		select id, count(id) count from member where id in (select id from member_member where 7 > (TO_DATE(sysdate, 'YYYY-MM-DD') - TO_DATE(member_block_date, 'YYYY-MM-DD')) and member_block_yn = 1) group by id;
		
		select * from member_member;
		
		update member set member_score = 0 where id = '1';
		select
		
		
		
		
		select * from review;
		
				select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from review where review_no = 162) 
		) r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no



select m.id id, m.nick nick, m.profile profile, 
r.review_no review_no, r.review_content review_content, r.review_post_date review_post_date, r.review_update_date review_update_date,
rest.rest_no rest_no, rest.rest_name rest_name, rest.rest_addr rest_addr,
c.code_no code_no, c.main_cate main_cate, c.sub_cate sub_cate
from review r, member m, restaurant rest, category c 
where r.id = m.id 
and r.rest_no = rest.rest_no 
and rest.code_no = c.code_no
and r.id = '1';

select * from restaurant;

select distinct(r.review_no)
		review_no, r.review_content
		review_content,
		r.review_post_date
		review_post_date,
		rp.review_pic_src
		review_pic_src, rest.rest_no
		rest_no, rest.rest_name rest_name,
		rm.review_rep_content member_rep_content
		from
		review r, review_pic rp,
		restaurant rest, review_member rm
		where
		r.review_no = rp.review_no
		and r.rest_no = rest.rest_no
		and rm.actor_id
		= '1'
		and r.review_no = rm.review_no
		and rm.review_rep_yn = 1


select rest_no, rest_name from restaurant where rest_name like '%피자%';

select * from member_member;
select * from rest_member;
select * from review_member;

select * from member;

select id, nick, profile, member_score, grade from member order by member_score desc;


		select id, nick,
		profile from member where id in (select actor_id from member_member where
		id = '1' and member_follow_yn = 1)

select id, nick,
		profile from member where id in (select id from member_member where
		id = '1' and member_follow_yn = 1)
		
select id from member_member where actor_id = '1' and member_follow_yn = 1;
select review_no from review_member where actor_id = '1' and review_gb = 1;


select distinct(r.review_no)
		review_no,
		r.review_content review_content,
		r.review_post_date review_post_date,
		rp.review_pic_src
		review_pic_src,
		rest.rest_no rest_no,
		rest.rest_name rest_name
		from (select * from review where rest_no in (select rest_no
		from restaurant where code_no in
		((select code_no from category where sub_cate like '%면%')
		union (select code_no from category where main_cate like '%면%')))) r,
		review_pic rp,
		restaurant rest
		where r.review_no = rp.review_no
		and
		r.rest_no = rest.rest_no


		select
		r.review_no
		review_no, r.review_content review_content,
		r.review_post_date
		review_post_date,
		rp.review_pic_src review_pic_src,
		rest.rest_no
		rest_no, rest.rest_name rest_name
		from review r, review_pic
		rp,
		restaurant rest, review_member rm
		where r.review_no = rp.review_no
		and r.rest_no = rest.rest_no
		and rm.actor_id = '1'
		and r.review_no =
		rm.review_no
		and rm.review_scrap_yn = 1


select * from review_member;

		select distinct(r.review_no) review_no,
		r.review_content review_content,
		r.review_post_date review_post_date,
		rp.review_pic_src
		review_pic_src,
		rest.rest_no rest_no,
		rest.rest_name rest_name
		from (select * from review where rest_no in (select rest_no
		from restaurant where code_no in
		((select code_no from category where sub_cate like '%한식%')
		union (select code_no from category where main_cate like '%한식%')))) r,
		review_pic rp,
		restaurant rest
		where r.review_no = rp.review_no
		and
		r.rest_no = rest.rest_no

select distinct(r.review_no) review_no, 
		r.review_content review_content,
		r.review_post_date review_post_date,
		rp.review_pic_src review_pic_src, 
		rest.rest_no rest_no, 
		rest.rest_name rest_name
		from (select * from review where rest_no in (select rest_no from restaurant where code_no in
((select code_no from category where sub_cate like '%한식%')
union (select code_no from category where main_cate like '%한식%')))) r, review_pic rp,
		restaurant rest
		where r.review_no = rp.review_no
		and r.rest_no = rest.rest_no
		
		
select * from category where sub_cate like '%피자%';



or main_cate like '%한식%';


select rest.rest_no rest_no, rest.rest_name rest_name, rest.rest_profile
		rest_profile from restaurant rest  where
		rest.rest_name like '%피자%';
		
select id, nick, profile from member where nick like '%1%';


select * from member_member;

select * from member;

select * from review order by review_post_date desc;

select * from message;

select * from user_sequences;

select * from interests;


select * from 
		select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from( select * from review order by DBMS_RANDOM.RANDOM) <![CDATA[where rownum <= 10]]>) r, member m, restaurant rest, category c, member_member mm, review_member rm, interests i
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no
		and r.id = 

select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
from review r, interests i, member m, restaurant rest, category c
where m.id = i.id
and m.id = '1'
and rest.code_no in (select code_no from category where main_cate = (select main_cate from category where code_no = 1));
 
select * from category where sub_cate is null

(select code_no from category where main_cate = (select main_cate from category where code_no = 1));

(select * from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no = 1))));


select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from(
		select *
		from (select * from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no = 1))))
		order by DBMS_RANDOM.RANDOM) 
    		where rownum <= 10
		) r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no

select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from(
		select *
		from (select * from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no in (select code_no from interests where id = '1')))))
		order by DBMS_RANDOM.RANDOM) 
    		where rownum <= 10
		) r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no
		
select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from review where review_no in (select * from (select review_no from review where review_no in (select review_no from review 
where rest_no in (select rest_no from rest_member where actor_id = '1' and (rest_follow_yn = 1 or rest_gb = 1))
or review_no in (select review_no from review where id in (select id from member_member where actor_id = '1' and (member_follow_yn = 1)))) order by DBMS_RANDOM.RANDOM) where rownum <= 2)
		) r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no
		union
		select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from review where review_no in (select * from (select review_no from review 
where review_no in (select review_no from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no in (select code_no from interests where id = '1'))))) 
order by DBMS_RANDOM.RANDOM) where rownum <= 8)) r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no
		
		
		select m.id id, m.nick
		nick, m.profile profile,
		r.review_no review_no,
		r.review_content
		review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from review
		where review_no in (select * from (select review_no from review where
		review_no in (select review_no from review
		where rest_no in (select rest_no from rest_member where actor_id = #{id} and
		(rest_follow_yn = 1 or rest_gb = 1))
		or review_no in (select review_no from review where id in (select id
		from member_member where actor_id = #{id} and (member_follow_yn = 1))))
		order by DBMS_RANDOM.RANDOM) where <![CDATA[where rownum <= 2]]>)
		) r, member m,
		restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no =	rest.rest_no
		and rest.code_no = c.code_no
		union
		select m.id id, m.nick
		nick, m.profile profile,
		r.review_no review_no,
		r.review_content
		review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from review
		where review_no in (select * from (select review_no from review
		where review_no in (select review_no from review where rest_no in (select
		rest_no from restaurant where code_no in (select code_no from category
		where main_cate = (select main_cate from category where code_no in
		(select code_no from interests where id = #{id})))))
		order by DBMS_RANDOM.RANDOM) where <![CDATA[where rownum <= 8]]>)) r, member m, restaurant
		rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and
		rest.code_no = c.code_no
		
		
		
select * from review where review_no in 

select review_no from review where review_no in (select review_no from review 
where rest_no in (select rest_no from rest_member where actor_id = '1' and (rest_follow_yn = 1 or rest_gb = 1))
or review_no in (select review_no from review where id in (select id from member_member where actor_id = '1' and (member_follow_yn = 1)))) order by DBMS_RANDOM.RANDOM

select 

select * from review where review_no in (select * from (select review_no from review where review_no in (select review_no from review 
where rest_no in (select rest_no from rest_member where actor_id = '1' and (rest_follow_yn = 1 or rest_gb = 1))
or review_no in (select review_no from review where id in (select id from member_member where actor_id = '1' and (member_follow_yn = 1)))) order by DBMS_RANDOM.RANDOM) where rownum <= 2)
union
select * from review where review_no in (select * from (select review_no from review 
where review_no in (select review_no from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no in (select code_no from interests where id = '1'))))) 
order by DBMS_RANDOM.RANDOM) where rownum <= 8)


select * from review where review_no in (select * from (select review_no from review 
where review_no in (select review_no from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no in (select code_no from interests where id = '1'))))) 
order by DBMS_RANDOM.RANDOM) where rownum <= 8)

select * from interests;
select code_no from interests where id = '1'
select * from category where code_no in (select code_no from interests where id = '1')
select code_no from category where main_cate = (select main_cate from category where code_no in (select code_no from interests where id = '1'))



select rest_no from review where review_no in (select review_no from review where id in (select id from member_member where actor_id = '1' and (member_follow_yn = 1)))


select rest_no from review where rest_no in (select rest_no from restaurant where rest_no in(select rest_no from rest_member where actor_id = '1' and (rest_follow_yn = 1 or rest_gb = 1)))
union
select * from review where id in (select id from member_member where actor_id = '1' and (member_follow_yn = 1))
union
select * from review where rest_no in (select rest_no from restaurant where code_no in (select code_no from category where main_cate = (select main_cate from category where code_no in (select code_no from interests where id = '1'))));



select * from member_member where acotr_id
select * from review where rest_no in (select rest_no from restaurant where rest_no in(select rest_no from rest_member where actor_id = '1' and (rest_follow_yn = 1 or rest_gb = 1)));


select rest_no from rest_member where actor_id = '1' and (rest_follow_yn = 1 or rest_gb = 1)


		
select code_no from interests where id = '1';		
		
		
insert into interests values ('1', 1);
		
select * from interests		
		
select * from user_tables;		

insert into category values (101, '카페', '도넛');
insert into category values (102, '카페', '초콜릿전문점');
insert into category values (103, '한식', '장어,먹장어요리');
insert into category values (104, '한식', '백숙, 삼계탕');
insert into category values (105, '한식', '닭요리');

update restaurant set code_no = 101 where code_no = 1;
update restaurant set code_no = 102 where code_no = 2;
update restaurant set code_no = 103 where code_no = 3;
update restaurant set code_no = 104 where code_no = 4;
update restaurant set code_no = 105 where code_no = 5;

update category set main_cate='한식', sub_cate= null where code_no = 1;
update category set main_cate='중식', sub_cate= null where code_no = 2;
update category set main_cate='일식', sub_cate= null where code_no = 3;
update category set main_cate='양식', sub_cate= null where code_no = 4;
update category set main_cate='카페', sub_cate= null where code_no = 5;

select * from category;

select code_no.nextval from dual;

select * from category;

select * from category;


select rest.rest_no rest_no, rest.rest_name rest_name, rest.rest_profile
		rest_profile from restaurant rest, rest_member rest_m where
		rest_m.actor_id = '1' and rest_m.rest_follow_yn = 1 and rest.rest_no = rest_m.rest_no
		
select m.id id, m.nick nick from member m, member_member mm
where m.id = mm.actor_id and mm.actor_id in (select actor_id from member_member where id = '1' and member_follow_yn = 1) and member_follow_yn = 1;

select actor_id from member_member where id = '1' and member_follow_yn = 1

		select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no,
		r.review_content review_content, r.review_post_date review_post_date,
		r.review_update_date review_update_date,
		rest.rest_no rest_no,
		rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no,
		c.main_cate main_cate, c.sub_cate sub_cate
		from review r, member m, restaurant rest, category c
		where r.id = m.id
		and
		r.rest_no = rest.rest_no
		and rest.code_no = c.code_no
		and rest.rest_no = 516

		select * from review where rest_no = 516;
		select * from restaurant;


select
		distinct(r.review_no)
		review_no, r.review_content review_content,
		r.review_post_date
		review_post_date,
		rp.review_pic_src review_pic_src,
		rest.rest_no
		rest_no, rest.rest_name rest_name
		from review r, review_pic rp,
		restaurant rest, review_member rm
		where rm.actor_id = '1'
		and r.rest_no = rest.rest_no
		and r.review_no = rp.review_no
		and r.review_no = rm.review_no
		and rm.review_gb = 1
		
select r.rest_no rest_no, r.code_no code_no, r.rest_name rest_name, r.rest_profile rest_profile, r.rest_tel rest_tel, r.rest_addr rest_addr, r.rest_addr2 rest_addr2,
r.rest_naver_score rest_naver_score, r.rest_kakao_score rest_kakao_score, r.rest_google_score rest_google_score,
r.rest_score rest_score, r.rest_post_date rest_post_date,
c.main_cate main_cate, c.sub_cate sub_cate
from restaurant r, category c 
where r.rest_no = 379 and r.code_no = c.code_no;

select * from restaurant where rest_no = 379;

		
select * from restaurant;

		
		
select * from review_pic group by review_no;
		
select
		r.review_no
		review_no, r.review_content review_content,
		r.review_post_date
		review_post_date,
		rp.review_pic_src review_pic_src,
		rest.rest_no
		rest_no, rest.rest_name rest_name
		from review r, review_pic
		rp,
		restaurant rest, review_member rm
		where r.review_no = rp.review_no
		and r.rest_no = rest.rest_no
		and rm.actor_id = '1'
		and r.review_no =
		rm.review_no
		and rm.review_gb = 1		
		

update review set id = 'admin';

select * from RESTAURANT where rest_name like '%그%';

select * from review
    order by DBMS_RANDOM.RANDOM
    
    		select * from
		review_pic where review_no = 9057;
		
		select * from review where review_no = 27025;
		
		select * from restaurant where rest_no = 882;
		
select * from category;
		


select * from member_member;
select * from review_member;
select * from rest_member;

update review set review_post_date = sysdate;

select * from review order by review_no desc;

select * from restaurant where rest_no = 1;

select * from review where rownum < 10;

		select m.id id, m.nick nick, m.profile profile,
		r.review_no review_no, r.review_content review_content, r.review_post_date review_post_date, r.review_update_date review_update_date,
		rest.rest_no rest_no, rest.rest_name rest_name, rest.rest_addr rest_addr,
		c.code_no code_no, c.main_cate main_cate, c.sub_cate sub_cate
		from (select * from(
    select * from review
    order by DBMS_RANDOM.RANDOM
) where rownum < 10) r, member m, restaurant rest, category c
		where r.id = m.id
		and r.rest_no = rest.rest_no
		and rest.code_no = c.code_no

		

		select * from review
		order by DBMS_RANDOM.RANDOM



select rest.rest_no rest_no, rest.rest_name rest_name, rest.rest_profile rest_profile from restaurant rest, rest_member rest_m where rest_m.actor_id = '2' and rest_m.rest_follow_yn = 1;

select rest_no, rest_name from restaurant where rest_name like '%그%';

select * from restaurant;

		select r.review_no
		review_no, r.review_content review_content,
		r.review_post_date
		review_post_date,
		rp.review_pic_src review_pic_src, rest.rest_no
		rest_no, rest.rest_name rest_name
		from review r, review_pic rp,
		restaurant rest, review_member rm
		where r.review_no = rp.review_no
		and r.rest_no =
		rest.rest_no
		and rm.actor_id = '2'
		and r.review_no = rm.review_no
		and rm.review_gb = 1;


select id, nick, profile from member where id in (select actor_id from member_member where id = '2' and member_follow_yn = 1);
select id, nick, profile from member where id in (select id from member_member where actor_id = '2' and member_follow_yn = 1);
select id from	member_member where	actor_id = '2' and member_rep_yn = 1;
		
		select m.id id,	m.nick nick, m.profile profile, mm.member_rep_content member_rep_content 
		from member m, (select * from member_member where actor_id = '2' and member_rep_yn = 1) mm 
		where m.id = mm.id;

		select m.id id,
		m.nick nick, m.profile profile from member m, member_member mm where
		m.id = mm.id and mm.member_follow_yn = 1 and mm.id= 2;

				select m.id id,
		m.nick nick, m.profile profile from member m, member_member mm where
		m.id = mm.id and mm.member_follow_yn = 1 and mm.actor_id= 2;
		
select r.review_no review_no, r.review_content review_content, r.review_post_date review_post_date,
rp.review_pic_src review_pic_src, rest.rest_no rest_no, rest.rest_name rest_name
from review r, review_pic rp, restaurant rest
where r.review_no = rp.review_no
and r.rest_no = rest.rest_no
and r.id = '1';

select m.id id, m.nick nick, m.profile profile from member m, member_member mm where m.id = mm.id and mm.member_follow_yn = 1 and m.id='1';
select m.id id, m.nick nick, m.profile profile from member m, member_member mm where m.id = mm.actor_id and mm.member_follow_yn = 1 and m.id= '1';


select * from member_member;

select  from review r, review_pic rp where r.review_no = rp.review_no group by rp.review_no;

select * from review_pic

select id, nick, profile from member where id in (select id from member_member where actor_id = '1' and member_follow_yn = 1);

select id, nick, profile from member where id in (select id from member_member where id = '1' and member_follow_yn = 1);

insert into MEMBER_MEMBER (id, actor_id, member_follow_yn) values ('1', '2', 1);
insert into MEMBER_MEMBER (id, actor_id, member_follow_yn) values ('2', '1', 1);

select * from member_member;

select * from member;

select distinct(main_cate) as main_cate from category

select * from review_member;

select * from review_pic;

select * from member;

alter table review add review_update_date date;

select * from review order by review_post_date desc;

select id, nick, profile from member where id = '1';

ALTER TABLE restaurant MODIFY (rest_content NULL);

select id from member where id in (select id from member_member where actor_id = '1');

create sequence code_no
increment by 1
start with 1
maxvalue 999999999999999
nocache
nocycle;

select rest_no, code_no, rest_name from restaurant where rest_no = 1;

select * from category where code_no = 1;

select * from reply where review_no = 1;

select * from review_pic where review_no = 1;

select * from review_pic;

insert into reply (reply_no, review_no, reply_date, id, reply_content, parent_no) values (reply_no.nextval, 2, sysdate, '1', '내용', null);

select * from reply order by reply_date;


select * from member_member where id = '1' or actor_id = '1';

select * from reply where review_no = 2 order by reply_date desc

select * from member_member;
select * from review_member;

select * from user_sequences;

select * from review;

select * from RESTAURANT;

select * from member where id = '1';

alter table member add profile_message varchar2(200);

select * from member;

alter table member modify grade invisible;

select * from REST_MEMBER;

select * from review;
select * from review_pic;

select * from member;
insert into review(review_no, id, foreign_review_url, code_no,
		review_content, review_score, review_display, review_post_date)
		values
		(0, '1', null, 1,
		'내용', 0, 1, sysdate)
		
update member set pw = '1', nick = '닉네임', tel = '전화번호', addr = '주소' where id = '1';

select * from user_tables;

drop table review_member;

drop table review_pic;

drop table reply;

drop table message;

drop table review;

create table review(
review_no number constraint pk_review_no primary key,
id varchar2(100),
foreign_review_url varchar2(1000),
rest_no number,
review_content varchar2(1000) constraint review_content_nn not null,
review_score number(10,2) default 0,
review_display number(1) default 1,
review_post_date date,
review_update_date date,
foreign key (id) references member(id),
foreign key (rest_no) references restaurant(rest_no)
);

create table message(
send_id varchar2(100) constraint message_send_id_nn not null,
receive_id varchar2(100) constraint message_receive_id_nn not null,
message_date date,
message_content varchar2(500) constraint message_content_nn not null,
review_no number,
foreign key (send_id) references member(id),
foreign key (receive_id) references member(id),
foreign key (review_no) references review(review_no)
);

create table reply(
reply_no number constraint pk_reply_no primary key,
review_no number constraint review_reply_no_nn not null,
reply_date date,
id varchar2(100) constraint reply_id_nn not null,
reply_content varchar2(100) constraint reply_content_nn not null,
parent_no number(10),
foreign key (review_no) references review(review_no),
foreign key (id) references member(id),
foreign key (parent_no) references reply(reply_no)
);

create sequence review_pic_no
increment by 1
start with 1
maxvalue 999999999999999
nocache
nocycle;


create table review_pic(
review_pic_no number constraint pk_review_pic_no primary key,
review_no number constraint review_pic_no_nn not null,
review_pic_title varchar2(100) constraint review_pic_title_nn not null,
review_pic_type varchar2(100) constraint review_pic_type_nn not null,
review_pic_src varchar2(500) constraint review_pic_src_nn not null,
review_pic_size number(20) constraint review_pic_size_nn not null,
foreign key (review_no) references review(review_no)
);

create table review_member(
review_no number constraint review_member_review_no_nn not null,
actor_id varchar2(100) constraint review_member_actor_id_nn not null,
review_scrap_yn number(1),
review_gb number(1),
review_block_yn number(1),
review_rep_yn number(1),
review_rep_content varchar2(100),
review_scrap_date date,
review_gb_date date,
review_block_date date,
review_rep_date date,
foreign key (review_no) references review(review_no),
foreign key (actor_id) references member(id)
);

drop table review_pic;

drop table rest_pic;

create table rest_pic(
rest_pic_no number constraint pk_rest_pic_no primary key,
rest_no number constraint rest_pic_no_nn not null,
rest_pic_src varchar2(500) constraint rest_pic_src_nn not null,
rest_pic_size number(20) constraint rest_pic_size_nn not null,
foreign key (rest_no) references restaurant(rest_no)
);

create table review_pic(
review_pic_no number constraint pk_review_pic_no primary key,
review_no number constraint review_pic_no_nn not null,
review_pic_src varchar2(500) constraint review_pic_src_nn not null,
review_pic_size number(20) constraint review_pic_size_nn not null,
foreign key (review_no) references review(review_no)
);

alter table category rename column middle_cate to sub_cate;

select * from user_tables;

select * from restaurant;

select * from rest_pic;

insert into restaurant values (1, 1, '그냥백반', '/file/rest/profile.png', '000-000-0000', '광주 동구', null, null, null, '백반집입니다.', 0, sysdate);

select * from category;

delete from category;

drop table category;

insert into category values (1, '한식', '백반');

select * from member;
		
select * from member_member;

select * from message;

select * from restaurant;

select * from user_constraints;

select * from review_member;

select * from message where send_id = '1' or receive_id = '1';

select * from review_member where actor_id = '1';

MERGE INTO review_member
		USING DUAL
		ON (review_no = 6 AND actor_id = 1)
		WHEN NOT
		MATCHED THEN
		INSERT (review_no, actor_id, review_scrap_yn,
		review_scrap_date)
		values (6, 1, 1, sysdate)
		WHEN MATCHED
		THEN
		UPDATE SET
		review_scrap_yn = 1, review_scrap_date = sysdate

create table review_member(
review_no number constraint review_member_review_no_nn not null,
actor_id varchar2(100) constraint review_member_actor_id_nn not null,
review_scrap_yn number(1),
review_gb number(1),
review_block_yn number(1),
review_rep_yn number(1),
review_rep_content varchar2(100),
review_scrap_date date,
review_gb_date date,
review_block_date date,
review_rep_date date,
foreign key (review_no) references review(review_no),
foreign key (actor_id) references member(id)
);

drop table member_member;
drop table review_member;
drop table rest_member;

select * from user_tables;

update review set review_content = '424214', review_update_date = sysdate where review_no = 7;

select * from user_tables;
select * from user_constraints;

select * from REVIEW_MEMBER where exists (select * from REVIEW_MEMBER where actor_id = '7');


update REVIEW_MEMBER set review_scrap_yn = 1 where actor_id = 7 and review_no = 1;

		MERGE INTO review_member
		USING DUAL
		ON (review_no = 6 AND actor_id = '1')
		WHEN NOT MATCHED THEN
			INSERT (review_no, actor_id, review_scrap_yn, review_scrap_date)
			values (6, '1', 1, sysdate)
		WHEN MATCHED THEN
		UPDATE SET
		review_scrap_yn = 1, review_scrap_date = sysdate		
		

select * from review_member;
select * from member_member;


create table review_member(
review_no number constraint review_member_review_no_nn not null,
actor_id varchar2(100) constraint review_member_actor_id_nn not null,
review_scrap_yn number(1),
review_gb number(1),
review_block_yn number(1),
review_rep_yn number(1),
review_rep_content varchar2(100),
review_scrap_date date,
review_gb_date date,
review_block_date date,
review_rep_date date,
foreign key (review_no) references review(review_no),
foreign key (actor_id) references member(id)
);

select * from review_pic where review_no = 1;
select * from reply where review_no = 1;

select * from review where review_no = '7';

update review set review_display = 1;
update review set review_display = 0 where review_no = 7;

select * from review;
select * from review_pic;
select * from reply;

insert into reply values (1, 4, sysdate, 1, 'dfsdfsdf', null);

select * from review order by review_post_date desc;

select * from review_pic where review_no = 4;

select * from category;

insert into category values (1, 'main', 'middle');

select * from member;

begin
    for r in ( select table_name, constraint_name
               from user_constraints
               where constraint_type = 'R' )
    loop
        execute immediate 'alter table '|| r.table_name
                          ||' drop constraint '|| r.constraint_name;
    end loop;
end;

drop table category;
drop table follow_member;
drop table interests;
drop table member;
drop table reply;
drop table category;
drop table review;
drop table review_rep;


select * from member;


create table category(
   code_no number constraint pk_category_code_no primary key,
   main_cate varchar2(10) constraint main_cate_nn not null,
   middle_cate varchar2(10) constraint middle_cate_nn not null,
   sub_cate varchar2(50) constraint sub_cate_nn not null,
	code varchar2(10) constraint code_nn not null
);

select * from review_pic;

SELECT * FROM USER_CONSTRAINTS;

select * from user_sequences;

select * from category;

select * from review;

select * from review_pic;


insert into review(review_no, id, code_no, review_content, review_score, review_display, p_date)
		values (review_no.nextval, 'id',  1, 'test', 0, 0, sysdate);

SELECT review_no.CURRVAL AS review_no FROM DUAL;


insert into category (code_no, main_cate, middle_cate, sub_cate, code) values (1, 'ma', 'mid', 'sub', 'code');

drop table member;

delete from member;


create table member(
	id varchar2(20) constraint pk_member_id primary key,
	pw varchar2(20) constraint pw_nn not null,
	name varchar2(50),
	nick varchar2(20) constraint nick_nn not null,
	tel varchar2(20),
	addr varchar2(50) constraint addr_nn not null,
	birth varchar2(50) constraint birth_nn not null,
	gender varchar2(10) constraint gender_nn not null,
	j_date date default sysdate,
	total_score varchar2(100) default 0,
	grade varchar2(10) default 0
);


insert into member (id, pw, name, nick, tel, addr, birth, gender, total_score, grade) values ('1', '1', '1', '1', '1', '1', '1', '남', 0, '0');

select * from member where id = '1' and pw = '1';

select last_insert_id();


create sequence review_no
   increment by 1
   start with 1
   maxvalue 999999999999999
   nocache
   nocycle;
   
   
create table review_pic(
	review_pic_no number constraint pk_review_pic_no primary key,
	review_no number constraint review_no_nn not null,
	review_pic_title varchar2(100) constraint review_pic_title_nn not null,
	review_pic_type varchar2(10) constraint review_pic_type_nn not null,
	review_pic_src varchar2(500) constraint review_pic_src_nn not null,
	review_pic_size varchar2(20) constraint review_pic_size_nn not null,
	foreign key (review_no) references review(review_no)
);

--select * from review_pic;

alter table review 

insert into review_pic(review_pic_no, review_no, review_pic_title, review_pic_type, review_pic_src, REVIEW_PIC_SIZE)
		values (review_pic_no.nextval, 3, 'title', 'type', 'src', 'size');


create sequence review_pic_no
   increment by 1
   start with 1
   maxvalue 999999999999999
   nocache
   nocycle;
   
   
 