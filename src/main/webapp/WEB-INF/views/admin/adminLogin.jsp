<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Amor Admin Login</title>
</head>
<style>
	
	body{
	width: 1100px;
	margin: 0 auto;
	}
	
	
	.body{
		text-align: center;
		width: 1100px;
		height: 550px;
		display : flex;
  		justify-content: center;
  		align-items : center;
		}
	
	.loginDiv{
		width: 333px;
		height: 552px;
		margin-top: 500px;		
	}
	
	img {
		width: 200px;
		margin-bottom: 10px;
	}
	
	span{
	font-size: 12.5px;	
	}
	
	.text1{
		width:200px;
		height: 35px;
		border: 1.5px solid #d9d9d9;
		border-radius: 3px;
		border-color: #1A2C82;
		padding-left: 5px;
		margin-bottom: 10px;		
	}
	
	.text2{
		width:200px;
		height: 35px;
		border: 1.5px solid #d9d9d9;
		border-radius: 3px;
		border-color: #1A2C82;
		padding-left: 5px;
		margin-bottom: 5px;
	}
	
	.button{
		width:210px;
		height: 35px;
		border:none;
		padding: 2px 21px 6px 21px;
		border-radius: 3px;
		background: #1A2C82;
		color: #C7E3FF;
		cursor: pointer;
		margin-top: 10px;
	}
	
	.box{
	margin-left: 20px;
	}
	
</style>
<body>
<div class = "body">
<div class = "loginDiv">
<form name = "admin" action = "/amor/admin/adminMain.do" method = "post">
<img src="/amor/resources/img/main_logo.png">
	<input type = "text" name = "admin_id" class = "text1" value = "${cookie.idremember.value}" placeholder="아이디를 입력하세요."><br>
	<input type = "password" name = "admin_pwd" class = "text2"  placeholder="비밀번호를 입력하세요."><br>
	
	<input type = "checkbox" name = "id_remember" ${!empty cookie.idremember ? 'checked':''}><span>ID 기억하기</span>
	<input type = "checkbox" class = "box" name = "autoLogin" ${!empty cookie.autologin ? 'checked':''}> <span>자동 로그인</span>
	
	<input type = "submit" value = "로그인" class = "button">
</form>
</div>
</div>
</body>
</html>