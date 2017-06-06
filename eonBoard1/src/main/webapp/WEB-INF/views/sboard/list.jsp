<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Eon Board</title>

<style>
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
</style>

<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>

<script>
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
				$('#newBtn').on("click", function(evt) {
					self.location = "/sboard/register";
				});
			});
</script>

</head>

<body>
	<!-- Main content -->

	<div class="row">
		<!-- left column -->
		<div class="container">

			<div class="col-md-12">
				<!-- general form elements -->
				<div class='box'>
					<div class="box-header with-border">
						<h3 class="box-title">Board</h3>
					</div>


					<div class='box-body' style="padding-bottom: 20px;">

						<select name="searchType">
							<option value="n"
								<c:out value="${cri.searchType == null?'selected':''}"/>>
								---</option>
							<option value="t"
								<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
								제목</option>
							<option value="c"
								<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
								내용</option>
							<option value="w"
								<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
								작성자</option>
							<option value="tc"
								<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
								제목 + 내용</option>
							<option value="cw"
								<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
								내용 + 작성자</option>
							<option value="tcw"
								<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
								전체</option>
						</select> <input type="text" name='keyword' id="keywordInput"
							value='${cri.keyword }'>
						<button id='searchBtn' type="button" class="btn btn-info">
							<span class="glyphicon glyphicon-search"></span> Search
						</button>
						<button id='newBtn' type="button"
							class="btn btn-primary pull-right">
							<span class="glyphicon glyphicon-pencil"></span> 글쓰기
						</button>
					</div>
				</div>

			</div>

			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title"></h3>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr class="active">
							<th style="width: 10px">NO</th>
							<th>TITLE</th>
							<th>WRITER</th>
							<th>DATE</th>
							<th style="width: 40px">VIEW</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.bno}</td>
								<td><a
									href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&bno=${boardVO.bno}'>
										${boardVO.title} <!-- <strong>[ ${boardVO.replycnt} ]</strong> -->
								</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td><span class="badge bg-red">${boardVO.viewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>
				<!-- /.box-footer-->
			</div>
		</div>
		<!--/.col (left) -->
	</div>

	<!-- /.row -->





</body>
</html>
