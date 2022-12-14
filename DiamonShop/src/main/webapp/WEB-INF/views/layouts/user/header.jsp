<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>
<header id="header">
	<div class="row">
		<div class="span4">
			<h1>
				<a class="logo" href="<c:url value='/' />"><span>Twitter Bootstrap
						ecommerce template</span> <img
					src="<c:url value='/assets/user/img/logo-bootstrap-shoping-cart.png'/>"
					alt="bootstrap sexy shop"> </a>
			</h1>
		</div>
		<div class="span4">
			<div class="offerNoteWrapper">
				<h1 class="dotmark">
					<i class="icon-cut"></i> Twitter Bootstrap shopping cart HTML
				</h1>
			</div>
		</div>
		<div class="span4 alignR">
			<p>
				<br> <strong> Hỗ trợ (24/7) : 038 444 5041 </strong><br>
				<br>
			</p>
			<c:if test="${ not empty loginInfo }">
						
							<c:if test="${ not empty totalQuantityCart }">
								<span class="btn btn-mini">[ ${ totalQuantityCart } ] <span
								class="icon-shopping-cart"></span></span> 
								<span class="btn btn-warning btn-mini">$</span> 
								<span class="btn btn-mini">&pound;</span>
								<span class="btn btn-mini">&euro;</span>
							</c:if>
							<c:if test="${ empty totalQuantityCart }">
								<span class="btn btn-mini">[ 0 ] <span
								class="icon-shopping-cart"></span></span> 
								<span class="btn btn-warning btn-mini">$</span> 
								<span class="btn btn-mini">&pound;</span>
								<span class="btn btn-mini">&euro;</span>
							</c:if>
			</c:if> 
			
			<c:if test="${ empty loginInfo }">
						<span class="btn btn-mini">[ 0 ] <span class="icon-shopping-cart"></span></span> 
						<span class="btn btn-warning btn-mini">$</span> 
						<span class="btn btn-mini">&pound;</span>
						<span class="btn btn-mini">&euro;</span>
			</c:if>
		</div>
	</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a data-target=".nav-collapse" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="nav-collapse">
				<ul class="nav">
					
					<c:forEach var="item" items="${ menus }" varStatus="index">
						<c:if test="${ index.first }">
							<li class="active">
						</c:if>
						<c:if test="${ not index.first }">
							<li>
						</c:if>
						<a href="#"> ${ item.name } </a></li>
					</c:forEach>
				</ul>
				<form action="#" class="navbar-search pull-left">
					<input type="text" placeholder="Tìm kiếm" class="search-query span2">
				</form>
				<ul class="nav pull-right">
				<c:if test="${ empty loginInfo }">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"><span class="icon-lock"></span>
							Đăng nhập <b class="caret"></b></a>
						<div class="dropdown-menu">
							<form class="form-horizontal loginFrm">
								<div class="control-group">
									<input type="text" class="span2" id="inputEmail"
										placeholder="Email">
								</div>
								<div class="control-group">
									<input type="password" class="span2" id="inputPassword"
										placeholder="Mật khẩu">
								</div>
								<div class="control-group">
									<label class="checkbox"> <input type="checkbox">
										Nhớ mật khẩu
									</label>
									<button type="submit" class="shopBtn btn-block">Đăng nhập</button>
								</div>
							</form>
						</div></li>
				</c:if>
				<c:if test="${ not empty loginInfo }">
					<li>
						<a href="#">
							${ loginInfo.display_name }<b class="caret"></b>
						</a>
					</li>
				</c:if>
					
				</ul>
			</div>
		</div>
	</div>
</div>