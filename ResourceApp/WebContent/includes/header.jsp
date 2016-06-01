<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Code Resources</title>

<link href="./css/reset.css" rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="./css/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./navbar-fixed-top.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- custom stylesheets -->

<link href="./css/readable-theme.min.css" rel="stylesheet">

<link href="./css/stylesheet.css" rel="stylesheet">



</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.do">Code Resources</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<c:if test="${currentUser.userType.accessLevel > 0 }">
					<li><a href="setUpSearch.do">Search</a></li>
					<li><a href="setUpSearchUserResources.do">Search saved resources</a></li>
					<li><a href="manageMyAccount.do">Menu</a></li>
					<li><a href="setUpContribute.do">Contribute</a></li>
					</c:if>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">About<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a target="_blank" href="http://www.alexmpeterson.com">My website</a></li>
							<li><a target="_blank" href="http://www.alexmpeterson.com/projects.php">More of my projects</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">About this project</a></li>
						</ul></li>
					<c:if test="${currentUser.userType.accessLevel < 1 || currentUser.userType.accessLevel == null}">
					<li><a href="index.do">Login</a></li>
					</c:if>
					<c:if test="${currentUser.userType.accessLevel > 0 }">
					<li><a href="logout.do">Logout</a></li>
					</c:if>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	
	<div class="container">
<%@ include file="/includes/messagePrintout.jsp"%>
	