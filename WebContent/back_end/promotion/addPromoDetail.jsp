<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/back_end/pageTags.jsp"%>
<%@ page import="com.promo_detail.model.*"%>

<%
	String promo_id = request.getParameter("promo_id");
	pageContext.setAttribute("promo_id", promo_id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>新增促銷商品</title>
	<%@ include file="/back_end/headerSection.jsp"%>
</head>

<body class="sticky-header">
	<%@ include file="/back_end/leftSideMenu.jsp"%>

	<!-- main content start-->
	<div class="main-content">
		<%@ include file="/back_end/headerMenu.jsp"%>

		<!--body wrapper start-->
		<div class="wrapper">

			<!--Start Page Title-->
			<div class="page-title-box">
				<h4 class="page-title">促銷管理</h4>
				<ol class="breadcrumb">
					<li><a href="promoDetailManagement.jsp">促銷商品管理</a></li>
					<li><a href="addPromoDetail.jsp">新增促銷商品</a></li>
				</ol>
				<div class="clearfix"></div>
			</div>
			<!--End Page Title-->

			<!--Start row-->
			<div class="row">
				<div class="col-md-12">
					<div class="white-box">
						<h2 class="header-title">
							<div>新增促銷商品</div>
						</h2>
						<div>
							<FORM METHOD="post" ACTION="promoDetail.do" name="form1">
								<table class="display table">
									<jsp:useBean id="pVOSvc" scope="page" class="com.promo_main.model.PromoMainService" />
									<tr>
										<td>促銷編號:</td>
										<td>
											<c:if test="${promo_id == null}">
												<select size="1" name="promo_id">
													<option value="-1" selected>請選擇</option>
													<c:forEach var="pVO" items="${pVOSvc.all}">
														<option value="${pVO.promo_id}" >${pVO.promo_id}</option>
													</c:forEach>
												</select>
											</c:if>
											
											<c:if test="${promo_id != null}">
												<select size="1" name="promo_id">
													<option value="-1">請選擇</option>
													<c:forEach var="pVO" items="${pVOSvc.all}">
														<option value="${pVO.promo_id}" ${promo_id == pVO.promo_id? 'selected' : '' }>${pVO.promo_id}</option>
													</c:forEach>
												</select>
											</c:if>
										</td>
									</tr>
									<jsp:useBean id="bproSvc" scope="page" class="com.b2cpro_main.model.B2cproMainService" />
									<tr>
										<td>產品編號:</td>
										<td>
											<select size="1" name="pro_id">
												<option value="-1">請選擇</option>
												<c:forEach var="bproVO" items="${bproSvc.all}">
													<option value="${bproVO.pro_id}">${bproVO.pro_id}【${bproVO.pro_name}】</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td>促銷價格:</td>
										<td>
											<input type="TEXT" name="promo_price" value="${bproVO.rrp}">
										</td>
									</tr>
								</table>
								<input type="hidden" name="action" value="insert">
								<button type="submit" class="btn btn-info">送出新增</button>
								<button type="button" class="btn btn-info" id="magicBtn">神奇小按鈕</button>
							</FORM>

							<!-- 錯誤表列 -->
							<div>
								<c:if test="${not empty errorMsgs}">
									<font style="color: red">請修正以下錯誤:</font>
									<ul>
										<c:forEach var="message" items="${errorMsgs}">
											<li style="color: red">${message}</li>
										</c:forEach>
									</ul>
								</c:if>
							</div>
							
						</div>
					</div>
				</div>
			</div>
			<!--End row-->
		</div>
		<!-- End Wrapper -->
		<%@ include file="/back_end/footerMenu.jsp"%>
	</div>
	<!--End main content -->
	<%@ include file="/back_end/footerSection.jsp"%>
	
<script>
	// 神奇小按鈕
	$('#magicBtn').click(function(){
		$('[name = "pro_id"]').val('BP0008');
		$('[name = "promo_price"]').val('18888');
	});

</script>	
</body>
</html>