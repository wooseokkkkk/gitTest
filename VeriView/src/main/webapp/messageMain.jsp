<%@page import="com.saoe.model.message.MessageDTO"%>
<%@page import="com.saoe.model.message.MessageDAO"%>
<%@page import="com.saoe.model.message.FFFDTO"%>
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script src="https://kit.fontawesome.com/6dc009df2e.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

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

* {
	box-sizing: border-box;
}

.h7 {
	font-size: 15px;
	color: rgb(218, 0, 0);
}

#img1 {
	object-fit: contain;
}

#img2 {
	object-fit: contain;
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
	MessageDAO msgDAO = new MessageDAO();
	
	SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

	int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
	int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
	pageContext.setAttribute("followerCnt", followerCnt);
	pageContext.setAttribute("followingCnt", followingCnt);
	
	List<FFFDTO> fffList = msgDAO.selectFFF(member.getId());
	List<MessageDTO> messageReceiveList = msgDAO.selectReceiveMessage(member.getId());
	List<MessageDTO> messageSendList = msgDAO.selectSendMessage(member.getId());
	
	pageContext.setAttribute("fffList", fffList);
	pageContext.setAttribute("messageReceiveList", messageReceiveList);
	pageContext.setAttribute("messageSendList", messageSendList);
	%>

	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3 member-info">
				<c:if test="${not empty sessionScope.member}">
					<div class="card" style="position: fixed; width:25%;">
						<div class="card-body">
							<div class="row" height="80px">
								<div class="media" style="text-align: center;">
									<a class="thumbnail pull-left"
										href="profile.jsp?id=${sessionScope.member.id}"> <img
										class="rounded-circle" width="80px"
										src="${sessionScope.member.profile }" alt="">
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
					<div class="card" style="position: fixed; width:25%;">
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
				<form action="WriteReviewCon" method="post"
					enctype="multipart/form-data">
					<hr width="150%">
				</form>

				<!-- 메시지 start -->
				<!-- 메시지 폼-->
				<div class="row-fluid">
					<form action="WriteMessageCon" method="post">
						<!--- \\\\\\\Post-->
						<div class="card gedf-card">
							<div class="card-body">
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active" id="posts"
										role="tabpanel" aria-labelledby="posts-tab">
									  <div class="form-group">
									    <select name="receive_id" class="form-control" id="FormControlSelect1">
									      <option>보낼 사람을 선택하세요</option>
									      <c:forEach var="fff" items="${pageScope.fffList}">
										      <option value="${fff.id}">${fff.nick}</option>
									      </c:forEach>
									    </select>
									  </div>
										<div class="form-group my-3">
											<label class="sr-only" for="message">post</label>
											<textarea name="message_content" class="form-control"
												id="message" rows="3" placeholder="쪽지 내용을 입력하세요"></textarea>
										</div>
										<div class="btn-toolbar justify-content-between">
											<div class="btn-group">
												<button type="submit" class="btn btn-outline-danger">업로드</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Post /////-->
					</form>
				</div>
				<!-- 메시지 폼 끝-->
				<br>
				<a href=""><button type="button" class="btn btn-outline-danger">보낸 쪽지</button></a>
				<a href=""><button type="button" class="btn btn-outline-danger">받은 쪽지</button></a>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">보낸이</th>
							<th scope="col">내용</th>
							<th scope="col">시간</th>
						</tr>
					</thead>
					<tbody>
						<!-- 메시지 리시트 for 문-->
							<c:forEach var="message" items="${pageScope.messageReceiveList}" varStatus="status">
						<tr>
							<th scope="row">${status.index}</th>
							<td>${message.send_id}</td>
							<td>${message.message_content}</td>
							<td>${message.message_date }</td>
						</tr>
							</c:forEach>
					</tbody>
				</table>

			</div>

	<!-- 메시지 end-->
	<!-- 광고 배너 -->
	<div class="col-md-3 ad-info" style="position: fixed; width:25%; left: 100%; transform: translateX( -100% );">
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