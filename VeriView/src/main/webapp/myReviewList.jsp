<%@page import="com.saoe.model.member.ReviewMemberDTO"%>
<%@page import="com.saoe.model.member.RestMemberDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDTO"%>
<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.profile.ProfileReportDTO"%>
<%@page import="com.saoe.model.profile.ProfileBlockDTO"%>
<%@page import="com.saoe.model.profile.ProfileFollowDTO"%>
<%@page import="com.saoe.model.profile.ProfileFeedDTO"%>
<%@page import="com.saoe.model.profile.ProfileDTO"%>
<%@page import="com.saoe.model.profile.ProfileDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.saoe.model.member.MemberDAO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="com.saoe.model.feed.FeedDTO"%>
<%@page import="com.saoe.model.member.MemberDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.saoe.model.reply.ReplyDTO"%>
<%@page import="com.saoe.model.review.ReviewPicDTO"%>
<%@page import="com.saoe.model.review.ReviewDAO"%>
<%@page import="com.saoe.model.review.ReviewDTO"%>
<%@page import="java.util.List"%>
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
	rel="stylesheet"">

<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

body {
	font-family: "Open Sans", sans-serif;
	background: white;
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

a {
	color: rgb(218, 0, 0);
}

.aaa {
	height: 150px;
	width: 200px;
}

/**Reset Bootstrap*/
.dropdown-toggle::after {
	content: none;
	display: none;
}

/* 프로필 css */
.social-box .box {
	background: #FFF;
	border-radius: 10px;
	cursor: pointer;
	margin: 20px 0;
	padding: 40px 10px;
	transition: all 0.5s ease-out;
}

.social-box .box:hover {
	box-shadow: 0 0 6px #4183D7;
}

.social-box .box-text {
	font-size: 15px;
	line-height: 30px;
	margin: 20px 0;
}

.social-box .box-btn a {
	color: #4183D7;
	font-size: 16px;
	text-decoration: none;
}

.social-box .fa {
	color: #4183D7;
}
</style>
</head>

<body>
	<!-- html 시작 -->

	<!-- header -->
	<c:import url="./layout/header.jsp"></c:import>

	<%
	SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");
	String id = member.getId();
	pageContext.setAttribute("id", id);

	MemberDAO memberDAO = new MemberDAO();
	List<MemberMemberDTO> memberMemberList = new MemberDAO().selectMemberMemberList(member.getId());
	pageContext.setAttribute("memberMemberList", memberMemberList);
	List<ReviewMemberDTO> reviewMemberList = memberDAO.selectReviewMemberList(member.getId());
	pageContext.setAttribute("reviewMemberList", reviewMemberList);

	ProfileDAO profileDAO = new ProfileDAO();
	ProfileDTO profile = profileDAO.selectProfile(id);
	List<ProfileFeedDTO> profileFeedList = profileDAO.selectProfileFeed(id);
	List<ProfileFollowDTO> profileFollowerList = profileDAO.selectProfileFollower(id);
	List<ProfileFollowDTO> profileFollowingList = profileDAO.selectProfileFollowing(id);

	List<ProfileFeedDTO> profileScrapReviewList = profileDAO.selectProfileScrapReview(id);
	List<ProfileFeedDTO> profileGoodReviewList = profileDAO.selectProfileGoodReview(id);
	List<ProfileFeedDTO> profileBadReviewList = profileDAO.selectProfileBadReview(id);
	List<ProfileFeedDTO> profileBlockReviewList = profileDAO.selectProfileBlockReview(id);
	List<ProfileFeedDTO> profileReportReviewList = profileDAO.selectProfileReportReview(id);

	pageContext.setAttribute("profile", profile);
	pageContext.setAttribute("profileFeedList", profileFeedList);
	pageContext.setAttribute("profileFollowerList", profileFollowerList);
	pageContext.setAttribute("profileFollowingList", profileFollowingList);

	pageContext.setAttribute("profileScrapReviewList", profileScrapReviewList);
	pageContext.setAttribute("profileGoodReviewList", profileGoodReviewList);
	pageContext.setAttribute("profileBadReviewList", profileBadReviewList);
	pageContext.setAttribute("profileBlockReviewList", profileBlockReviewList);
	pageContext.setAttribute("profileReportReviewList", profileReportReviewList);
	%>

	<!-- 프로필 시작 -->
	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<div class="card" style="position: fixed; width: 25%;">
					<div class="card-body">
						<div class="media" style="text-align: center;">
							<a class="thumbnail pull-left"
								href="./profile.jsp?id=${pageScope.profile.id}"> <img
								class="rounded-circle" width="80px"
								src="${pageScope.profile.profile }" alt="">
							</a>
						</div>
						<div class="h4" style="height: 40px;">
							<a href="./profile.jsp?id=${pageScope.profile.id}"
								style="color: rgb(218, 0, 0); height: 50px; position: absolute; top: 120px;">@${pageScope.profile.nick}</a>
						</div>
						<div class="h7 text-muted" style="height: 40px;">
							<c:if test="${empty pageScope.profile.profile_message}">@회원 코멘트가 없습니다.</c:if>
							<c:if test="${not empty pageScope.profile.profile_message}">@${pageScope.profile.profile_message}</c:if>
						</div>
						<div class="h7" style="height: 80px;">
							<a href="./updateMember.jsp" style="color: rgb(218, 0, 0);">프로필
								수정</a> <br> <a href="./myUserList.jsp"
								style="color: rgb(218, 0, 0);">회원 목록</a> <br> <a
								href="./myReviewList.jsp" style="color: rgb(218, 0, 0);">리뷰
								목록</a> <br> <a href="./myRestList.jsp"
								style="color: rgb(218, 0, 0);">음식점 목록</a>
						</div>


					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="h6 text-muted">Riview</div>
							<div class="h5">${fn:length(pageScope.profileFeedList)}</div>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-danger" type="button"
								id="button-addon2" style="color: rgb(218, 0, 0);"
								onclick="location.href='LogoutCon'">로그아웃</button>
						</li>
						<li class="list-group-item">
							<button class="btn btn-outline-danger" type="button"
								id="button-addon2" style="color: rgb(218, 0, 0);"
								onclick="location.href='./quit.jsp'">회원탈퇴</button>
						</li>

					</ul>
				</div>
			</div>

			<div class="col-md-6 gedf-main">

				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#a">즐겨찾기</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#b">좋아요</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#c">싫어요</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#d">차단</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#e">신고</a></li>
				</ul>

				<div class="tab-content" style="margin-top: 20px;">
					<div class="tab-pane fade show active" id="a">

						<div class="row">
							<c:forEach var="scrapReview"
								items="${pageScope.profileScrapReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img src=${scrapReview.review_pic_src } class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="./restDetail.jsp?rest_no=${scrapReview.rest_no}"
														style="color: rgb(218, 0, 0);">
														<c:choose>
													<c:when test="${fn:length(scrapReview.rest_name) gt 6}">
														${fn:substring(scrapReview.rest_name,0,6) }...
													</c:when>
													<c:otherwise>
														${scrapReview.rest_name }
													</c:otherwise>
													</c:choose>
														
														</a>
												</h4>
											</div>
											<div class="box-text">
												<span>
													<c:choose>
													<c:when test="${fn:length(scrapReview.review_content) gt 11}">
														${fn:substring(scrapReview.review_content,0,10) }...</span>
													</c:when>
													<c:otherwise>
														${scrapReview.review_content }
													</c:otherwise>
													</c:choose>
												</span>
											</div>
											<div>
												<a href="./reviewDetail.jsp?review_no=${scrapReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-btn"
												style="text-align: center; margin-top: 10px;">
												<c:set var="scrapstate" value="0" />
												<c:forEach var="reviewMember"
													items="${pageScope.reviewMemberList}">
													<c:if
														test="${reviewMember.review_no eq scrapReview.review_no && reviewMember.review_scrap_yn eq 1 }">
														<c:set var="scrapstate" value="1" />
													</c:if>
												</c:forEach>

												<button class="btn btn-danger" id="w1"
													onclick="scrapReview('${scrapReview.review_no}', this)"
													onmouseover="w1_mouseover()" onmouseout="w1_mouseout()">
													<c:if test="${scrapstate eq 1}">
													스크랩 취소
													</c:if>
													<c:if test="${scrapstate eq 0}">
													스크랩
													</c:if>
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<div class="tab-pane fade" id="b">

						<div class="row">
							<c:forEach var="goodReview"
								items="${pageScope.profileGoodReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img src="${goodReview.review_pic_src }" class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="./restDetail.jsp?rest_no=${goodReview.rest_no}"
														style="color: rgb(218, 0, 0);">
													<c:choose>
													<c:when test="${fn:length(goodReview.rest_name) gt 6}">
														${fn:substring(goodReview.rest_name,0,6) }...
													</c:when>
													<c:otherwise>
														${goodReview.rest_name }
													</c:otherwise>
													</c:choose>
													</a>
												</h4>
											</div>
											<div class="box-text">
												<span>
												<c:choose>
													<c:when test="${fn:length(goodReview.review_content) gt 11}">
														${fn:substring(goodReview.review_content,0,10) }...
													</c:when>
													<c:otherwise>
														${goodReview.review_content }
													</c:otherwise>
													</c:choose>
													</span>
											</div>
											<div>
												<a href="./reviewDetail.jsp?review_no=${goodReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-btn"
												style="text-align: center; margin-top: 10px;">
												<c:set var="gbstate" value="0" />
												<c:forEach var="reviewMember"
													items="${pageScope.reviewMemberList}">
													<c:if
														test="${reviewMember.review_no eq goodReview.review_no && reviewMember.review_gb eq 1 }">
														<c:set var="gbstate" value="1" />
													</c:if>
												</c:forEach>
												<button class="btn btn-danger" id="w2"
													onclick="like('${goodReview.review_no}', this)"
													onmouseover="w2_mouseover()" onmouseout="w2_mouseout()">
													<c:choose>
														<c:when test="${gbstate eq 1}">
													좋아요 취소
													</c:when>
														<c:otherwise>
													좋아요
													</c:otherwise>
													</c:choose>
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>


					<div class="tab-pane fade" id="c">
						<div class="row">
							<c:forEach var="badReview"
								items="${pageScope.profileBadReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img src=${badReview.review_pic_src } class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="./restDetail.jsp?rest_no=${badReview.rest_no}"
														style="color: rgb(218, 0, 0);">
														<c:choose>
													<c:when test="${fn:length(badReview.rest_name) gt 6}">
														${fn:substring(badReview.rest_name,0,6) }...</span>
													</c:when>
													<c:otherwise>
														${badReview.rest_name }
													</c:otherwise>
													</c:choose>
														</a>
												</h4>
											</div>
											<div class="box-text">
												<c:choose>
													<c:when test="${fn:length(badReview.review_content) gt 11}">
														${fn:substring(badReview.review_content,0,10) }...</span>
													</c:when>
													<c:otherwise>
														${badReview.review_content }
													</c:otherwise>
													</c:choose>
											</div>
											<div>
												<a href="./reviewDetail.jsp?review_no=${badReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-btn"
												style="text-align: center; margin-top: 10px;">
												<c:set var="gbstate" value="0" />
												<c:forEach var="reviewMember"
													items="${pageScope.reviewMemberList}">
													<c:if
														test="${reviewMember.review_no eq badReview.review_no && reviewMember.review_gb eq -1 }">
														<c:set var="gbstate" value="-1" />
													</c:if>
												</c:forEach>
												<button class="btn btn-danger" id="w3"
													onclick="hate('${badReview.review_no}', this)">
													<c:choose>
														<c:when test="${gbstate eq -1}">
													싫어요 취소
													</c:when>
														<c:otherwise>
													싫어요
													</c:otherwise>
													</c:choose>
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>

					<div class="tab-pane fade" id="d">

						<div class="row">
							<c:forEach var="blockReview"
								items="${pageScope.profileBlockReviewList}">
								<div class="card gedf-card" style="margin-right: 30px;">
									<div class="box">
										<div>
											<img src=${blockReview.review_pic_src } class="aaa">
										</div>
										<div class="card-body">
											<div class="box-title">
												<h4>
													<a href="./restDetail.jsp?rest_no=${blockReview.rest_no}"
														style="color: rgb(218, 0, 0);">
														<c:choose>
													<c:when test="${fn:length(blockReview.rest_name) gt 6}">
														${fn:substring(blockReview.rest_name,0,6) }...</span>
													</c:when>
													<c:otherwise>
														${blockReview.rest_name }
													</c:otherwise>
													</c:choose></a>
												</h4>
											</div>
											<div class="box-text">
												<c:choose>
													<c:when test="${fn:length(blockReview.review_content) gt 11}">
														${fn:substring(blockReview.review_content,0,10) }...</span>
													</c:when>
													<c:otherwise>
														${blockReview.review_content }
													</c:otherwise>
													</c:choose>
											</div>
											<div>
												<a href="./reviewDetail.jsp?review_no=${blockReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
											</div>
											<div class="box-btn"
												style="text-align: center; margin-top: 10px;">
												<c:set var="blockstate" value="0" />
												<c:forEach var="reviewMember"
													items="${pageScope.reviewMemberList}">
													<c:if
														test="${reviewMember.review_no eq blockReview.review_no && reviewMember.review_block_yn eq 1 }">
														<c:set var="blockstate" value="1" />
													</c:if>
												</c:forEach>
												<button class="btn btn-danger" id="w4"
													onclick="blockReview('${blockReview.review_no}', this)"
													onmouseover="w4_mouseover()" onmouseout="w4_mouseout()">
													<c:if test="${blockstate eq 1}">
													차단 취소
													</c:if>
													<c:if test="${blockstate eq 0}">
													차단
													</c:if>
												</button>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

					</div>

					<div class="tab-pane fade" id="e">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<c:forEach var="reportReview"
									items="${pageScope.profileReportReviewList}">
									<div class="card gedf-card" style="margin-right: 30px;">
										<div class="box">
											<div>
												<img src=${reportReview.review_pic_src } class="aaa">
											</div>
											<div class="card-body">
												<div class="box-title">
													<h4>
														<a href="./restDetail.jsp?rest_no=${reportReview.rest_no}"
															style="color: rgb(218, 0, 0);">
													<c:choose>
													<c:when test="${fn:length(reportReview.rest_name) gt 6}">
														${fn:substring(reportReview.rest_name,0,6) }...</span>
													</c:when>
													<c:otherwise>
														${reportReview.rest_name }
													</c:otherwise>
													</c:choose>
															</a>
													</h4>
												</div>
												<div class="box-text">
													<span>
													<c:choose>
													<c:when test="${fn:length(reportReview.review_content) gt 11}">
														${fn:substring(reportReview.review_content,0,10) }...</span>
													</c:when>
													<c:otherwise>
														${reportReview.review_content }
													</c:otherwise>
													</c:choose>
												</div>
												<div>
													<a href="./reviewDetail.jsp?review_no=${reportReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
												</div>
												<div class="box-text" style="margin-top: 5px;">
													<p>${reportReview.member_rep_content}</p>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

					</div>
				</div>
			</div>


<!-- 팔로우 팔로워 -->
			<div class="col-md-3"
				style="position: fixed; width: 25%; left: 100%; transform: translateX(-100%);">
				<div class="card gedf-card">
					<div class="card-body">
						<div>
							<h4 class="card-title">
								<span style="color: rgb(218, 0, 0); margin-right: 15px;">Followers</span>${fn:length(pageScope.profileFollowerList)}</h4>
						</div>
						<div>
							<table class="modal_table" style="top: 80px;">
								<c:if test="${empty pageScope.profileFollowerList}">팔로우한 회원이 없습니다.</c:if>
								<c:forEach var="follower"
									items="${pageScope.profileFollowerList}">
									<tr>
										<td style="width: 70px;"><a
											href="./profile.jsp?id=${follower.id}"><img
												class="rounded-circle" id="modal_userImg"
												src="${follower.profile }" width="45" height="45"></a></td>
										<td id="modal_userID"><a
											href="./profile.jsp?id=${follower.id}">${follower.nick}</a></td>
										<td id="modal_userFollow"><c:set var="state" value="0" />
											<c:forEach var="memberMember"
												items="${pageScope.memberMemberList}">
												<c:if
													test="${memberMember.id eq follower.id && memberMember.member_follow_yn eq 1 }">
													<c:set var="state" value="1" />
												</c:if>
											</c:forEach> <c:if test="${state eq 1}">
												<button class="btn btn-danger"
													onclick="followMember('${follower.id}', this)"
													style="margin-left: 20px;">팔로잉</button>
											</c:if> <c:if test="${state eq 0}">
												<button class="btn btn-outline-danger"
													onclick="followMember('${follower.id}', this)"
													style="margin-left: 20px;">팔로우</button>
											</c:if></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<div>
							<h4 class="card-title">
								<span style="color: rgb(218, 0, 0); margin-right: 15px;">Following</span>${fn:length(pageScope.profileFollowingList)}</h4>
						</div>
						<div>
							<table class="modal_table" style="top: 80px;">
								<c:if test="${empty pageScope.profileFollowingList}">팔로잉한 회원이 없습니다.</c:if>
								<c:forEach var="following"
									items="${pageScope.profileFollowingList}">
									<tr>
										<td style="width: 70px;"><a
											href="./profile.jsp?id=${following.id}"><img
												class="rounded-circle" id="modal_userImg"
												src="${following.profile }" width="45" height="45"></a></td>
										<td id="modal_userID"><a
											href="./profile.jsp?id=${following.id}">${following.nick}</a></td>
										<td id="modal_userFollow"><c:set var="state" value="0" />
											<c:forEach var="memberMember"
												items="${pageScope.memberMemberList}">
												<c:if
													test="${memberMember.id eq following.id && memberMember.member_follow_yn eq 1 }">
													<c:set var="state" value="1" />
												</c:if>
											</c:forEach> <c:if test="${state eq 1}">
												<button class="btn btn-danger"
													onclick="followMember('${following.id}', this)"
													style="margin-left: 20px;">팔로잉</button>
											</c:if> <c:if test="${state eq 0}">
												<button class="btn btn-outline-danger"
													onclick="followMember('${following.id}', this)"
													style="margin-left: 20px;">팔로우</button>
											</c:if></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 마우스 오버 스크립트 -->
			<script>
				function w1_mouseover() {
					w1.innerText = '스크랩 취소';
					w1.style.color = "rgb(218, 0, 0)";
					w1.style.background = "white";
				}

				function w1_mouseout() {
					w1.innerText = '스크랩';
					w1.style.color = "white";
					w1.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script>
				function w2_mouseover() {
					w2.innerText = '좋아요 취소';
					w2.style.color = "rgb(218, 0, 0)";
					w2.style.background = "white";
				}

				function w2_mouseout() {
					w2.innerText = '좋아요';
					w2.style.color = "white";
					w2.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script>
				function w3_mouseover() {
					w3.innerText = '싫어요 취소';
					w3.style.color = "rgb(218, 0, 0)";
					w3.style.background = "white";
				}

				function w3_mouseout() {
					w3.innerText = '싫어요';
					w3.style.color = "white";
					w3.style.background = "rgb(218, 0, 0)";
				}
			</script>

			<script>
				function w4_mouseover() {
					w4.innerText = '차단 취소';
					w4.style.color = "rgb(218, 0, 0)";
					w4.style.background = "white";
				}

				function w4_mouseout() {
					w4.innerText = '차단';
					w4.style.color = "white";
					w4.style.background = "rgb(218, 0, 0)";
				}
			</script>
			<script>
			function followMember(id, elem) {

				if ($(elem).text() == '팔로잉') {
					$(elem).text('팔로우');
					updateFollowMember(id, 0);
				} else if ($(elem).text() == '팔로우') {
					$(elem).text('팔로잉');
					updateFollowMember(id, 1);
				}
			}

			function updateFollowMember(id, state) {
				$.ajax({
					url : 'FollowMemberCon',
					type : 'post',
					data : {
						id : id,
						state : state,
					},
					success : function() {
						alert("활동 성공");
					},
					error : function() {
						alert("활동 실패");
					}
				});

			}
				function like(review_no, elem) {

					if (($(elem).text().trim() == '취소')) {
						$(elem).text('좋아요');
						updateLikeReview(review_no, 0);

					} else if (($(elem).text().trim() == '좋아요')) {
						$(elem).text('취소');
						updateLikeReview(review_no, 1);
					}
				}
				function hate(review_no, elem) {

					if (($(elem).text().trim() == '취소')) {
						$(elem).text('싫어요');
						updateLikeReview(review_no, 0);
					} else if (($(elem).text().trim() == '싫어요')) {
						$(elem).text('취소');
						updateLikeReview(review_no, -1);
					}
				}

				function updateLikeReview(review_no, state) {
					$.ajax({
						url : 'GBReviewCon',
						type : 'post',
						data : {
							review_no : review_no,
							state : state,
						},
						success : function() {
							alert("리뷰 평가 성공");
						},
						error : function() {
							alert("리뷰 평가 실패");
						}
					});

				}
				function scrapReview(review_no, elem) {
					if ($(elem).text().trim() == '스크랩') {
						$(elem).text('스크랩 취소');
						updateScrapReview(review_no, 1);
					} else if ($(elem).text().trim() == '스크랩 취소') {
						$(elem).text('스크랩');
						updateScrapReview(review_no, 0);
					}
				}
				function updateScrapReview(review_no, state) {
					$.ajax({
						url : 'ScrapReviewCon',
						type : 'post',
						data : {
							review_no : review_no,
							state : state,
						},
						success : function() {
							alert("리뷰 스크랩 성공");
						},
						error : function() {
							alert("리뷰 스크랩 실패");
						}
					});
				}

				function blockReview(review_no, elem) {
					if ($(elem).text().trim() == '차단') {
						$(elem).text('차단 취소');
						updateBlockReview(review_no, 1);
					} else if ($(elem).text().trim() == '차단 취소') {
						$(elem).text('차단');
						updateBlockReview(review_no, 0);
					}
				}
				function updateBlockReview(review_no, state) {
					$.ajax({
						url : 'BlockReviewCon',
						type : 'post',
						data : {
							review_no : review_no,
							state : state,
						},
						success : function() {
							alert("리뷰 차단 성공");
						},
						error : function() {
							alert("리뷰 차단 실패");
						}
					});

				}
			</script>



			<script
				src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
			<script
				src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>