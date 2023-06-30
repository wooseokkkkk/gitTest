<%@page import="com.saoe.model.category.CategoryDTO"%>
<%@page import="com.saoe.model.feed.FeedDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
@import
	url("https://fonts.googleapis.com/css?family=Abril+Fatface|Open+Sans:400,700&display=swap")
	;

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
	margin: auto;
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

.signup-left h1, .signup-left div, .signup-left h3, .signup-left p {
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
	background-image:
		url("https://i.pinimg.com/564x/50/90/b9/5090b9d7d306945e360bcc3d9682f691.jpg");
	background-size: 70%;
	background-repeat: no-repeat;
	background-position: 235% 50%;
	opacity: 0;
	transition: opacity 0.5s ease-in 0.2s, background-position-x 0.5s
		ease-in 0.2s;
}

.bars-style {
	color: rgb(222, 49, 49);
	cursor: pointer;
	font-size: 16px;
}

@media ( max-width : 1023px) {
	.main {
		width: 100%;
		height: 100%;
	}
	.home, .signup-left {
		border-radius: 0;
	}
	.form-area {
		left: 35%;
		width: 30%;
		height: 70%;
	}
}

@media ( max-width : 768px) {
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

@media ( max-width : 375px) {
	.form-area {
		left: 10%;
		width: 80%;
	}
}

.form-check-label {
	color: white;
	font-size: 20px;
}

input[type="checkbox"] {
	-webkit-appearance: none;
	/* 기본 스타일 제거 */
	-moz-appearance: none;
	appearance: none;
	width: 20px;
	height: 20px;
	border: 2px solid white;
	border-radius: 5px;
	outline: none;
	transition: all 0.3s;
}

/* 체크박스가 체크되었을 때의 스타일 */
input[type="checkbox"]:checked {
	background-color: rgb(222, 49, 49);
	border-color: white;
}

/* 체크박스의 체크 마크 스타일 */
input[type="checkbox"]:checked::before {
	content: "\2714";
	/* 체크 마크 */
	display: block;
	text-align: center;
	color: white;
	font-size: 16px;
	line-height: 20px;
}

.cc {
	margin-bottom: 10px;
}
</style>
</head>

<body>
	<%
	String id = request.getParameter("id");
	
	List<CategoryDTO> cateList = new FeedDAO().selectCate();
	pageContext.setAttribute("cateList", cateList);
	%>
	<main class="main">
		<section class="home">
			<h1>
				Welcome to the <span>VeriView🍒</span> <span>"Please select
					your interests!"<span>
			</h1>
			<div class="col-md-12 container-fluid">
				<div class="container">
					<form action="InsertInter" style="width: 100%;">
						<input type="hidden" name="id" value="<%=id%>">
						<div class="form-group row" style="text-align: center;">
							<div class="col-sm-10">
								<div>
									<c:forEach var="main_cate" items="${pageScope.cateList}">
										<div class="cc">
											<input class="form-check-input" type="checkbox" value="${main_cate.code_no}" id="movie" name="inter">
											<label class="form-check-label" for="movie">${main_cate.main_cate}</label>
										</div>
									</c:forEach>
									<div style="margin-top: 50px;">
										<button id="sign-up" class="btn" type="submit">GO!</button>
									</div>
								</div>
							</div>
					</form>
				</div>
			</div>
		</section>

	</main>
	<script src="#"></script>
	<script>
        // Elements
        const el = {
            signUpHome: document.getElementById('sign-up'),
            signInHome: document.getElementById('sign-in'),
            btnHome: document.querySelector('.btn-back'),
            pageMain: document.querySelector('.main'),
            pageHome: document.querySelector('.home'),
            pageSignUp: document.querySelector('.sign-up'),
            formArea: document.querySelector('.form-area'),
            sideSignLeft: document.querySelector('.signup-left'),
            sideSignRight: document.querySelector('.signup-right'),
            formSignUp: document.querySelector('.form-area-signup'),
            formSignIn: document.querySelector('.form-area-signin'),
            linkUp: document.querySelector('.link-up'),
            linkIn: document.querySelector('.link-in'),
            btnSignUp: document.querySelector('.btn-up'),
            btnSignIn: document.querySelector('.btn-in'),
            labels: document.getElementsByTagName('label'),
            inputs: document.getElementsByTagName('input'),
        };


        // ADD Events
        // Show the page Sign Up
        el.signUpHome.addEventListener('click', function (e) {
            showSign(e, 'signup');
        });
        el.linkUp.addEventListener('click', function (e) {
            showSign(e, 'signup');
        });

        // Show the page sign in
        el.signInHome.addEventListener('click', function (e) {
            showSign(e, 'signin');
        });
        el.linkIn.addEventListener('click', function (e) {
            showSign(e, 'signin');
        });
        el.btnSignUp.addEventListener('click', function (e) {
            showSign(e, 'signin');
        });

        // Show the page Home
        el.btnHome.addEventListener('click', showHome);


        // Functions Events
        // function to show screen Home
        function showHome(event) {


            setTimeout(function () {
                el.sideSignLeft.style.padding = '0';
                el.sideSignLeft.style.opacity = '0';
                el.sideSignRight.style.opacity = '0';
                el.sideSignRight.style.backgroundPositionX = '235%';

                el.formArea.style.opacity = '0';
                setTimeout(function () {
                    el.pageSignUp.style.opacity = '0';
                    el.pageSignUp.style.display = 'none';
                    for (input of el.inputs) {
                        input.value = '';
                    }
                }, 900);

            }, 100);

            setTimeout(function () {
                el.pageHome.style.display = 'flex';
            }, 1100);

            setTimeout(function () {
                el.pageHome.style.opacity = '1';
            }, 1200);

        }
        // function to show screen Sign up/Sign in
        function showSign(event, sign) {

            if (sign === 'signup') {
                el.formSignUp.style.display = 'flex';
                el.formSignIn.style.opacity = '0';
                setTimeout(function () {
                    el.formSignUp.style.opacity = '1';
                }, 100);
                el.formSignIn.style.display = 'none';

            } else {
                el.formSignIn.style.display = 'flex';
                el.formSignUp.style.opacity = '0';
                setTimeout(function () {
                    el.formSignIn.style.opacity = '1';
                }, 100);
                el.formSignUp.style.display = 'none';
            }

            el.pageHome.style.opacity = '0';
            setTimeout(function () {
                el.pageHome.style.display = 'none';
            }, 700);

            setTimeout(function () {
                el.pageSignUp.style.display = 'flex';
                el.pageSignUp.style.opacity = '1';

                setTimeout(function () {
                    el.sideSignLeft.style.padding = '20px';
                    el.sideSignLeft.style.opacity = '1';
                    el.sideSignRight.style.opacity = '1';
                    el.sideSignRight.style.backgroundPositionX = '230%';

                    el.formArea.style.opacity = '1';
                }, 10);

            }, 900);
        }

        // Behavior of the inputs and labels
        for (input of el.inputs) {
            console.log(input)
            input.addEventListener('keydown', function () {
                this.labels[0].style.top = '10px';
            });
            input.addEventListener('blur', function () {
                if (this.value === '') {
                    this.labels[0].style.top = '25px';
                }
            })
        }
    </script>
</body>

</html>