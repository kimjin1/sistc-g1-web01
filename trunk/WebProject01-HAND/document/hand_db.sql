--회원
drop table p_person;
create table p_person(id varchar2(10) primary key,
                      pw varchar2(10) not null,
                      name varchar2(30) not null,
                      birth date,
                      nickname varchar2(30) not null,
                      joinus date default sysdate,
                      memo varchar2(1000),
                      email varchar2(50),
                      photo varchar2(1000),
                      homepage varchar2(50));
--게시판
drop table p_board;
drop sequence p_board_no_seq;
create sequence p_board_no_seq start with 1 increment by 1;
create table p_board(no number primary key,
                     name varchar2(30) not null,
                     email varchar2(50),
                     homepage varchar2(50),
                     subject varchar2(1000),
                     content varchar2(4000),
                     id varchar2(10),
                     regdate date,
                     readnum number,
                     groupid number,
                     groupstep number,
                     grouplevel number,
                     rootno number,
                     depth number);
--방명록
drop table p_visitor;
drop sequence p_visitor_no_seq;
create sequence p_visitor_no_seq start with 1 increment by 1;
create table p_visitor(no number primary key,
                        name varchar2(30) not null,
                        homepage varchar2(50),
                        content varchar2(1000),
                        regdate date default sysdate);
--파일방     
drop table p_file;
drop sequence p_file_no_seq;
create sequence p_file_no_seq start with 1 increment by 1;
create table p_file(no number primary key,
                    id varchar2(10) not null,
                    content varchar2(200),
                    path varchar2(1000) not null,
                    regdate date default sysdate,
                    filename varchar2(260),
                    filesize number,
                    filetype varchar2(10),
                    flag number(1,0));
--리플
drop table p_reply;
drop sequence p_reply_no_seq;
create sequence p_reply_no_seq start with 1 increment by 1;
create table p_reply(no number primary key,
                      id varchar2(10) not null,
                      rootno number,
                      content varchar2(1000),
                      regdate date default sysdate,
                      flag number(1,0));
--다이어리
drop table p_diary;
drop sequence p_diary_no_seq;
create sequence p_diary_no_seq start with 1 increment by 1;
create table p_diary(no number primary key,
                      id varchar2(10) not null,
                      subject varchar2(100) not null,
                      content varchar2(1000),
                      event_time date);
--환경설정
--create table p_setup();
