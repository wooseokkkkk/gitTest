<%@page import="com.saoe.model.rank.RankingDTO"%>
<%@page import="com.saoe.model.rank.RankingDAO"%>
<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDAO"%>
<%@page import="com.saoe.model.category.CategoryDTO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="com.saoe.model.feed.FeedDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.reply.ReplyDTO"%>
<%@page import="com.saoe.model.review.ReviewPicDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

.h7 {
	font-size: 15px;
	color: rgb(218, 0, 0);
}

.gedf-wrapper {
	margin-top: 10px;
}

@media ( min-width : 992px) {
	.gedf-main {
		padding-left: 4rem;
		padding-right: 4rem;
	}
	.gedf-card {
		margin-bottom: 2.77rem;
	}
}

@media screen and (max-width: 900px) {
	.col-md-3.member-info {
		display: none;
	}
}

@media screen and (max-width: 1200px) {
	.col-md-3.ad-info {
		display: none;
	}
}

.fix-nav {
	position: sticky;
	top: 0;
	/* width: 100% */
	left: 0;
	right: 0;
	z-index: 2;

	/* 생략 */
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}
</style>
</head>

<body>
	<!-- html 시작 -->

	<!-- header -->
	<c:import url="./layout/header.jsp"></c:import>
	<%
	MemberMemberDAO memberMemberDAO = new MemberMemberDAO();
	FeedDAO feedDAO = new FeedDAO();

	if (session.getAttribute("member") != null) {
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
		int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
		pageContext.setAttribute("followerCnt", followerCnt);
		pageContext.setAttribute("followingCnt", followingCnt);

	}

	RankingDAO rankingDAO = new RankingDAO();
	List<RankingDTO> rankWeekList = rankingDAO.selectRanking(7);
	List<RankingDTO> rankMonthList = rankingDAO.selectRanking(30);
	List<RankingDTO> rankTotalList = rankingDAO.selectRanking(365);
	pageContext.setAttribute("rankWeekList", rankWeekList);
	pageContext.setAttribute("rankMonthList", rankMonthList);
	pageContext.setAttribute("rankTotalList", rankTotalList);
	%>

	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3 member-info">
				<c:if test="${not empty sessionScope.member}">
					<div class="card" style="position: fixed; width: 25%;">
						<div class="card-body">
							<div class="row" height="80px">
								<div class="media" style="text-align: center;">
									<a class="thumbnail pull-left"
										href="profile.jsp?id=${sessionScope.member.id}"> <img
										class="rounded-circle" width="80px"
										src="${sessionScope.member.profile}" alt="">
									</a>
								</div>
							</div>
							<div class="row-fluid">
								<div class="h4" style="height: 40px;">
									<a href="profile.jsp?id=${sessionScope.member.id}"
										style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">
										@${sessionScope.member.getNick()} </a>
								</div>
								<div class="h7 text-muted" style="height: 40px;">
									<c:if test="${empty sessionScope.member.profile_message}">@회원 코멘트가 없습니다.</c:if>
									<c:if test="${not empty sessionScope.member.profile_message}">@${sessionScope.member.profile_message}</c:if>
								</div>
								<div class="h7">
									<a href="updateMember.jsp" style="color: rgb(218, 0, 0);">프로필
										수정</a> <br> <a
										href="profile.jsp?id=${sessionScope.member.id}"
										style="color: rgb(218, 0, 0);">My 목록</a> <br>
								</div>
							</div>
						</div>

						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h6 text-muted">Followers</div>
								<div class="h5">${pageScope.followerCnt }</div>
							</li>
							<li class="list-group-item">
								<div class="h6 text-muted">Following</div>
								<div class="h5">${pageScope.followingCnt }</div>
							</li>
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='/VeriView/LogoutCon'">로그아웃</button>
							</li>
						</ul>
					</div>
				</c:if>
				<c:if test="${empty sessionScope.member}">
					<div class="card" style="position: fixed; width: 25%;">
						<div class="card-body">
							<div class="h5" style="height: 30px; color: rgb(218, 0, 0);">게스트</div>
							<div class="h7 text-muted" style="height: 40px;">로그인 후 이용해
								주세요!</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='./start.jsp'">로그인</button>
							</li>
							<li class="list-group-item">
								<button class="btn btn-outline-danger" type="button"
									id="button-addon2" style="color: rgb(218, 0, 0);"
									onclick="location.href='./start.jsp'">회원가입</button>
							</li>
						</ul>
					</div>
				</c:if>
			</div>

			<!-- 랭킹 탭 -->
			<div class="col-md-6 gedf-main">

				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#a">급상승</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#b">주간</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#c">월간</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#d">전체</a></li>
				</ul>

				<div class="tab-content">

					<!-- 급상승랭킹 1~10위 -->
					<div class="tab-pane fade show active" id="a">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<div class="col-12">
									<c:forEach var="rank" items="${pageScope.rankTotalList}"
										varStatus="ranking">
										<c:if test="${rank.member_score > 0}">
										<ul class="list-group">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">

												<td style="width: 70px;"><img class="rounded-circle"
													id="modal_userImg" src="${rank.profile }" width="45" height="45">
											</td> <a href="profile.jsp?id=${rank.id}"
												style="color: rgb(218, 0, 0); text-align: center;">${rank.nick}</a>
												<strong style="font-size: large; color: rgb(218, 0, 0);">${ranking.index+1}위</strong>
											</li>
										</ul>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>

					<!-- 주간랭킹 1~30위 -->
					<div class="tab-pane fade" id="b">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<div class="col-12">
									<c:forEach var="rank" items="${pageScope.rankWeekList}"
										varStatus="ranking">
										<c:if test="${rank.member_score > 0}">
										<ul class="list-group">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">

												<td style="width: 70px;"><img class="rounded-circle"
													id="modal_userImg" src="${rank.profile }" width="45" height="45">
											</td> <a href="profile.jsp?id=${rank.id}"
												style="color: rgb(218, 0, 0); text-align: center;">${rank.nick}</a>
												<strong style="font-size: large; color: rgb(218, 0, 0);">${ranking.index+1}위</strong>
											</li>
										</ul>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>

					<!-- 월간랭킹 1~50위 -->
					<div class="tab-pane fade" id="c">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<div class="col-12">
									<c:forEach var="rank" items="${pageScope.rankMonthList}"
										varStatus="ranking">
										<c:if test="${rank.member_score > 0}">
										<ul class="list-group">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">

												<td style="width: 70px;"><img class="rounded-circle"
													id="modal_userImg" src="${rank.profile }" width="45" height="45">
											</td> <a href="profile.jsp?id=${rank.id}"
												style="color: rgb(218, 0, 0); text-align: center;">${rank.nick}</a>
												<strong style="font-size: large; color: rgb(218, 0, 0);">${ranking.index+1}위</strong>
											</li>
										</ul>
										</c:if>
									</c:forEach>

								</div>
							</div>
						</div>

					</div>

					<!-- 전체랭킹 1~100위 -->
					<div class="tab-pane fade" id="d">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<div class="col-12">
									<c:forEach var="rank" items="${pageScope.rankTotalList}"
										varStatus="ranking">
										<c:if test="${rank.member_score > 0}">
										<ul class="list-group">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">

												<td style="width: 70px;"><img class="rounded-circle"
													id="modal_userImg" src="${rank.profile }" width="45" height="45">
											</td> <a href="profile.jsp?id=${rank.id}"
												style="color: rgb(218, 0, 0); text-align: center;">${rank.nick}</a>
												<strong style="font-size: large; color: rgb(218, 0, 0);">${ranking.index+1}위</strong>
											</li>
										</ul>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>

					</div>
				</div>

			</div>
			<!-- 광고 배너 -->
			<div class="col-md-3 ad-info"
				style="position: fixed; width: 25%; left: 100%; transform: translateX(-100%);">
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">
							<a href="#">광고 배너</a>
						</h5>
						<h6 class="card-subtitle mb-2 text-muted">게시자</h6>
						<p class="card-text">광고 내용</p>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="#" class="card-link">Card link</a> <a href="#"
							class="card-link">Another link</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>