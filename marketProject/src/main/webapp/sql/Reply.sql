-- reply테이블
-- 1) 테이블 생성
create table reply(
    seq number not null,             -- 글번호
    id varchar2(30) not null,        -- 작성자id
    re_ref number not null,          --원글 번호(seq)값과 동일
    re_seq number not null,          --답글의 정렬을 위한 seq변수
    re_lev number not null,          -- 답글의 레벨을 결정하는 변수(답글이 어느 글의 답글인지 분류)
    logtime date                     -- 작성일 
);

-- 시퀀스 객체 생성 및 삭제
create sequence seq_reply nocache nocycle;
drop sequence seq_reply;

update reply set re_seq= re_seq+1 where re_ref=#{re_ref} and re_seq > #{re_seq}

-- reply용 내용만 추가
insert into reply values(seq_store.nextval,null,null,null,null,null,'werew',null,0,seq_store.currval,0,0,sysdate);

	
select *from
(select rownum rn, tt.* from
(select *from reply order by re_ref desc,re_seq asc)tt)
where rn>=1 and rn<=100 and re_ref=3 and re_lev >0;

update reply set content=#{content},logtime=sysdate where seq=1

--기존 답글의 등록 순서 재정리
--원글 re_seq 보다 큰 답글 re_seq를 1씩증가

update reply set re_seq= re_seq+1
where re_ref=77 and re_seq >0;


commit;
