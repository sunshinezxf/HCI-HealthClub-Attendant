<%@page import="model.Attendant"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="health club add activity page" />
<meta name="author" content="zhang xu fan" />
<link href="<s:url value="/css/bootstrap.min.css"></s:url>"
	rel="stylesheet" media="screen">
<link
	href="<s:url value="/css/bootstrap-datetimepicker.min.css"></s:url>"
	rel="stylesheet" media="screen">
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />

<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />

<%
	Attendant attendant = (Attendant) session.getAttribute("attendant");
	String name = attendant.getName();
%>
<title>HealthClub--<%=name%>--add activity
</title>
</head>
<body>
	<s:div cssClass="navbar navbar-inverse navbar-fixed-top">
		<s:div cssClass="container">
			<s:div cssClass="navbar-header">
				<a><img alt="logo"
					src="<s:url value="/material/HealthClub.png"></s:url>"></a>
			</s:div>
			<s:div cssClass="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a>Hello, &nbsp;<%=attendant.getName()%></a></li>
					<li><a href="<s:url value="/attendant/index.jsp"></s:url>">Home</a></li>
					<li><s:a action="showmember" namespace="/action">Member</s:a></li>
					<li><s:a action="showactivity" namespace="/action">Activity</s:a></li>
				</ul>
			</s:div>
		</s:div>
	</s:div>
	<s:div cssClass="container">
		<s:div cssClass="row row-offcanvas row-offcanvas-right">
			<s:div cssClass="col-xs-12 col-sm-9">
				<p class="pull-right visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<s:div cssClass="jumbotron">
					<h1>
						Hello,&nbsp;<%=attendant.getName()%>!
					</h1>
					<p>You can view all activities and modify activities published
						by you.</p>
				</s:div>
				<s:div cssClass="layout module">
					<strong>Add New Activity</strong>
					<hr>
					<s:form cssClass="form-activity" action="addactivity"
						name="addactivity" namespace="/action">
						<span>Please fill activity information</span>
						<input type="text" class="form-control"
							placeholder="Activity Name" name="ac_name">
						<br>
						<input type="text" class="form-control" placeholder="Location"
							name="location">
						<br>
						<s:div cssClass="span5 col-md-14">
							Date:&nbsp;
							<s:div cssClass="input-daterange input-group">
								<div class="controls input-append date form_date" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input size="16" class="input-sm form-control" type="text"
										name="start" value=""> <span class="add-on"><i
										class="icon-remove"></i></span> <span class="add-on"><i
										class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input2" value="" />
								<br />
								<span class="input-group-addon"
									style="padding: px 2px; height: 8px">to</span>
								<div class="controls input-append date form_date" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="dtp_input2"
									data-link-format="yyyy-mm-dd">
									<input size="16" class="input-sm form-control" type="text"
										name="end" value=""> <span class="add-on"><i
										class="icon-remove"></i></span> <span class="add-on"><i
										class="icon-th"></i></span>
								</div>
								<input type="hidden" id="dtp_input2" value="" />
								<br />
							</s:div>
						</s:div>
						<br>
						<!-- <input type="text" class="form-control" placeholder="Coach No"
							name="co_no" /> -->
						<input type="hidden" name="co_no" value="10000" />
						<select class="form-control">
							<option value="10000">10000</option>
							<option value="10001">10001</option>
							<option value="10002">10002</option>
						</select>
						<br>

						<button class="btn btn-primary btn-lg" type="submit">Publish</button>
					</s:form>
				</s:div>
			</s:div>
			<s:div cssClass="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<s:div cssClass="list-group">
					<s:a cssClass="list-group-item" action="showmember"
						namespace="/action">VIP &nbsp;Management</s:a>
					<s:a cssClass="list-group-item" action="showactivity"
						namespace="/action">Activity &nbsp;Management</s:a>
				</s:div>
			</s:div>
		</s:div>
	</s:div>

	<script type="text/javascript"
		src="<s:url value="/js/jquery-1.11.0.js"></s:url>" charset="UTF-8"></script>
	<script type="text/javascript"
		src="<s:url value="/js/bootstrap.min.js"></s:url>"></script>
	<script type="text/javascript"
		src="<s:url value="/js/bootstrap-datetimepicker.js"></s:url>"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="<s:url value="/js/bootstrap-datetimepicker.fr.js"></s:url>"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$('.form_date').datetimepicker({
			language : 'en',
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0
		});
	</script>
	<footer class="container">&copy; Health Club&#8482;,&nbsp;2014</footer>
</body>
</html>