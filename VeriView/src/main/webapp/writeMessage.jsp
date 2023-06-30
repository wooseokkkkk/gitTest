<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="WriteMessageCon" method="post">
		보낼 사람 : <input type="text" name="receive_id"><br><br>
		내용 : <textarea rows="5" cols="20" name="message_content"></textarea>
		<input type="submit" value="보내기">
	</form>


</body>
</html>