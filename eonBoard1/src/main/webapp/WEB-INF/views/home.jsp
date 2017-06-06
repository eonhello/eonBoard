<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/resources/bootstrap/js/animatescroll.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-rc.2/jquery-ui.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Eon Board</title>

<style>
@import
	url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400);

@font-face {
	font-family: 'NanumBarunGothic';
	src: url("/resources/bootstrap/fonts/NanumBarunGothic.eot");
	src: local("☺"), url("/resources/bootstrap/fonts/NanumBarunGothic.woff")
		format("woff");
}

a:hover {
	text-decoration: none;
}

body {
	font-family: "NanumBarunGothic", sans-serif;
	padding-top: 90px;
}

.container-fluid {
	padding: 0;
}

/* nav bar customize */
.navbar {
	background-color: #fff;
	border: none;
	padding-bottom: 10px;
	font-family: 'Source Sans Pro', sans-serif;
	font-weight: 300;
	font-size: 18px;
	height: 90px;
	text-transform: capitalize;
	border-bottom: 1px solid #AAAAAA
}

.navbar-toggle {
	position: relative;
	margin-top: 40px;
	top: 2px;
}

.navbar-nav {
	padding-right: 10px;
	margin-top: 20px;
	background-color: #fff
}

.navbar-nav li {
	margin: 0 20px;
}

.navbar-brand {
	padding-left: 20px;
}

.navbar-collapse {
	padding-top: 10px;
	background-color: #fff
}

.navbar-default .navbar-nav>li>a:hover {
	color: #FF8000
}

.navbar-default .navbar-nav>li.active>a, .navbar-default .navbar-nav>li.active>a:hover,
	.navbar-default .navbar-nav>li.active>a:focus {
	color: #FF8000;
	background-color: #fff
}

.control {
	position: inherit;
	top: 50%;
	z-index: 5;
	display: inline-block;
	right: 50%;
}

@media ( max-width : 320px) {
	.navbar-brand img {
		width: 80%;
		height: auto;
		margin-top: -100px
	}
}

@media ( max-width : 980px) {
	.navbar-nav li {
		margin: 0 10px;
	}
}

/* About 아이콘 부분 */
.service {
	margin: 40px 0;
}

.service a {
	display: block;
}

.icontxt {
	display: block;
	color: #2E2F28;
	text-align: center;
}

.icontxt h4 {
	font-weight: bold;
	font-family: 'Source Sans Pro';
	font-size: 20px;
	text-transform: uppercase;
	text-align: center;
}

.icons {
	float: left;
	display: block;
	font-size: 30px;
	color: #fff;
	background-color: #FF8000;
	border-radius: 50%;
	text-align: center;
	margin-right: 15px;
	padding: 20px;
	border: 4px solid #FF8040;
	transition: all 0.3s;
}

.service a:hover .icons {
	background-color: #0080C0;
}

.service a:hover .icontxt h4 {
	color: #0080FF;
}

@media ( min-width : 768px) {
	.icons {
		margin: 0 auto;
		position: relative;
		left: 30%;
	}
	.icontxt h4 {
		text-align: center;
	}
}

@media ( max-width : 360px) {
	.icontxt p {
		display: none;
	}
	.icontxt {
		line-height: 10px;
		padding: 0;
		margin: 0;
	}
	.icontxt h4 {
		display: none;
	}
	.icons {
		padding: 20px;
		margin: 10px 0 10px 20px;
	}
	.book img {
		width: 50%;
		height: auto;
	}
	.control {
		display: none;
	}
}
</style>

<!--  <script type="text/javascript">
	$(document).ready(function() {
		$("#board").load("/sboard/list")
	});
</script> -->

<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	if (result == 'FAILURE') {
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
	}
	if (result == 'logout') {
		alert("로그아웃되었습니다");
	}
</script>

<!-- <script>
	$(document).ready(function() {
		$("#btnLogin").click(function() {

			var userId = $("#uid").val();
			var userPw = $("#upw").val();

			if (userId == "") {
				alert("아이디를 입력하세요.");
				$("#uid").focus();
				return;
			}
			if (userPw == "") {
				alert("아이디를 입력하세요.");
				$("#upw").focus();
				return;
			}

		});
	});
