function like(review_no, elem) {

	if (($(elem).children().text() == '취소')) {
		$(elem).children().attr('class', 'fa fa-regular fa-thumbs-up');
		$(elem).children().text('좋아요');
		updateLikeReview(review_no, 0);

	} else if (($(elem).children().text() == '좋아요')) {
		$(elem).children().attr('class', 'fa-solid fa-thumbs-up');
		$(elem).children().text('취소');
		updateLikeReview(review_no, 1);
	}
}
function hate(review_no, elem) {

	if (($(elem).children().text() == '취소')) {
		$(elem).children().attr('class', 'fa fa-regular fa-thumbs-down');
		$(elem).children().text('싫어요');
		updateLikeReview(review_no, 0);
	} else if (($(elem).children().text() == '싫어요')) {
		$(elem).children().attr('class', 'fa-solid fa-thumbs-down');
		$(elem).children().text('취소');
		updateLikeReview(review_no, -1);
	}
}

function updateLikeReview(review_no, state) {
	$.ajax({
		url: 'GBReviewCon',
		type: 'post',
		data: {
			review_no: review_no,
			state: state,
		},
		success: function() {
			alert("리뷰 평가 성공");
		},
		error: function() {
			alert("리뷰 평가 실패");
		}
	});

}

function scrapReview(review_no, elem) {
	if  ($(elem).text() == '스크랩') {
		$(elem).text('스크랩 취소');
		updateScrapReview(review_no, 1);
	} else if ($(elem).text() == '스크랩 취소') {
		$(elem).text('스크랩');
		updateScrapReview(review_no, 0);
	}
}
function updateScrapReview(review_no, state)  
	$.ajax({
		url: 'ScrapReviewCon',
		type: 'post',
		data: {
			review_no: review_no,
			state: state,
		},
		success: function() {
			alert("리뷰 스크랩 성공");
		},
		error: function) {
				alert("리뷰 스크랩 실패");
		}
	});
}
function reportReview(review_no, elem) {

	var review_rep_content = prompt('신고 사유를 입력해주세요');

	updateReportReview(review_no, review_rep_content);

	$(elem).parent().parent().parent().parent().parent().parent().remove();
}
function updateReportReview(review_no, review_rep_content)  
	$.ajax({
		url: 'ReportReviewCon',
		type: 'post',
		data: {
			review_no: review_no,
			review_rep_content: review_rep_content,
		},
		success: function) {
			alert("리뷰 신고 성공");
		},
		error: function) {
			alert("리뷰 신고 실패");
		}
	});
}

function blockReview(review_no, elem)  
	$(elem).parent().parent().parent().parent().parent().parent().remove();

	updateBlockReview(review_no, 1);
}
function updateBlockReview(review_no, state)  
	$.ajax({
		url: 'BlockReviewCon',
		type: 'post',
		data: {
			review_no: review_no,
			state: state,
		},
		success: function() {
			alert("리뷰 차단 성공");
		},
		error: function() {
			alert("리뷰 차단 실패");
		}
	});

}

function followMember(id, elem) {

	if (($(elem).children().attr('class') == 'fa fa-regular fa-heart card-link actionBtn')) {
		$(elem).children().attr('class', 'fa fa-heart card-link actionBtn');
		updateFollowMember(id, 1);
	}
	else if (($(elem).children().attr('class') == 'fa fa-heart card-link actionBtn')) {
		$(elem).children().attr('class', 'fa fa-regular fa-heart card-link actionBtn');
		updateFollowMember(id, 0);
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
		success: function() {
			alert("활동 성공");
		},
		error: function() {
			alert("활동 실패");
		}
	});

}