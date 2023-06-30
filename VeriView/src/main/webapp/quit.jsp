<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@page import="com.saoe.model.profile.ProfileFollowDTO"%>
<%@page import="com.saoe.model.profile.ProfileFeedDTO"%>
<%@page import="com.saoe.model.profile.ProfileDTO"%>
<%@page import="com.saoe.model.profile.ProfileDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"">

    <style>
        @import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

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

        @media (min-width: 992px) {
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
		SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
		String id = member.getId();
		pageContext.setAttribute("id", id);

		ProfileDAO profileDAO = new ProfileDAO();
		ProfileDTO profile = profileDAO.selectProfile(id);
		List<ProfileFollowDTO> profileFollowerList = profileDAO.selectProfileFollower(id);
		List<ProfileFollowDTO> profileFollowingList = profileDAO.selectProfileFollowing(id);
		
		pageContext.setAttribute("profile", profile);
		pageContext.setAttribute("profileFollowerList", profileFollowerList);
		pageContext.setAttribute("profileFollowingList", profileFollowingList);
		
	%>

 <!-- 프로필 시작 -->
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
                <div class="card" style="position: fixed; width:25%;">
                    <div class="card-body">
                        <div class="media" style="text-align: center;">
                            <a class="thumbnail pull-left" href="./profile.jsp?id=${pageScope.profile.id}">
                                <img class="rounded-circle" width="80px" src="https://picsum.photos/50/50" alt="">
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
                            <a href="./updateMember.jsp" style="color: rgb(218, 0, 0);">프로필 수정</a> <br>
                            <a href="./myUserList.jsp" style="color: rgb(218, 0, 0);">회원 목록</a> <br>
                            <a href="./myReviewList.jsp" style="color: rgb(218, 0, 0);">리뷰 목록</a> <br>
                            <a href="./myRestList.jsp" style="color: rgb(218, 0, 0);">음식점 목록</a>
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
                <form action="">

                    <div class="card mb-2">
                        <div class="card-header bg-light" style="color: rgb(218, 0, 0); text-align: center;">
                            <h6>탈퇴 사유를 입력해 주세요.</h6>
                        </div>
                        <div class="card-body">
                            <div class="form-group"><textarea class="form-control" rows="3"></textarea></div>
                        </div>
                        <div class="card-header bg-light" style="color: rgb(218, 0, 0); text-align: center;">
                            <h6>비밀번호를 입력해 주세요.</h6>
                        </div>
                        <div class="card-body">
                            <div class="form-group"><textarea class="form-control" rows="1"></textarea></div>
                        </div>
                        <div class="card-header bg-light" style="color: rgb(218, 0, 0); text-align: center;">
                            <h6>정말 떠나시겠습니까?</h6>
                        </div>
                        <div class="card-body">
                            <div class="form-group" style="text-align: center;">
                                <button class="btn btn-danger" type="submit"
                                    style="margin-right: 30px; width: 75px;">네</button>
                                <button class="btn btn-danger" onclick="location.href='#'">아니오</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <!-- 광고 배너 -->
<div class="col-md-3">
                <div class="card gedf-card">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title"><span
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Followers</span>${fn:length(pageScope.profileFollowerList)}</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                            <c:if test="${empty pageScope.profileFollowerList}">팔로우한 회원이 없습니다.</c:if>
                            <c:forEach var="follower" items="${pageScope.profileFollowerList}">
                                <tr>
                                    <td style="width:70px;"><a href="./profile.jsp?id=${follower.id}"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></a></td>
                                    <td id="modal_userID"><a href="./profile.jsp?id=${follower.id}">${follower.nick}</a></td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-outline-danger" style="margin-left: 20px;">팔로우</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="card gedf-card">
                    <div class="card-body">
                        <div>
                            <h4 class="card-title"><span
                                    style="color: rgb(218, 0, 0); margin-right: 15px;">Following</span>${fn:length(pageScope.profileFollowingList)}</h4>
                        </div>
                        <div>
                            <table class="modal_table" style="top: 80px;">
                            <c:if test="${empty pageScope.profileFollowingList}">팔로잉한 회원이 없습니다.</c:if>
                            <c:forEach var="following" items="${pageScope.profileFollowingList}">
                                <tr>
                                    <td style="width:70px;"><a href="./profile.jsp?id=${following.id}"><img class="rounded-circle" id="modal_userImg"
                                            src="https://picsum.photos/50/50"></a></td>
                                    <td id="modal_userID"><a href="./profile.jsp?id=${following.id}">${following.nick}</a></td>
                                    <td id="modal_userFollow">
                                        <buttton class="btn btn-danger" style="margin-left: 20px;">언팔로우</button>
                                    </td>
                                </tr>
							</c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
    <div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Home</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
    </ul>
    <p class="text-center text-body-secondary">© 2023 Company, Inc</p>
  </footer>
</div>
    
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>

</html>