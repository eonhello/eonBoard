<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
@import
	url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400);

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
</style>

<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

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
							<li><a href="#home">Home </a></li>
							<li><a href="#login" data-toggle="modal">Login </a></li>
							<li><a href="#signUp" data-toggle="modal">Sign Up </a></li>
							<li><a href="#board">Board </a></li>
							<li><a href="#">Contact </a></li>
						</ul>
					</div>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
		</div>