<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>
<head>
<title>Thanh toán</title>
</head>
<body>
	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">
					<li><a href="#"><span
							class="icon-chevron-right"></span>Đồng hồ</a></li>
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
				<h2>Giảm giá 30%</h2>
				<p>
					chỉ áp dụng với đặt hàng online. <br> <br> <a
						class="defaultBtn" href="#">Xem tại đây </a>
				</p>
			</div>
			<div class="well well-small">
				<a href="#"><img
					src="<c:url value='/assets/user/img/paypal.jpg'/>"
					alt="payment method paypal"></a>
			</div>

			<a class="shopBtn btn-block" href="#">Sản phẩm sắp ra mắt<br>
				<small>Bấm để xem</small></a> <br> <br>
			<ul class="nav nav-list promowrapper">
				<li>
					<div class="thumbnail">
						<a class="zoomTool"
							href="<c:url value='#' />"
							title="add to cart"><span class="icon-search"></span> Xem chi tiết </a> <img
							src="<c:url value='/assets/user/img/bootstrap-ecommerce-templates.PNG'/>"
							alt="bootstrap ecommerce templates">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value='#' />" style="display: block">800.000 VNĐ</a> 
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a class="zoomTool"
							href="<c:url value='#' />"
							title="add to cart"><span class="icon-search"></span> Xem chi tiết </a> <img
							src="<c:url value='/assets/user/img/shopping-cart-template.PNG'/>"
							alt="shopping cart template">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value='#' />" style="display: block">1.000.000 VNĐ</a>
							</h4>
						</div>
					</div>
				</li>
				<li style="border: 0">&nbsp;</li>
				<li>
					<div class="thumbnail">
						<a class="zoomTool"
							href="<c:url value='#' />"
							title="add to cart"><span class="icon-search"></span> Xem chi tiết</a> <img
							src="<c:url value='/assets/user/img/bootstrap-template.png'/>"
							alt="bootstrap template">
						<div class="caption">
							<h4>
								<a class="defaultBtn" href="<c:url value='#' />" style="display: block">500.000 VNĐ</a>
							</h4>
						</div>
					</div>
				</li>
			</ul>

		</div>
		<div class="span9">
			<ul class="breadcrumb">
				<li><a href="<c:url value='/' />">Trang chủ</a> <span class="divider">/</span></li>
				<li class="active">Người dùng<span class="divider">/</span></li>
				<li>Thanh toán</li>
			</ul>
			<h3>Thanh toán</h3>
			<hr class="soft" />

			<div class="row">
				<div class="span9">
					<div class="well">
						<form:form action="thanh-toan" method="POST" modelAttribute="bills" class="form-horizontal">
							<h2 style="text-align: center">Thanh toán đơn hàng</h2>
							<br />
							<div class="control-group">
								<label class="control-label">Họ và tên <sup>*</sup></label>
								<div class="controls">
									<form:input type="text" class="span3" placeholder=" Họ và tên " path="display_name" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Email <sup>*</sup></label>
								<div class="controls">
									<form:input type="email" class="span3" placeholder=" Email" path="user" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Liên hệ <sup>*</sup></label>
								<div class="controls">
									<form:input type="text" class="span3" placeholder=" Số điện thoại" path="phone" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Địa chỉ <sup>*</sup></label>
								<div class="controls">
									<form:textarea rows="5" cols="30" path="address" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Ghi chú <sup>*</sup></label>
								<div class="controls">
									<form:textarea rows="5" cols="30" path="note"/>
								</div>
							</div>
							<div class="control-group">
								<div class="controls">
									<input type="submit" name="submitAccount" value="Đặt hàng" class="exclusive shopBtn">
								</div>
							</div>
						</form:form>
					</div>
				</div>
				<div class="span1">&nbsp;</div>
			</div>

		</div>
	</div>
</body>