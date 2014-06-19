<%@page import="model.PageBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.VIP"%>
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
<meta name="description" content="health club view member page" />
<meta name="author" content="zhang xu fan" />
<link rel="shortcut icon"
	href="<s:url value="/material/logo.ico"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/bootstrap.css"></s:url>" />
<link rel="stylesheet" href="<s:url value="/css/customize.css"></s:url>" />
<%
	Attendant attendant = (Attendant) session.getAttribute("attendant");
	String name = attendant.getName();
%>
<title>HealthClub--<%=name%>--viewmember
</title>
</head>
<body>
	<s:div cssClass="navbar navbar-inverse navbar-fixed-top">
		<s:div cssClass="container">
			<s:div cssClass="navbar-header">
				<a href="<s:url value="/index.jsp"></s:url>"><img alt="logo"
					src="<s:url value="/material/HealthClub.png"></s:url>" /></a>
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
				<div class="jumbotron">
					<h1>
						Hello,&nbsp;<%=attendant.getName()%>!
					</h1>
					<p>You can view all member's information here.</p>
					<form class="form-search" action="showmember" method='get'>
						<input name='search_vip' type="text" style="width:500px; float:left;" placeholder="VIP name"
							class="form-control">
						<!-- <button type="submit" style="float:right" class="btn btn-lg btn-primary delete">Search</button> -->
						<s:a cssClass="btn btn-lg btn-primary view" action="viewmember"
									namespace="/action">
									<s:param name="v_id"
										value="1"></s:param>Search</s:a>
					</form>
					<br>
				</div>


				<div class="layout module">
					<%
						@SuppressWarnings("unchecked")
									PageBean pageBean = (PageBean) request
											.getAttribute("pageBean");
									ArrayList<VIP> list = pageBean.getList();
									if (list.size() == 0) {
					%>
					<h3>Oops, there is no one registered to the Health
						Club.&gt;&lt;</h3>
					<%
						} else {
										int size = pageBean.getAllRows();
					%>
					<h3>
						<%=size%>
						<%=(size == 1) ? "user is" : "users are"%>
						registered to the Health Club.
					</h3>
					<s:iterator value="%{#request.pageBean.list}" status="st">
						<div class="card">
							<s:iterator value="%{#request.pageBean.list.get(#st.index)}">
								<s:a cssClass="btn btn-lg btn-primary view" action="viewmember"
									namespace="/action">
									<s:param name="v_id"
										value="%{#request.pageBean.list.get(#st.index).v_id}"></s:param>View</s:a>
								<h4>
									Username:
									<s:property
										value="%{#request.pageBean.list.get(#st.index).username}" />
								</h4>
								<h4>
									Name:
									<s:property
										value="%{#request.pageBean.list.get(#st.index).name}" />
								</h4>
								<h4>
									Gender:
									<s:property
										value="%{#request.pageBean.list.get(#st.index).gender}" />
								</h4>
								<h4>
									Phone:
									<s:property
										value="%{#request.pageBean.list.get(#st.index).phone}" />
								</h4>
								<h4>
									Age:
									<s:property
										value="%{#request.pageBean.list.get(#st.index).age}" />
								</h4>
							</s:iterator>
						</div>
					</s:iterator>
					<div>
						<s:if test="#request.pageBean.currentPage == 1"></s:if>
						<s:else>
							<s:a action="showmember" namespace="/action">
								<s:param name="page" value="0"></s:param>First</s:a>
							&nbsp; &nbsp; 
							<s:a action="showmember" namespace="/action">
								<s:param name="page" value="#request.pageBean.currentPage - 1"></s:param>Previous</s:a>
								&nbsp; &nbsp;
						</s:else>

						<s:if
							test="#request.pageBean.currentPage != #request.pageBean.totalPage">
							<s:a action="showmember" namespace="/action">
								<s:param name="page" value="#request.pageBean.currentPage + 1"></s:param>Next</s:a>
							&nbsp; &nbsp;
							<s:a action="showmember" namespace="/action">
								<s:param name="page" value="#request.pageBean.totalPage"></s:param>Last</s:a>
						</s:if>
						<s:else></s:else>
						<span class="totalpage"> <s:property
								value="%{#request.pageBean.totalPage}" /> &nbsp;pages in total
						</span>
					</div>
					<%
						}
					%>
				</div>
			</s:div>
			<s:div cssClass="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
				<s:div cssClass="list-group">
					<s:a cssClass="list-group-item" action="showmember"
						namespace="/action">VIP &nbsp;Management</s:a>
					<s:a cssClass="list-group-item" action="showactivity"
						namespace="/action">
						<s:param name="a_id" value="%{#session.attendant.a_id}"></s:param>Activity &nbsp;Management
						</s:a>
				</s:div>
			</s:div>
		</s:div>
	</s:div>
</body>
</html>