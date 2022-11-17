<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/layouts/user/taglib.jsp" %>

<title>Trang chủ</title>
<body>
	<!-- Body Section -->
	<div class="row">
		<div id="sidebar" class="span3">
			<div class="well well-small">
				<ul class="nav nav-list">

					<c:forEach var="item" items="${ category }">
						<li><a href="<c:url value = '/san-pham/${ item.id}' />"><span
								class="icon-chevron-right"></span> ${ item.name } </a></li>
					</c:forEach>

					<li><a class="totalInCart" href="#"><strong>Tổng tiền
							<c:if test="${ not empty loginInfo }">
								<c:if test="${ not empty totalQuantityCart }">
								<span class="badge badge-warning pull-right"
								style="line-height: 18px;"><fmt:formatNumber type="number" groupingUsed="true" value="${totalPriceCart}" /> VNĐ</span>
								</c:if>
								<c:if test="${ empty totalQuantityCart }">
								<span class="badge badge-warning pull-right" style="line-height: 18px;">0 VNĐ</span>
								</c:if>
							</c:if>
							
							<c:if test="${ empty loginInfo }">
								<span class="badge badge-warning pull-right" style="line-height: 18px;">0 VNĐ</span>
							</c:if>
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
							href="<c:url value='/assets/product_details.html' />"
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
							href="<c:url value='/assets/product_details.html' />"
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
							href="<c:url value='/assets/product_details.html' />"
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
			<div class="well np">
				<div id="myCarousel" class="carousel slide homCar">
					<div class="carousel-inner">

						<c:forEach var="item" items="${ slides }" varStatus="index">

							<c:if test="${ index.first }">
								<div class="item active">
							</c:if>
							<c:if test="${ not index.first }">
								<div class="item">
							</c:if>

							<div>
								<img style="width: 100%"
									src="<c:url value='/assets/user/img/slide/${item.img}'/>"
									alt="bootstrap ecommerce templates">
								<div class="carousel-caption">
									<h4>${item.caption}</h4>
									<p>
										<span>${item.content}</span>
									</p>
								</div>
							</div>
					</div>
					</c:forEach>

					<a class="left carousel-control" href="#"
						data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
						href="#myCarousel" data-slide="next">&rsaquo;</a>
				</div>
			</div>
</div>
			<!-- New Products -->
			<div class="well well-small">
				<h3>Sản phẩm mới</h3>
				<hr class="soften" />
				<div class="row-fluid">
					<div id="newProductCar" class="carousel slide">
						<div class="carousel-inner">
							
							<c:if test="${ newProducts.size() > 0 }">
								<div class="item active">
									<ul class="thumbnails">
								<c:forEach var="item" items="${ newProducts }" varStatus="loop">
									<li class="span3">
										<div class="thumbnail">
											<a class="zoomTool" href="#"
												title="add to cart"><span class="icon-search"></span>
												Xem thêm</a> <a href="#" class="tag"></a> <a
												href="#"><img
												src="<c:url value='/assets/user/img/${ item.img }'/>"
												alt="bootstrap-ring"></a>
										</div>
									</li>
									<c:if test="${ (loop.index + 1) % 4 == 0 || (loop.index + 1) == newProducts.size() }">
										</ul>
									</div>	
									<c:if test="${ (loop.index + 1) < newProducts.size() }">
										<div class="item">
											<ul class="thumbnails">
									</c:if>
								</c:if>
									
								</c:forEach>
							</c:if>
							
						</div>
						<a class="left carousel-control" href="#newProductCar"
							data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
							href="#newProductCar" data-slide="next">&rsaquo;</a>
					</div>
				</div>
	</div>
			<!-- Featured Products -->
			<div class="well well-small">
				<h3>
					<a class="btn btn-mini pull-right" href="#"
						title="Xem nhiều hơn"> Xem nhiều hơn <span class="icon-plus"></span></a> Sản
					phẩm nổi bật
				</h3>
				<hr class="soften" />
				<div class="row-fluid">

					<c:if test="${ hightlightProducts.size() > 0 }">
						<ul class="thumbnails">	
							<c:forEach var="item" items="${ hightlightProducts }" varStatus="loop">
								<li class="span4">
									<div class="thumbnail">
										<a class="zoomTool" href="chi-tiet-san-pham/${ item.product_id }"
											title="add to cart"><span class="icon-search"></span> Xem thêm</a> <a href="chi-tiet-san-pham/${ item.product_id }"><img
											src="<c:url value='/assets/user/img/${ item.img }' />" alt="Ảnh sản phẩm"></a>
										<div class="caption">
											<h5>${ item.name }</h5>
											<h4>
												<a class="defaultBtn" href="chi-tiet-san-pham/${ item.product_id }"
													title="Click to view"><span class="icon-zoom-in"></span></a>
												<c:if test="${ not empty loginInfo }">
													<a class="shopBtn" href="<c:url value='/AddCart/${ item.product_id }' />" title="Thêm vào giỏ hàng"><span
													class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> VNĐ</span>
												</c:if>
												<c:if test="${ empty loginInfo }">
													<a class="shopBtn" href="<c:url value='/dang-ky' />" title="Thêm vào giỏ hàng"><span
													class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> VNĐ</span>
												</c:if>
												<%-- <a class="shopBtn" href="<c:url value='/AddCart/${ item.product_id }' />" title="Thêm vào giỏ hàng"><span
													class="icon-plus"></span></a> <span class="pull-right"><fmt:formatNumber type="number" groupingUsed="true" value="${item.price}" /> VNĐ</span> --%>
											</h4>
										</div>
									</div>
								</li>
								
								<c:if test="${ (loop.index + 1) % 3 == 0 || (loop.index + 1) == hightlightProducts.size() }">
									</ul>
									<c:if test="${ (loop.index + 1) < hightlightProducts.size() }">
										<ul class="thumbnails">
									</c:if>
								</c:if>
							</c:forEach>
					</c:if>
				</div>
			</div>
		<hr>
			<div class="well well-small">
				<a class="btn btn-mini pull-right" href="#"> Xem thêm <span
					class="icon-plus"></span></a> Tất cả sản phẩm
			</div>
		</div>
	</div>
</body>

