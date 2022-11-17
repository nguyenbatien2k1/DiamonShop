<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<title>Đăng ký tài khoản</title>
</head>
<body>
	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<li><a href="#"><span class="icon-chevron-right"></span>Đồng
							hồ</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span>Vòng đeo tay</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span>Dây đeo tay</a></li>
					<li><a href="products.html"><span
							class="icon-chevron-right"></span>Dây chuyền</a></li>
					<li><a class="totalInCart" href="cart.html"><strong>Tổng tiền 
						<span class="badge badge-warning pull-right" style="line-height: 18px;">
							<c:if test="${ not empty loginInfo }">
								<c:if test="${ not empty totalQuantityCart }">
								<span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber type="number" groupingUsed="true" value="${totalPriceCart}" /> VNĐ</span>
								</c:if>
							</c:if>
							
							<c:if test="${ empty loginInfo }">
								<span class="badge badge-warning pull-right" style="line-height: 18px;">0 VNĐ</span>
							</c:if>
						</span>
						</strong></a></li>
				</ul>
			</div>

			<div class="well well-small alert alert-warning cntr">
				<h2>Giảm giá tới 30%</h2>
				<p>
					chỉ áp dụng với đặt hàng online. <br> <br> <a
						class="defaultBtn" href="#">Bấm vào đây </a>
				</p>
			</div>
			<div class="well well-small">
				<a href="#"><img
					src="<c:url value='/assets/user/img/paypal.jpg' />"
					alt="payment method paypal"></a>
			</div>

			<a class="shopBtn btn-block" href="#">Sản phẩm sắp ra mắt <br>
				<small>Bấm để xem thêm</small></a> <br> <br>
			<ul class="nav nav-list promowrapper">
				<li>
					<div class="thumbnail">
						<a class="zoomTool"
							href="<c:url value='/assets/product_details.html' />"
							title="add to cart"><span class="icon-search"></span> Xem chi
							tiết </a> <img
							src="<c:url value='/assets/user/img/bootstrap-ecommerce-templates.PNG'/>"
							alt="bootstrap ecommerce templates">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value='#' />"
									style="display: block">800.000 VNĐ</a>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a class="zoomTool"
							href="<c:url value='/assets/product_details.html' />"
							title="add to cart"><span class="icon-search"></span> Xem chi
							tiết </a> <img
							src="<c:url value='/assets/user/img/shopping-cart-template.PNG'/>"
							alt="shopping cart template">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value='#' />"
									style="display: block">1.000.000 VNĐ</a>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a class="zoomTool"
							href="<c:url value='/assets/product_details.html' />"
							title="add to cart"><span class="icon-search"></span> Xem chi
							tiết</a> <img
							src="<c:url value='/assets/user/img/bootstrap-template.png'/>"
							alt="bootstrap template">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value='#' />"
									style="display: block">500.000 VNĐ</a>
							</h4>
						</div>
					</div>
				</li>
			</ul>

		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="index.html">Trang chủ</a> <span class="divider">/</span></li>
				<li class="active">Người dùng</li>
			</ul>
			<h3>Người dùng</h3>
			<hr class="soft" />

			<div class="row">
				<div class="span4">
					<div class="well">
						<h4 style="text-align: center">Đăng ký tài khoản</h4>
						<br />
						<form:form action="dang-ky" method="POST" modelAttribute="user">
							<div class="control-group">
								<label class="control-label" for="inputEmail">Họ và tên</label>
								<div class="controls">
									<form:input class="span3" type="text" placeholder="Họ và tên"
										path="display_name" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputEmail">Tên đăng
									nhập</label>
								<div class="controls">
									<form:input class="span3" type="email"
										placeholder="Tên đăng nhập" path="user" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputEmail">Mật khẩu</label>
								<div class="controls">
									<form:input class="span3" type="password"
										placeholder="Mật khẩu" path="password" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="inputEmail">Địa chỉ</label>
								<div class="controls">
									<form:input class="span3" type="text" placeholder="Địa chỉ"
										path="address" />
								</div>
							</div>
							<div class="controls">
								<button type="submit" class="btn block">Tạo tài khoản</button>
							</div>
						</form:form>
					</div>
				</div>
				<div class="span1">&nbsp;</div>
				<div class="span4">
					<div class="well">
						<h4 style="text-align: center">Đăng nhập</h4>
						<br />
						<form:form action="dang-nhap" method="POST" modelAttribute="user">
							<div class="control-group">
								<label class="control-label" for="inputEmail">Tài khoản</label>
								<div class="controls">
									<form:input class="span3" type="email" placeholder="Tài khoản"
										path="user" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPassword">Mật
									khẩu</label>
								<div class="controls">
									<form:input type="password" class="span3"
										placeholder="Mật khẩu" path="password" />
								</div>
							</div>
							<h5 style="color: red">${ statusLogin }</h5>
							<div class="control-group">
								<div class="controls">
									<button type="submit" class="defaultBtn">Đăng nhập</button>
									<a href="#">Quên mật khẩu?</a>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>