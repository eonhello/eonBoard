## [eonBoard] Spring 회원가입 게시판 사이트 구현

#### <사용 언어><br>
* JAVA<br>
* JSP<br>
* JavaScript<br>
* HTML, CSS<br>

#### <오픈소스 라이브러리><br>
* Bootstrap<br>
* JQuery<br>
* Jackson(JSON)<br>

#### <개발 도구><br>
* Spring STS 3.8.1<br>
* Apache-Tomcat 8.0(WAS)<br>
* MySQL(DB)<br>
* Github(SVN)<br>

#### <데이터베이스><br>
Board Table(tbl_board)<br>
User Table(tbl_user)<br>

#### <기능><br>
1. 회원 가입<br> 

> * ID 입력 시 '중복 체크'를 클릭하면 회원 테이블을 조회하여 결과 값을 비동기식(Ajax)으로 반환<br>
> * 비밀번호 입력 시, 최소 8자리 이상 입력해야 회원 가입이 가능하도록 회원 가입 창의 '확인' 버튼 제어<br>

2. 로그인<br>

> * 로그인하면 상단의 메뉴 바가 회원 전용으로 바뀌며 '로그아웃' 버튼이 보임<br>
> * 'Remember Me'를 체크하면 일정 시간 동안 유효한 쿠키가 생성되어 자동 로그인 가능<br>

3. 게시판<br> 

> * 글 작성/수정/삭제/조회 기능 구현<br>
> * 로그인하지 않은 상태에서 '글쓰기' 버튼을 클릭하면 로그인 창으로 연결<br>
> * 등록된 글은 '제목/내용/작성자/제목+내용/내용+작성자/전체'로 검색 조건을 선택해 검색 가능<br>

4. Contact<br>

> * 관리자에게 메일 전송 기능 구현<br> 
