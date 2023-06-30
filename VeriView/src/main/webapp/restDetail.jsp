<%@page import="com.saoe.model.member.RestMemberDTO"%>
<%@page import="com.saoe.model.member.MemberDAO"%>
<%@page import="com.saoe.model.restaurant.RestaurantDAO"%>
<%@page import="com.saoe.model.restaurant.RestaurantDTO"%>
<%@page import="com.saoe.model.restaurant.RestPicDTO"%>
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
	rel="stylesheet">
<script src="https://kit.fontawesome.com/6dc009df2e.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

* {
	box-sizing: border-box;
}

#img1 {
	object-fit: contain;
}

#img2 {
	object-fit: contain;
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
	int rest_no = Integer.parseInt(request.getParameter("rest_no"));
	RestaurantDTO rest = new RestaurantDAO().restDetail(rest_no);

	System.out.println(rest.getRest_name());

	MemberMemberDAO memberMemberDAO = new MemberMemberDAO();

	MemberDAO memberDAO = new MemberDAO();

	if (session.getAttribute("member") != null) {
		SessionUserDTO member = (SessionUserDTO) session.getAttribute("member");

		List<RestMemberDTO> restMemberList = memberDAO.selectRestMemberList(member.getId());
		pageContext.setAttribute("restMemberList", restMemberList);

		int followerCnt = memberMemberDAO.selectFollowerCnt(member.getId());
		int followingCnt = memberMemberDAO.selectFollowingCnt(member.getId());
		pageContext.setAttribute("followerCnt", followerCnt);
		pageContext.setAttribute("followingCnt", followingCnt);

	}
	pageContext.setAttribute("rest", rest);
	%>
	<c:set var="followstate" value="0" />
	<c:set var="gbwstate" value="0" />
	<c:set var="blockstate" value="0" />
	
	<c:forEach var="restMember" items="${pageScope.restMemberList}">
		<c:if test="${restMember.rest_no eq pageScope.rest.rest_no && restMember.rest_follow_yn eq 1 }">
			<c:set var="followstate" value="1" />
		</c:if>
		<c:if test="${restMember.rest_no eq pageScope.rest.rest_no && restMember.rest_gb eq 1 }">
			<c:set var="gbstate" value="1" />
		</c:if>
		<c:if test="${restMember.rest_no eq pageScope.rest.rest_no && restMember.rest_gb eq -1 }">
			<c:set var="gbstate" value="-1" />
		</c:if>
		<c:if test="${restMember.rest_no eq pageScope.rest.rest_no && restMember.rest_block_yn eq 1 }">
			<c:set var="blockstate" value="1" />
		</c:if>
	</c:forEach>

	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
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
					<div class="card">
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
				<!-- 피드에 뜨는 음식점 프로필 -->
				<div class="card gedf-card">
					<div class="card-header">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex justify-content-between align-items-center">
								<div class="mr-2">
									<img class="rounded-circle" width="45"
										src="${pageScope.rest.rest_profile}" alt="">
								</div>
								<div class="ml-2">
									<div class="h5 m-0">
										<a href="" style="color: rgb(0, 0, 0);">${pageScope.rest.rest_name}</a>
									</div>
								</div>
							</div>
							<div></div>
						</div>
					</div>
					<div class="card-body">
						<div class="rest_cate">
							<!-- 음식점 카테고리 -->
							<span class="badge badge-danger">${pageScope.rest.main_cate}</span>
							<span class="badge badge-danger">${pageScope.rest.sub_cate}</span>
						</div>
						<div class="text-muted h7 mb-2">
							<i class="fa fa-clock-o"></i>${pageScope.rest.rest_post_date}
						</div>
						<a class="card-link" href="#" style="color: rgb(62, 52, 52);">
							<form object-fit: cover>
								<hr width="100%">
								<div>
									<!-- 부트스트랩 슬라이드 -->
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<div class="carousel-inner" style="height: 600px">
											<div class="carousel-item active"
												style="background-color: black; height: 100%; width: 100%;">
												<img id="img1" src="${pageScope.rest.rest_profile }"
													class="d-block w-100" alt="..."
													style="max-height: 100%; max-width: 80%; transform: translate(-50%, -50%); position: absolute; top: 50%; left: 50%;">
											</div>
											<c:forEach var="restPic"
												items="${pageScope.rest.restPicList}">
												<div class="carousel-item"
													style="background-color: black; height: 100%; width: 100%;">
													<img id="img2" src="${restPic.rest_pic_src}"
														class="d-block w-100" alt="..."
														style="max-height: 100%; max-width: 80%; transform: translate(-50%, -50%); position: absolute; top: 50%; left: 50%;">
												</div>
											</c:forEach>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" role="button"
											data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleIndicators" role="button"
											data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
									<!-- 여기까지 -->
								</div>
								<hr width="100%">
								<td class="rest_score">음식점 점수 :
									${pageScope.rest.rest_score}</td>
								<td style="text-align: left;">
									<!-- 음식점 종합 점수 -->
								</td> <br>
								<!--  식당 좋아요 싫어요 번튼 -->
								<div class="rest_act_btn">
									<button type="button"
										onclick="followRest(${pageScope.rest.rest_no}, this);"
										class="btn btn-outline-danger">
										<c:if test="${followstate eq 1}">팔로잉</c:if>
										<c:if test="${followstate eq 0}">팔로우</c:if>
									</button>
									<button type="button"
										onclick="likeRest(${pageScope.rest.rest_no}, this);"
										class="btn btn-outline-danger">
										<c:choose>
										<c:when test="${gbstate eq 1}">좋아요 취소</c:when>
										<c:otherwise>좋아요</c:otherwise>
										</c:choose>
										</button>
									<button type="button"
										onclick="dislikeRest(${pageScope.rest.rest_no}, this);"
										class="btn btn-outline-danger">
										<c:choose>
										<c:when test="${gbstate eq -1}">싫어요 취소</c:when>
										<c:otherwise>싫어요</c:otherwise>
										</c:choose>
										</button>
									<button type="button"
										onclick="blockRest(${pageScope.rest.rest_no}, this)"
										class="btn btn-outline-danger">
										<c:if test="${blockstate eq 1}">차단 취소</c:if>
										<c:if test="${blockstate eq 0}">차단</c:if>
										</button>
								</div>
								<hr width="100%">
								<br>
								<table class="rest_list" object-fit: cover>
									<tr>
										<td class="rest_info">업태</td>
										<td class="rest_detail">${pageScope.rest.main_cate}</td>
									</tr>
									<tr>
										<td class="rest_info">주소</td>
										<td class="rest_detail">${pageScope.rest.rest_addr}/
											${pageScope.rest.rest_addr2}</td>
									</tr>
									</td>
									<tr>
										<td class="rest_info">네이버 점수</td>
										<td class="rest_detail">${pageScope.rest.rest_naver_score}
										</td>
									</tr>
									<tr>
										<td class="rest_info">카카오 점수</td>
										<td class="rest_detail">${pageScope.rest.rest_kakao_score}
										</td>
									</tr>
									<tr>
										<td class="rest_info">구글 점수</td>
										<td class="rest_detail">${pageScope.rest.rest_google_score}
										</td>
									</tr>
								</table>
								<br>
								<hr width="100%">
								<!-- 카카오맵 API-->
								<div id="map" style="width: 100%; height: 220px;">카카오api 맵
									주소검색방식</div>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d380a4c2450d34abdf2a93857f8be93"></script>


								<!-- 카카오맵 자바스크립트 -->
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												33.450701, 126.570667), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};
									// 지도를 생성합니다    
									var map = new kakao.maps.Map(mapContainer,
											mapOption);
									// 주소-좌표 변환 객체를 생성합니다
									var geocoder = new kakao.maps.services.Geocoder();
									// 주소로 좌표를 검색합니다
									geocoder
											.addressSearch(
													'광주 동구 지산로 21',
													function(result, status) {
														// 정상적으로 검색이 완료됐으면 
														if (status === kakao.maps.services.Status.OK) {
															var coords = new kakao.maps.LatLng(
																	result[0].y,
																	result[0].x);
															// 결과값으로 받은 위치를 마커로 표시합니다
															var marker = new kakao.maps.Marker(
																	{
																		map : map,
																		position : coords
																	});
															// 인포윈도우로 장소에 대한 설명을 표시합니다
															var infowindow = new kakao.maps.InfoWindow(
																	{
																		content : '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
																	});
															infowindow
																	.open(map,
																			marker);
															// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
															map
																	.setCenter(coords);
														}
													});
								</script>
								<!-- 카카오맵 자바스크립트-->


							</form> <a href="./restFeed.jsp?rest_no=${pageScope.rest.rest_no}">
								<div class="card mb-2">
									<div class="card-header bg-light"
										style="color: rgb(218, 0, 0);">
										<!-- 리뷰 아이콘-->
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-card-text"
											viewBox="0 0 16 16">
                                            <path
												d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"></path>
                                            <path
												d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"></path>
                                        </svg>
										<!-- 리뷰 아이콘 -->

										리뷰모아보기
									</div>

								</div>
						</a>
					</div>
				</div>
			</div>

			<!-- 광고 배너 -->
			<div class="col-md-3"
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
	<!-- 페이지 넘기기 버튼 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
	<!-- 페이지 넘기기 속도 개선 및 투명도-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>

	<script>
	function followRest(rest_no, elem){
		
		
		if($(elem).text().trim() == '팔로우'){
			$(elem).text('팔로잉');
			updateFollowRest(rest_no, 1);
		}else if($(elem).text().trim() == '팔로잉'){
			$(elem).text('팔로우');
			updateFollowRest(rest_no, 0);
		}

	}

	function updateFollowRest(rest_no, state) {
	    $.ajax({
	        url: 'FollowRestCon',
	        type: 'post',
	        data: {
	            rest_no: rest_no,
	            state: state
	        },
	        success: function () {
	        	alert("활동 성공");
	        },
	        error: function () {
				alert("활동 실패");
	        }
	    });

	}
	function likeRest(rest_no, elem){
		
		if($(elem).text().trim() == '좋아요'){
			$(elem).text('좋아요 취소');
			$(elem).next().text('싫어요');
			updateGBRest(rest_no, 1);
		}else if($(elem).text().trim() == '좋아요 취소'){
			$(elem).text('좋아요');
			updateGBRest(rest_no, 0);
		}
	}
	
	function dislikeRest(rest_no, elem){
		
		if($(elem).text().trim() == '싫어요'){
			$(elem).text('싫어요 취소');
			$(elem).prev().text('좋아요');
			updateGBRest(rest_no, -1);
		}else if($(elem).text().trim() == '싫어요 취소'){
			$(elem).text('싫어요');
			updateGBRest(rest_no, 0);
		}
	}
	
	function blockRest(rest_no, elem){
		
		if($(elem).text().trim() == '차단'){
			$(elem).text('차단 취소');
			updateBlockRest(rest_no, 1);
		}else if($(elem).text().trim() == '차단 취소'){
			$(elem).text('차단');
			updateBlockRest(rest_no, 0);
		}
	}
	function updateBlockRest(rest_no, state) {
	    $.ajax({
	        url: 'BlockRestCon',
	        type: 'post',
	        data: {
	            rest_no: rest_no,
	            state: state
	        },
	        success: function () {
	        	alert("활동 성공");
	        },
	        error: function () {
				alert("활동 실패");
	        }
	    });

	}
	
	
	
	function updateGBRest(rest_no, state) {
	    $.ajax({
	        url: 'GBRestCon',
	        type: 'post',
	        data: {
	            rest_no: rest_no,
	            state: state
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