<%@page import="com.saoe.model.member.SessionUserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap");

        /* font-family: 'Abril Fatface', cursive;
font-family: 'Open Sans', sans-serif; */

        * {
            margin: 0;
            padding: 0;
            outline: none;
            box-sizing: border-box;
            line-height: 1.5em;
            color: #747474;
            font-family: "Open Sans", sans-serif;
            font-size: 12px;
        }

        body {
            height: 100vh;
            display: flex;
        }

        .main {
            width: 70%;
            height: 75%;
            margin: auto;\
            border-radius: 10px;
            /* display: flex; */
            
            /* background: rgb(249, 63, 76); */
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            transition: all 0.1s ease-in 0.1s;
        }

        /* PAGE HOME */
        .home {
            width: 100%;
            height: 100%;
            border-radius: 10px;
            color: white;
            background: rgb(222, 49, 49);
            display: flex;
            /* flex or none */
            flex-flow: column wrap;
            justify-content: center;
            align-items: center;

            opacity: 1;
            transition: all 0.4s ease-in 0.2s;
        }

        .home h1 {
            margin-bottom: 80px;
            color: white;
            text-align: center;
        }

        .home h1 span {
            color: white;
            display: block;
            font-size: 2.5em;
            font-family: "Abril Fatface", cursive;
        }

        .home p {
            margin-top: 40px;
        }

        .home p a {
            color: white;
        }

        .btn {
            background: none;
            border: 2px solid white;
            border-radius: 150px;
            align-self: center;
            width: 150px;
            padding: 8px 16px;
            margin: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.1s ease-in-out 0.1s;
        }

        .btn:hover {
            background: white;
            color: rgb(222, 49, 49);
        }

        /* PAGE SING UP */
        .sign-up {
            display: none;
            /*flex or none*/
            opacity: 1;
            width: 100%;
            height: 100%;
        }

        .signup-left {
            width: 50%;
            /* padding: 20px; */
            opacity: 0;
            display: flex;
            flex-flow: column wrap;
            justify-content: space-between;
            font-size: 14px;
            background: rgb(222, 49, 49);
            border-radius: 10px 0 0 10px;
            transition: all 0.5s ease-in 0.2s;
        }

        .signup-left h1 {
            font-size: 21px;
            font-family: "Abril Fatface", cursive;
            letter-spacing: 2px;
        }

        .signup-left h1,
        .signup-left div,
        .signup-left h3,
        .signup-left p {
            color: white;
        }

        .signup-left h3 {
            font-size: 2.2em;
        }

        .btn-back {
            align-self: flex-start;
            display: flex;
            align-items: center;
            font-weight: bold;
            cursor: pointer;
        }

        .angle-left-color {
            color: white;
            margin-right: 5px;
        }

        .form-area {
            position: absolute;
            top: 20%;
            left: 40%;
            width: 20%;
            height: 60%;
            padding: 20px 0;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            z-index: 2;

            opacity: 0;
            transition: opacity 0.5s ease-in 0.2s;
        }

        .organize-form {
            width: 100%;
            height: 100%;
            display: flex;
            flex-flow: column wrap;
            justify-content: space-around;
            align-items: center;
        }

        .organize-form h2 {
            font-size: 1.4em;
            font-weight: normal;
        }

        .organize-form h2::after {
            content: "";
            display: block;
            width: 50%;
            height: 2px;
            background: rgb(222, 49, 49);
            margin: 0 auto;
        }

        .organize-form p a {
            color: rgb(222, 49, 49);
            text-decoration: none;
            font-weight: bold;
        }

        .form-area-signup {
            /* display: none; */
            opacity: 0;
            transition: all 0.4s ease-in 0.2s;
        }

        .form-area-signin {
            /* display: none; */
            opacity: 0;
            transition: all 0.4s ease-in 0.2s;
        }

        .form {
            width: 85%;
        }

        .form-field {
            display: flex;
            flex-flow: column wrap;
            width: 100%;
        }

        .form-field input {
            border: none;
            padding: 5px;
            border-bottom: 1px solid rgba(116, 116, 116, 0.44);
            height: 30px;
            transition: border-bottom 0.1s ease-in-out 0.1s;
        }

        .form-field input:focus {
            border-bottom: 1px solid rgb(222, 49, 49);
        }

        .form-field label {
            position: relative;
            top: 25px;
            left: 5px;
            /* cursor: text; */
            transition: all 0.2s ease-in-out 0.1s;
            color: rgba(116, 116, 116, 0.44);
            user-select: none;
        }

        input[type="radio"] {
            vertical-align: middle;
            padding-left: 50px;
        }

        .btn-sign {
            border: none;
            background: rgb(222, 49, 49);
            color: white;
            font-weight: bold;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            border-radius: 50px;
            cursor: pointer;
            transition: background 0.1s ease 0.1s;
        }

        .btn-sign:hover {
            background: rgb(222, 49, 49);
        }

        .signup-right {
            width: 50%;
            padding: 20px;
            background: white;
            border-radius: 0 10px 10px 0;
            display: flex;
            flex-flow: column wrap;
            justify-content: space-between;
            align-items: flex-end;
            background-image: url("https://i.pinimg.com/564x/50/90/b9/5090b9d7d306945e360bcc3d9682f691.jpg");
            background-size: 70%;
            background-repeat: no-repeat;
            background-position: 235% 50%;

            opacity: 0;
            transition: opacity 0.5s ease-in 0.2s, background-position-x 0.5s ease-in 0.2s;
        }

        .bars-style {
            color: rgb(222, 49, 49);
            cursor: pointer;
            font-size: 16px;
        }

        @media (max-width: 1023px) {
            .main {
                width: 100%;
                height: 100%;
            }

            .home,
            .signup-left {
                border-radius: 0;
            }

            .form-area {
                left: 35%;
                width: 30%;
                height: 70%;
            }
        }

        @media (max-width: 768px) {
            .form-area {
                left: 20%;
                width: 60%;
            }

            .wc_message {
                /*     display: none; */
                opacity: 0;
                transition: opacity .1s;
            }
        }

        @media (max-width: 375px) {
            .form-area {
                left: 10%;
                width: 80%;
            }
        }
    </style>