</script> -->

</head>

<body id="home">
	<div class="container-fluid">

		<!-- 상단 메뉴 부분 -->
		<div class="container">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation"
				id="navbar-scroll">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".navbar-ex1-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!-- <a class="navbar-brand" href="#"><img src="/resources/imgs/logo.png"
							alt="9PixelStudio"  style="width:100%; height:100%;"> </a> -->
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div
						class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
						<ul class="nav navbar-nav">
							<c:if test="${login.uid == null}">
								<li><a href="#home" onclick="$('#home').animatescroll();">Home
								</a></li>
								<li><a href="#about" onclick="$('#about').animatescroll();">About
								</a></li>
								<li><a href="#signUp" data-toggle="modal">Sign Up </a></li>
								<li><a href="#login" data-toggle="modal">Login </a></li>
								<li><a href="#board" onclick="$('#board').animatescroll();">Board
								</a></li>
								<li><a href="#contact"
									onclick="$('#contact').animatescroll();">Contact </a></li>
							</c:if>
							<c:if test="${login.uid != null}">
								<li><a href="#home" onclick="$('#home').animatescroll();">Home
								</a></li>
								<li><a href="#about" onclick="$('#about').animatescroll();">About
								</a></li>
								<li><a href="#board" onclick="$('#board').animatescroll();">Board
								</a></li>
								<li><a href="#contact"
									onclick="$('#contact').animatescroll();">Contact </a></li>
								<li><a href="/user/logout">${login.uid}님 Logout <span
										class="glyphicon glyphicon-log-out"></span></a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>
		<!-- 상단 메뉴 부분 끝 -->

		<!-- 캐러셀 부분 시작 -->
		<div id="carousel-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-generic" data-slide-to="1"></li>
				<li data-target="#carousel-generic" data-slide-to="2"></li>
			</ol>
			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="/resources/imgs/slide_1.jpg" alt="First slide"
						style="width: 100%; height: 650px;">
				</div>
				<div class="item">
					<img src="/resources/imgs/slide_2.jpg" alt="Second slide"
						style="width: 100%; height: 650px;">
				</div>
				<div class="item">
					<img src="/resources/imgs/slide_3.png" alt="Third slide"
						style="width: 100%; height: 650px;">
				</div>
			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-generic"
				data-slide="prev"> <img src="/resources/imgs/left.png"
				class="control">
			</a> <a class="right carousel-control" href="#carousel-generic"
				data-slide="next"> <img src="/resources/imgs/right.png"
				class="control">
			</a>
		</div>
		<!-- 캐러셀 부분 끝  -->

		<!-- About 부분 시작 -->
		<div id="about">
			<div class="container">
				<div class="row service">
					<div class="col-xs-6 col-md-3">
						<div class="row">
							<br> <br> <a href="#board"
								onclick="$('#board').animatescroll();">
								<div class="col-xs-4 col-md-12">
									<span class="glyphicon glyphicon-star icons"> </span>
								</div>
								<div class="col-xs-8 col-md-12 icontxt">
									<h4>Programming Forum</h4>
									<p>웹 프로그래밍에 관한 포럼입니다.</p>
								</div>
							</a> <br> <br> <br>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="row">
							<br> <br> <a href="#board"
								onclick="$('#board').animatescroll();">
								<div class="col-xs-4 col-md-12">
									<span class="glyphicon glyphicon-user icons"> </span>
								</div>
								<div class="col-xs-8 col-md-12 icontxt">
									<h4>Study Group</h4>
									<p>자유로운 스터디 조직이 가능합니다.</p>
								</div>
							</a> <br> <br> <br>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="row">
							<br> <br> <a href="#contact"
								onclick="$('#contact').animatescroll();">
								<div class="col-xs-4 col-md-12">
									<span class="glyphicon glyphicon-pencil icons"> </span>
								</div>
								<div class="col-xs-8 col-md-12 icontxt">
									<h4>Tech Columnists</h4>
									<p>정기적인 칼럼을 쓰실 필자를 모집합니다.</p>
								</div>
							</a> <br> <br> <br>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="row">
							<br> <br> <a href="#contact"
								onclick="$('#contact').animatescroll();">
								<div class="col-xs-4 col-md-12">
									<span class="glyphicon glyphicon-bullhorn icons"> </span>
								</div>
								<div class="col-xs-8 col-md-12 icontxt">
									<h4>Improving The Website</h4>
									<p>사이트 개선에 대해 의견을 보내주세요.</p>
								</div>
							</a> <br> <br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- About 부분 끝-->

		<!-- 로그인 Modal 시작 -->
		<div class="modal fade" id="login" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">LOGIN</h4>
					</div>
					<div class="modal-body">

						<!-- 로그인 Form 시작 -->
						<form action="/user/loginPost" method="post" name="loginForm">
							<div class="form-group has-feedback">
								<input type="text" name="uid" class="form-control"
									placeholder="USER ID" /> <span
									class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="form-group has-feedback">
								<input type="password" name="upw" class="form-control"
									placeholder="Password" /> <span
									class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
							<div class="row">
								<div class="col-xs-8">
									<div class="checkbox icheck">
										<label> <input type="checkbox" name="useCookie">
											Remember Me
										</label>
									</div>
								</div>
								<!-- /.col -->
								<div class="col-xs-4">
									<button type="submit"
										class="btn btn-primary btn-block btn-flat" id="btnLogin">
										<span class="glyphicon glyphicon-ok"></span> Sign In
									</button>
								</div>
								<!-- /.col -->
							</div>
						</form>
						<!-- 로그인 Form 끝 -->

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- 모달 콘텐츠 -->
			</div>
			<!-- 모달 다이얼로그 -->
		</div>
		<!-- 모달 전체 윈도우 -->
		<!-- 로그인 Modal 끝 -->

		<!-- 회원 가입 Modal 시작 -->
		<div class="modal fade" id="signUp" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">SIGN UP</h4>
					</div>
					<div class="modal-body">

						<!-- 회원 가입 Form 시작 -->
						<form action="/user/registerUser" method="post"
							class="form-horizontal" role="form">
							<div class="form-group">
								<label for="Id" class="col-xs-2 col-lg-2 control-label"><span
									class="glyphicon glyphicon-user"></span> 아이디</label>
								<div class="col-xs-10 col-lg-10">
									<input type="text" name="uid" id="userId" class="form-control"
										placeholder="아이디 입력"><br> <input type="button"
										id="idDup" class="send_btn" value="중복 체크"
										onclick="idDupCheck();">
								</div>
							</div>

							<!-- 아이디 중복 체크 시작 -->
							<script type="text/javascript">
								function idDupCheck() {

									var uid = {
										uid : $("#userId").val()
									};

									$
											.ajax({

												url : "/user/idDupCheck",
												type : "post",
												headers : {
													"Content-Type" : "application/json",
													"X-HTTP-Method-Override" : "POST"
												},
												data : uid,
												dataType : "json",
												success : function(data) {

													if (data.result == "SUCCESS") {

														alert(data.resultMsg);

													} else {

														alert(data.resultMsg);
													}

												}

											});

								}
							</script>
							<!-- 아이디 중복 체크 끝 -->

							<div class="form-group">
								<label for="Password" class="col-xs-2 col-lg-2 control-label"><span
									class="glyphicon glyphicon-lock"></span> 비밀번호</label>
								<div class="col-xs-10 col-lg-10">
									<input type="password" name="upw" id="signUpPw"
										class="form-control" placeholder="비밀번호 입력">
									<div id="signUpPwRequired">
										<small id="signUpPw_min"><span
											class="glyphicon glyphicon-check"></span> 최소 8자 이상 입력</small><br>
									</div>
								</div>
							</div>

							<!-- 비밀번호 체크 시작 -->
							<script type="text/javascript">
								
								$("#signUpPwRequired").hide();

								
								$("#signUpPw")
										.focus(
												function() {
													$("#signUpPwRequired")
															.show();

													$("#signUpPw")
															.keyup(
																	function() {
																		if ($(
																				"#signUpPw")
																				.val().length >= 8) {
																			$(
																					"#signUpPw_min span")
																					.css(
																							"color",
																							"#1DDB16");
																			$(
																					"#signUpConfirm")
																					.prop(
																							"disabled",
																							false);
																		} else {
																			$(
																					"#signUpPw_min span")
																					.css(
																							"color",
																							"#FF0000");
																			$(
																					"#signUpConfirm")
																					.prop(
																							"disabled",
																							true);
																		}
																	});

												});
								$("#signUpPw").blur(function() {
									$("#signUpPwRequired").hide();
								});
							</script>
							<!-- 비밀번호 체크 끝 -->

							<div class="form-group">
								<label for="Name" class="col-xs-2 col-lg-2 control-label"><span
									class="glyphicon glyphicon-tag"></span> 이름</label>
								<div class="col-xs-10 col-lg-10">
									<input type="text" name="uname" class="form-control"
										placeholder="이름">
								</div>
							</div>
							<div class="form-group">
								<label for="emailaddress"
									class="col-xs-2 col-lg-2 control-label"><span
									class="glyphicon glyphicon-envelope"></span> 이메일</label>
								<div class="col-xs-10 col-lg-10">
									<input type="email" name="umail" id="userMail"
										class="form-control" placeholder="example@naver.com">
								</div>
							</div>
							<div class="form-group">
								<div
									class="col-xs-offset-2 col-xs-10 col-lg-offset-2 col-lg-10 text-right">
									<input type="submit" id="signUpConfirm" class="btn btn-primary"
										value="확인"> <input type="reset"
										class="btn btn-default" value="취소">
								</div>
							</div>
						</form>
						<!-- 회원 가입 Form 끝 -->

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- 모달 콘텐츠 -->
			</div>
			<!-- 모달 다이얼로그 -->
		</div>
		<!-- 모달 전체 윈도우 -->
		<!-- 회원 가입 Modal 끝 -->

		<!-- Contact 부분 시작 -->
		<br>
		<div id="contact">
			<div class="container">
				<h3 class="box-title">Contact</h3>
				<p>관리자에게 문의 메일을 보낼 수 있습니다.</p>
				<br>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-7">
						<form action="/mail/mailSending" method="post">
							<div class="form-group">
								<input type="text" class="form-control required" name="name"
									placeholder="보내는 사람 이름" title="Name">
							</div>
							<div class="form-group">
								<input type="text" class="form-control required" name="email"
									placeholder="보내는 사람 이메일주소" title="Email">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="title"
									placeholder="제목" title="Subject">
							</div>
							<div class="form-group">
								<textarea name="content" class="form-control required"
									id="message" title="Message" placeholder="내용" rows=5></textarea>
							</div>
							<div align="right" class="form-group">
								<button type="submit" class="send_btn">전송</button>
								<button type="reset" class="send_btn">취소</button>
							</div>
						</form>
					</div>
					<div class="col-md-4  col-md-offset-1 contact_info">
						<p>
							<span class="glyphicon glyphicon-home"> </span> 서울시 강서구 마곡동 마곡서1로
						</p>
						<p>
							<span class="glyphicon glyphicon-phone"> </span> +82 10 5266 9946
						</p>
						<p>
							<span class="glyphicon glyphicon-inbox"> </span> <a
								href="mailto:paleblue_sky@naver.com">paleblue_sky@naver.com
							</a>
						</p>
						<p>
							<span class="glyphicon glyphicon-copyright-mark"> </span> Eon
							Board ver1.0
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Contact 부분 끝 -->

		<!-- 게시판 부분 시작 -->
		<div id="board">
			<iframe src="/sboard/list" align="middle" width="100%" height="100%"
				frameborder="0" scrolling="auto"></iframe>
		</div>
		<!-- 게시판 부분 끝 -->

	</div>

	<script>
		$('.carousel').carousel()
	</script>
</body>

</html>
