<%@page import="com.saoe.model.member.RestMemberDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDTO"%>
<%@page import="com.saoe.model.member.MemberMemberDAO"%>
<%@page import="com.saoe.model.search.SearchDAO"%>
<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.search.SearchRestDTO"%>
<%@page import="com.saoe.model.search.SearchMemberDTO"%>
<%@page import="com.saoe.model.search.SearchReviewDTO"%>
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
	if(session.getAttribute("member") != null){
		SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
		List<MemberMemberDTO> memberMemberList = new MemberDAO().selectMemberMemberList(member.getId());
		List<RestMemberDTO> restMemberList = new MemberDAO().selectRestMemberList(member.getId());
		
		pageContext.setAttribute("memberMemberList", memberMemberList);
		pageContext.setAttribute("restMemberList", restMemberList);
	}
	
	
	MemberMemberDAO memberMemberDAO = new MemberMemberDAO();

	if (session.getAttribute("member") != null) {
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
		int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
		pageContext.setAttribute("followerCnt", followerCnt);
		pageContext.setAttribute("followingCnt", followingCnt);

	}

	String keyword = "%" + request.getParameter("keyword") + "%";

	SearchDAO searchDAO = new SearchDAO();

	List<SearchReviewDTO> searchReviewList = searchDAO.searchReview(keyword);
	List<SearchMemberDTO> searchMemberList = searchDAO.searchMember(keyword);
	List<SearchRestDTO> searchRestList = searchDAO.searchRest(keyword);

	pageContext.setAttribute("searchReviewList", searchReviewList);
	pageContext.setAttribute("searchMemberList", searchMemberList);
	pageContext.setAttribute("searchRestList", searchRestList);
	%>

	<!-- 프로필 시작 -->
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
										src="https://picsum.photos/50/50" alt="">
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

			<div class="col-md-6 gedf-main">

				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#a">전체</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#b">회원</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#c">리뷰</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#d">음식점</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="a">

						<div class="container" style="margin-top: 20px;">
							<div class="card-header">
								<div class="d-flex justify-content-between align-items-center">
									<div class="mr-2">
										<div class="h5 m-0">회원</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<ul class="list-group">
										<c:forEach var="searchMember"
											items="${pageScope.searchMemberList}" end="4">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												<td style="width: 70px;"><img class="rounded-circle"
													id="modal_userImg" src="${searchMember.profile}"></td> <a
												href="./profile.jsp?id=${searchMember.id}"
												style="color: rgb(218, 0, 0);">${searchMember.nick}</a>
												<c:set var="state" value="0" />
												<c:forEach var="memberMember" items="${pageScope.memberMemberList}">
													<c:if test="${memberMember.id eq searchMember.id && memberMember.member_follow_yn eq 1 }">
														<c:set var="state" value="1"/>
													</c:if>
												</c:forEach>
										
												<c:if test="${state eq 1}">
													<buttton class="btn btn-danger" onclick="followMember('${searchMember.id}', this)" style="margin-left: 20px;">팔로잉</button>
												</c:if>
												<c:if test="${state eq 0}">	
		                                        	<button class="btn btn-outline-danger" id="w1" onclick="followMember('${searchMember.id}', this)"
															onmouseover="w1_mouseover()" onmouseout="w1_mouseout()">팔로우</button>
		                                        </c:if>
												
											</li>
										</c:forEach>
									</ul>

									<hr>

									<div class="card-header">
										<div class="d-flex justify-content-between align-items-center">
											<div class="mr-2">
												<div class="h5 m-0">리뷰</div>
											</div>
										</div>
									</div>

									<div class="container" style="margin-top: 10px;">
										<div class="row">
											<c:forEach var="searchReview"
												items="${pageScope.searchReviewList}" end="5">
												<div class="card gedf-card" style="margin-right: 30px;">
													<div class="box">
														<div>
															<img src="${searchReview.review_pic_src}" class="aaa">
														</div>
														<div class="card-body">
															<div class="box-title">
																<h4>
																	<a
																		href="restDetail.jsp?rest_no=${searchReview.rest_no}"
																		style="color: rgb(218, 0, 0);">${fn:substring(searchReview.rest_name,0,5) }...</a>
																</h4>
															</div>
															<div class="box-text">
																<span>${fn:substring(searchReview.review_content,0,8)}...</span>
															</div>
															<div>
																<a href="./reviewDetail.jsp?review_no=${searchReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>

									<hr>

									<div class="card-header">
										<div class="d-flex justify-content-between align-items-center">
											<div class="mr-2">
												<div class="h5 m-0">음식점</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-12">
											<ul class="list-group">
											<c:forEach var="searchRest" items="${pageScope.searchRestList}" end="2">
												<li
													class="list-group-item d-flex justify-content-between align-items-center">
													<td style="width: 70px;"><img class="rounded-circle" width="45" height="45"
														id="modal_userImg" src="${searchRest.rest_profile}"></td>
													<a href="./restDetail.jsp?rest_no=${searchRest.rest_no}" style="color: rgb(218, 0, 0);">${searchRest.rest_name }</a>
												<c:set var="state" value="0"/>
												<c:forEach var="restMember" items="${pageScope.restMemberList}">
													<c:if test="${restMember.rest_no eq searchRest.rest_no && restMember.rest_follow_yn eq 1 }">
														<c:set var="state" value="1"/>
													</c:if>
												</c:forEach>
										
												<c:if test="${state eq 1}">
													<buttton class="btn btn-danger" style="margin-left: 20px;">팔로잉</button>
												</c:if>
												<c:if test="${state eq 0}">	
		                                        	<button class="btn btn-outline-danger" id="w1"
														onmouseover="w1_mouseover()" onmouseout="w1_mouseout()">팔로우</button>
		                                        </c:if>
													
												</li>
												</c:forEach>
											</ul>
										</div>
									</div>

								</div>
							</div>
						</div>

					</div>



					<div class="tab-pane fade" id="b">

						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<div class="col-12">
									<ul class="list-group">
										<c:forEach var="searchMember"
											items="${pageScope.searchMemberList}">
											<li
												class="list-group-item d-flex justify-content-between align-items-center">
												<td style="width: 70px;"><img class="rounded-circle"
													id="modal_userImg" src="${searchMember.profile}"></td> <a
												href="./profile.jsp?id=${searchMember.id}"
												style="color: rgb(218, 0, 0);">${searchMember.nick}</a>
												<c:set var="state" value="0" />
												<c:forEach var="memberMember" items="${pageScope.memberMemberList}">
													<c:if test="${memberMember.id eq searchMember.id && memberMember.member_follow_yn eq 1 }">
														<c:set var="state" value="1"/>
													</c:if>
												</c:forEach>
										
												<c:if test="${state eq 1}">
													<buttton class="btn btn-danger" onclick="followMember('${searchMember.id}', this)" style="margin-left: 20px;">팔로잉</button>
												</c:if>
												<c:if test="${state eq 0}">	
		                                        	<button class="btn btn-outline-danger" id="w1" onclick="followMember('${searchMember.id}', this)"
															onmouseover="w1_mouseover()" onmouseout="w1_mouseout()">팔로우</button>
		                                        </c:if>
											</li>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>

					</div>
					<div class="tab-pane fade" id="c">

						<div class="container" style="margin-top: 10px;">
							<div class="row">
								<c:forEach var="searchReview"
									items="${pageScope.searchReviewList}">
									<div class="card gedf-card" style="margin-right: 30px;">
										<div class="box">
											<div>
												<img src="${searchReview.review_pic_src}" class="aaa">
											</div>
											<div class="card-body">
												<div class="box-title">
													<h4>
														<a href="restDetail.jsp?rest_no=${searchReview.rest_no}"
															style="color: rgb(218, 0, 0);">${fn:substring(searchReview.rest_name,0,5) }...</a>
													</h4>
												</div>
												<div class="box-text">
													<span>${fn:substring(searchReview.review_content,0,8)}...</span>
												</div>
												<div>
													<a href="./reviewDetail.jsp?review_no=${searchReview.review_no}" style="color: rgb(218, 0, 0);">더보기</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

					</div>

					<div class="tab-pane fade" id="d">
						<div class="container" style="margin-top: 20px;">
							<div class="row">
								<div class="col-12">
									<ul class="list-group">
										<c:forEach var="searchRest" items="${pageScope.searchRestList}">
												<li
													class="list-group-item d-flex justify-content-between align-items-center">
													<td style="width: 70px;"><img class="rounded-circle" width="45" height="45"
														id="modal_userImg" src="${searchRest.rest_profile}"></td>
														<a href="./restDetail.jsp?rest_no=${searchRest.rest_no}" style="color: rgb(218, 0, 0);">${searchRest.rest_name }</a>
													<c:set var="state" value="0"/>
												<c:forEach var="restMember" items="${pageScope.restMemberList}">
													<c:if test="${restMember.rest_no eq searchRest.rest_no && restMember.rest_follow_yn eq 1 }">
														<c:set var="state" value="1"/>
													</c:if>
												</c:forEach>
										
												<c:if test="${state eq 1}">
													<buttton class="btn btn-danger" style="margin-left: 20px;">팔로잉</button>
												</c:if>
												<c:if test="${state eq 0}">	
		                                        	<button class="btn btn-outline-danger" id="w1"
														onmouseover="w1_mouseover()" onmouseout="w1_mouseout()">팔로우</button>
		                                        </c:if>
										</c:forEach>
									</ul>
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

			<!-- 마우스 오버 스크립트 -->
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