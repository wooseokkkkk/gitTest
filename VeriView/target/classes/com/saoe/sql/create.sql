select * from user_tables;
select * from user_constraints;
select * from user_sequences;


create table follow_member(
   followed_id varchar2(100) constraint followed_id_nn not null,
   follower_id varchar2(100) constraint follower_id_nn not null,
   f_date date default sysdate,
   foreign key (followed_id) references member(id),
   foreign key (follower_id) references member(id)
);


create sequence foreign_review_no
   increment by 1
   start with 1
   maxvalue 999999999999999
   nocache
   nocycle;
   
   
create table foreign_review(
	foreign_review_no number constraint pk_foreign_review_no primary key,
	code_no number,
	foreign_review_content varchar2(1000) constraint foreign_review_content_nn not null,
	foreign_review_score number(10) default 0,
	foreign_review_display varchar2(100) constraint foreign_review_display_nn not null,
	p_date date default sysdate,
	foreign key (code_no) references category(code_no)
);

