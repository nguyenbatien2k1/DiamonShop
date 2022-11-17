<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp"%>

<title>Chi tiết sản phẩm</title>
<style>
.product-content {
	overflow-x: hidden;
}
</style>
<body>
	<!-- Body Section -->
	<div class="row product-content">
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
				<li><a href="#">Trang chủ</a> <span class="divider">/</span></li>
				<li><a href="#">Sản phẩm</a> <span class="divider">/</span></li>
				<li class="active">Chi tiết sản phẩm</li>
			</ul>
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span5">
						<div id="myCarousel" class="carousel slide cntr">
							<div class="carousel-inner">
								<div class="item active">
									<a href="#"> <img
										src="<c:url value='/assets/user/img/${ product.img }' />"
										alt="" style="width: 100%"></a>
								</div>
							</div>
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev">‹</a> <a class="right carousel-control"
								href="#" data-slide="next">›</a>
						</div>
					</div>
					<div class="span7">
						<h3>${ product.name }</h3>
						<hr class="soft" />
						
						<c:if test="${ not empty loginInfo }">
							<form class="form-horizontal qtyFrm" method="get" action="<c:url value='/AddCart/${ product.product_id }' />">
							<div class="control-group">
								<label class="control-label"><span><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}" />VNĐ</span></label>
								<div class="controls">
									<input type="number" min="1" value="1" class="span6">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"><span>Color</span></label>
								<div class="controls">
									<select class="span11">
										<option>Red</option>
										<option>Purple</option>
										<option>Pink</option>
										<option>Red</option>
									</select>
								</div>
							</div>
							<p>${ product.title }
							<p>
								<button type="submit" class="shopBtn">
									<span class=" icon-shopping-cart"></span> Thêm vào giỏ hàng
								</button>
						</form>
						</c:if>
						
						<c:if test="${ empty loginInfo }">
							<form class="form-horizontal qtyFrm" method="get" action="<c:url value='/dang-ky' />">
							<div class="control-group">
								<label class="control-label"><span><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}" />VNĐ</span></label>
								<div class="controls">
									<input type="number" min="1" value="1" class="span6">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"><span>Màu sắc</span></label>
								<div class="controls">
									<select class="span11">
										<option>Đỏ</option>
										<option>Tím</option>
										<option>Hồng</option>
										<option>Vàng</option>
									</select>
								</div>
							</div>
							<p>${ product.title }
							<p>
								<button type="submit" class="shopBtn">
									<span class=" icon-shopping-cart"></span> Thêm vào giỏ hàng
								</button>
						</form>
						</c:if>

					</div>
				</div>
				<hr class="softn clr" />


				<ul id="productDetail" class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab">Chi
							tiết sản phẩm</a></li>
					<li class=""><a href="#profile" data-toggle="tab">Sản phẩm
							liên quan</a></li>
				</ul>
				<div id="myTabContent" class="tab-content tabWrapper">
					<div class="tab-pane fade active in" id="home">${ product.details }
					</div>
					<div class="tab-pane fade" id="profile">
						
						<c:set var="countList" value="${ productByCategoryId.size() }" />
						
							<c:if test="${ productByCategoryId.size() > 5 }">
								<c:set var="countList" value="5" />
							</c:if>
							
						<c:forEach var="item" begin="1" end="${ countList }" items="${ productByCategoryId }" varStatus="loop">
							<div class="row-fluid">
								<div class="span2">
									<img src="<c:url value='/assets/user/img/${ item.img }' />" alt="">
								</div>
								<div class="span6">
									<h5>${ item.name }</h5>
									<p>${ item.title }</p>
								</div>
								<div class="span4 alignR">
									<form class="form-horizontal qtyFrm">
										<h3><fmt:formatNumber type="number" groupingUsed="true" value="${product.price}" />VNĐ</h3>
										<div class="btn-group">
											<a href="#" class="defaultBtn"><span
												class=" icon-shopping-cart"></span> Thêm sản phẩm</a> <a
												href="#" class="shopBtn">Xem thêm</a>
										</div>
									</form>
								</div>
							</div>
							<hr class="soft">
						</c:forEach>
						
					</div>
				</div>
			</div>
		</div>
		<!-- Body wrapper -->
</body>