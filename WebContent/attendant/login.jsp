<%@page import="model.Prompt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club login page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<link rel="stylesheet"
	href="<s:url value="/css/bootstrap-theme.min.css"></s:url>" />
<title>HealthClub--Attendant--login</title>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<a><img alt="logo"
					src="<s:url value="/material/HealthClub.png"></s:url>" /></a>
			</div>
		</div>
	</div>
	<div class="grid-layout module">
		<strong>Login</strong>
		<%
			Prompt prompt = (Prompt) request.getAttribute("prompt");
			if (prompt != null) {
				if (prompt.getState() == true) {
		%>
		<div class="alert alert-success">
			<h1><%=prompt.getMessage()%></h1>
		</div>
		<%
			} else {
		%>
		<div class="alert alert-danger">
			<h1><%=prompt.getMessage()%></h1>
		</div>
		<%
			}
			}
		%>
		<hr>
		<s:form cssClass="form-register" action="attendantlogin" name="login"
			method="post" namespace="/action">
			<span>Please input your login username and password</span>
			<s:div cssClass="box">
				<input type="text" class="form-control"
					placeholder="Login Attendant Name" name="username" id="username"
					onchange=checkUsername() autofocus="autofocus" />
				<span id="username_span" class="right_span"></span>
			</s:div>
			<s:div cssClass="box">
				<input type="password" class="form-control"
					placeholder="Login Attendant Password" name="password"
					id="password" oninput=checkPassword() />
				<span id="passwd_span"></span>
			</s:div>
			<button class="btn btn-lg btn-primary btn-block button-commit login"
				disabled="disabled" type="submit" id="lgbtn">Login</button>
		</s:form>
	</div>
	<script src="<s:url value="/js/validate/login_validate.js"></s:url>"
		type="text/javascript">
		
	</script>
	<footer class="container">&copy; Health Club&#8482;,&nbsp;2014</footer>
</body>
</html>