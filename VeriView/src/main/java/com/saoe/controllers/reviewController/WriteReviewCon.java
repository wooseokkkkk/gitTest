package com.saoe.controllers.reviewController;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.saoe.model.member.MemberDTO;
import com.saoe.model.member.SessionUserDTO;
import com.saoe.model.review.ReviewDAO;
import com.saoe.model.review.ReviewDTO;
import com.saoe.model.review.ReviewPicDTO;

@WebServlet("/WriteReviewCon")
public class WriteReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 파일 저장할 경로
		String path = request.getServletContext().getRealPath("file");
		System.out.println(path);

		int maxSize = 10 * 1024 * 1024;

		// 인코딩 방식
		String encoding = "UTF-8";

		// 파일 이름 중복 방지
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		
		
		// 파일 업로드 객체
		MultipartRequest multi;
		
		try {
			
			multi = new MultipartRequest(request, path, maxSize, encoding, rename);
			
			Enumeration files = multi.getFileNames();
			List<ReviewPicDTO> reviewPicList = new ArrayList<ReviewPicDTO>();
			
			while(files.hasMoreElements()) {
				String file = (String)files.nextElement();
				String file_name = multi.getFilesystemName("file");
				String ori_file_name = multi.getOriginalFileName(file);
				
				ori_file_name = "./file/" + ori_file_name;
				reviewPicList.add(new ReviewPicDTO(ori_file_name, 0));
				
			}
			
			
			// 리뷰 작성 페이지에서 받아오는 값들
			int rest_no = Integer.parseInt(multi.getParameter("rest_no"));
			System.out.println(rest_no);
			String review_content = multi.getParameter("review_content");

			// 리뷰 작성자 id를 세션에서 받아옴
			HttpSession session = request.getSession();
			SessionUserDTO dto = (SessionUserDTO) session.getAttribute("member");
			String id = dto.getId();

			// review 테이블에 넣기위해 객체에 담음
			ReviewDTO review = new ReviewDTO(id, rest_no, review_content);

			// 사진을 업로드하기위해 생성된 게시글 시퀀스를 받음
			ReviewDAO dao = new ReviewDAO();
			
			// 사진을 객체에 담음
			int cnt = dao.uploadReview(review, reviewPicList);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("main.jsp");

	}

}
