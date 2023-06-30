<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="fix-nav"
		style="background-color: rgb(218, 0, 0); height: 70px;">
		<nav class="tab" style="padding: 10px;">
			<div class="header"
				style="float: left; margin-right: 50px; margin-left: 20px;">
				<a href="feed.jsp" class="navbar-brand"
					style="color: white; font-size: 25px;">VeriView🍒</a>
			</div>

			<!-- navigator -->
			<div class="nav"
				style="height: 50px; float: left; display: flex; justify-content: center; align-items: center;">
				<a href="./feed.jsp"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">음식점</a>
				<a href="./ranking.jsp"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">랭킹</a>
				<a href="./messageMain.jsp"
					style="color: white; font-size: 20px; float: left; margin-right: 50px;">쪽지</a>
			</div>

			<form action="./search.jsp" class="form-inline"
				style="float: right; height: 50px;">
				<div class="input-group">
					<input type="text" class="form-control" name="keyword">
					<div class="input-group-append"
						style="background-color: rgb(218, 0, 0);">
						<button type="submit" class="btn btn-outline-danger" type="button"
							id="button-addon2" style="color: rgb(218, 0, 0);">
							<i class="fa fa-search" style="color: white;"></i>
						</button>
					</div>
				</div>
			</form>
		</nav>
	</div>
</body>
</html>
