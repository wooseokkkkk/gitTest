<%@page import="com.saoe.model.member.MemberMemberDTO"%>
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
		String id = request.getParameter("id");
		pageContext.setAttribute("id", id);

		ProfileDAO profileDAO = new ProfileDAO();
		ProfileDTO profile = profileDAO.selectProfile(id);
		List<ProfileFeedDTO> profileFeedList = profileDAO.selectProfileFeed(id);
		List<ProfileFollowDTO> profileFollowerList = profileDAO.selectProfileFollower(id);
		List<ProfileFollowDTO> profileFollowingList = profileDAO.selectProfileFollowing(id);
		
		pageContext.setAttribute("profile", profile);
		pageContext.setAttribute("profileFeedList", profileFeedList);
		pageContext.setAttribute("profileFollowerList", profileFollowerList);
		pageContext.setAttribute("profileFollowingList", profileFollowingList);
		
		if(session.getAttribute("member") != null){
			SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
			List<MemberMemberDTO> memberMemberList = new MemberDAO().selectMemberMemberList(member.getId());
			
			pageContext.setAttribute("memberMemberList", memberMemberList);
		}
		
	%>

 <!-- 프로필 시작 -->
    <div class="container-fluid gedf-wrapper">
        <div class="row">
            <div class="col-md-3">
            <div class="row">
                <div class="card" style="position: fixed; width:25%;">
                    <div class="card-body">
                        <div class="media" style="text-align: center;">
                            <a class="thumbnail pull-left" href="./profile.jsp?id=${pageScope.profile.id}">
                                <img class="rounded-circle" width="80px" src="${pageScope.profile.profile}" alt="">
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
                        	<c:if test="${sessionScope.member.id eq pageScope.id}">
		                        <div class="h7" style="height: 80px;">
		                            <a href="./updateMember.jsp" style="color: rgb(218, 0, 0);">프로필 수정</a> <br>
		                            <a href="./myUserList.jsp" style="color: rgb(218, 0, 0);">회원 목록</a> <br>
		                            <a href="./myReviewList.jsp" style="color: rgb(218, 0, 0);">리뷰 목록</a> <br>
		                            <a href="./myRestList.jsp" style="color: rgb(218, 0, 0);">음식점 목록</a>
		                        </div>
	                        </c:if>
                        
                        
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="h6 text-muted">Riview</div>
                            <div class="h5">${fn:length(pageScope.profileFeedList)}</div>
                        </li>
                        <c:choose>
	                        <c:when test="${sessionScope.member.id eq pageScope.id}">
								<li class="list-group-item">
		                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
		                                style="color: rgb(218, 0, 0);" onclick="location.href='LogoutCon'">
		                                로그아웃
		                            </button>
		                        </li>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="location.href='./quit.jsp'">
	                                회원탈퇴
	                            </button>
	                        </li>
	                        </c:when>
	                        <c:otherwise>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="location.href='FollowMemberCon?id=${pageScope.profile.id}&state=1'">
	                                팔로우 하기
	                            </button>
	                        </li>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="location.href='BlockMemberCon?id=${pageScope.profile.id}&state=1'">
	                                차단하기
	                            </button>
	                        </li>
	                        <li class="list-group-item">
	                            <button class="btn btn-outline-danger" type="button" id="button-addon2"
	                                style="color: rgb(218, 0, 0);" onclick="report_member(${pageScope.profile.id})">
	                                신고하기
	                            </button>
	                        </li>
	                        </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
            </div>

            <div class="col-md-6 gedf-main">
                <div class="container">
                    <div class="row">	
                        <c:forEach var="review" items="${pageScope.profileFeedList}">
	                        <div class="card gedf-card" style="margin-right: 30px;">
	                            <div class="box">
	                                <div>
	                                    <img src="${review.review_pic_src }"
	                                        class="aaa">
	                                </div>
	                                <div class="card-body">
	                                    <div class="box-title">
	                                        <a href="./restDetail.jsp?rest_no=${review.rest_no }"><h4>${fn:substring(review.rest_name,0,5) }...</h4></a>
	                                    </div>
	                                    <div class="box-text">
	                                        <span>${fn:substring(review.review_content,0,8)}..</span>
	                                    </div>
	                                    <div class="box-btn">
	                                        <a href="./reviewDetail.jsp?review_no=${review.review_no}">더보기</a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- 팔로우 팔로워 -->
            <div class="col-md-3" style="position: fixed; width:25%; left: 100%; transform: translateX( -100% );">
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
                                            src="${follower.profile }"  width="45" height="45"></a></td>
                                    <td id="modal_userID"><a href="./profile.jsp?id=${follower.id}">${follower.nick}</a></td>
                                    <td id="modal_userFollow">
                                    	<c:set var="state" value="0" />
										<c:forEach var="memberMember" items="${pageScope.memberMemberList}">
											<c:if test="${memberMember.id eq follower.id && memberMember.member_follow_yn eq 1 }">
												<c:set var="state" value="1"/>
											</c:if>
										</c:forEach>
										
										<c:if test="${state eq 1}">
											<button class="btn btn-danger" onclick="followMember('${follower.id}', this)" style="margin-left: 20px;">팔로잉</button>
										</c:if>
										<c:if test="${state eq 0}">	
                                        	<button class="btn btn-outline-danger" onclick="followMember('${follower.id}', this)" style="margin-left: 20px;">팔로우</button>
                                        </c:if>
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
                                            src="${following.profile }" width="45" height="45"></a></td>
                                    <td id="modal_userID"><a href="./profile.jsp?id=${following.id}">${following.nick}</a></td>
                                    <td id="modal_userFollow">
                                        <c:set var="state" value="0" />
										<c:forEach var="memberMember" items="${pageScope.memberMemberList}">
											<c:if test="${memberMember.id eq following.id && memberMember.member_follow_yn eq 1 }">
												<c:set var="state" value="1"/>
											</c:if>
										</c:forEach>
										
										<c:if test="${state eq 1}">
											<button class="btn btn-danger" onclick="followMember('${following.id}', this)" style="margin-left: 20px;">팔로잉</button>
										</c:if>
										<c:if test="${state eq 0}">	
                                        	<button class="btn btn-outline-danger" onclick="followMember('${following.id}', this)" style="margin-left: 20px;">팔로우</button>
                                        </c:if>
                                    </td>
                                </tr>
							</c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	function report_member(id){
    		var member_rep_content = prompt("신고 사유를 입력해주세요");

    		 $.ajax({
    		        url: 'ReportMemberCon',
    		        type: 'post',
    		        data: {
    		            id: id,
    		            member_rep_content: member_rep_content,
    		        },
    		        success: function () {
    		        	alert("활동 성공");
    		        },
    		        error: function () {
    					alert("활동 실패");
    		        }
    		    });
    	}
    </script>
    
    	<script>
	function followMember(id, elem){
		
		if($(elem).text()=='팔로잉'){
			$(elem).text('팔로우');
			updateFollowMember(id, 0);
		}else if($(elem).text()=='팔로우'){
			$(elem).text('팔로잉');
			updateFollowMember(id, 1);
		}
	}
	
	function updateFollowMember(id, state) {
	    $.ajax({
	        url: 'FollowMemberCon',
	        type: 'post',
	        data: {
	            id: id,
	            state: state,
	        },
	        success: function () {
	        	alert("활동 성공");
	        },
	        error: function () {
				alert("활동 실패");
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