</head>

<body>
<%
   SessionUserDTO member = (SessionUserDTO)session.getAttribute("member");
   
   if(member != null){
      response.sendRedirect("main.jsp");
   }

%>
    <main class="main">
        <section class="home">
            <h1>Welcome to the <span>VeriView🍒</span></h1>
            <button id="sign-up" class="btn">회원가입</button>
            <button id="sign-in" class="btn">로그인</button>
            <button id="guest-in" class="btn" onclick = "location.href = 'main.jsp'">게스트 입장</button>
        </section>

        <section class="sign-up">
            <article class="signup-left">
                <h1>VeriView🍒</h1>
                <div class="wc_message">
                    <h3>WELLCOME!</h3>
                    <p>베리뷰를 찾아주셔서 감사합니다.</p>
                </div>
                <div class="btn-back">
                    <i class="fas fa-2x fa-angle-left angle-left-color"></i>
                    HOME
                </div>
            </article>

            <article class="form-area">
                <!-- Form area Sign Up -->
                <div class="organize-form form-area-signup">
                    <h2>회원가입</h2>
                    <form action="JoinCon" class="form">

                        <div class="form-field">
                            <label for="id">아이디</label>
                            <input type="text" id="id" name="id" />
                        </div>

                        <div class="form-field">
                            <label for="password">비밀번호</label>
                            <input type="password" id="password" name="pw" />
                        </div>

                        <div class="form-field">
                            <label for="name">이름</label>
                            <input type="text" id="name" name="name" />
                        </div>

                        <div class="form-field">
                            <label for="nick">닉네임</label>
                            <input type="text" id="nick" name="nick" />
                        </div>

                        <div class="form-field">
                            <label for="phone">전화번호</label>
                            <input type="text" id="phone" name="tel" />
                        </div>

                        <div class="form-field">
                            <label for="local">지역</label>
                            <input type="text" id="local" name="addr" />
                        </div>

                        <div class="form-field">
                            <label for="date"></label>
                                <input type="date" id="date" name="birth" />
                            
                        </div>

                        <div class="form-field">
                            <div>
                                <input type="radio" name="gender" value="man">남
                                <input type="radio" name="gender" value="woman">여
                            </div>
                        </div>
                        <button class="btn-sign btn-up">회원가입</button>
                        <button type="reset" class="btn-sign btn-up">초기화</button>
                    </form>
                    <p>이미 가입 하셨습니까? <a href="#" class="link-in">로그인</a></p>

                </div>

                <!-- Form area Sign In -->
                <div class="organize-form form-area-signin">
                    <h2>로그인</h2>
                    <form action="LoginCon" class="form">
                        <div class="form-field">
                            <label for="id-in">아이디</label>
                            <input type="text" name="id" id="id-in" />
                        </div>

                        <div class="form-field">
                            <label for="password-in">비밀번호</label>
                            <input type="password" name="pw" id="password-in" />
                        </div>

                        <button class="btn-sign btn-in">로그인</button>
                    </form>
                    <p>회원이 아니십니까? <a href="#" class="link-up">회원가입</a></p>
                </div>
            </article>

            <article class="signup-right">
                <i class="fas fa-2x fa-bars bars-style"></i>
            </article>
        </section>
    </main>
    <script src="./assets/js/start.js"></script>
</body>
</html>