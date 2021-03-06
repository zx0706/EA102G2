<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.front_end_b2cpro_main.model.*"%>
<%@ page import="com.spec_main.model.*"%>
<%@ page import="com.spec_detail.model.*"%>
<%@ page import="com.pro_spec.model.*"%>

<%
	front_B2cproMainService bSvc = new front_B2cproMainService();
	String pro_id = request.getParameter("pro_id");
	System.out.println(pro_id);
	front_B2cproMainVO b2cpromainVO = bSvc.findByPrimaryKey(pro_id);	// 存入req的empVO物件
	request.setAttribute("b2cpromainVO", b2cpromainVO);
%>
<%-- <jsp:useBean id="catagorySvc" scope="page" class="com.catagory.model.CatagoryService" /> --%>
<jsp:useBean id="smSvc" scope="page"
	class="com.spec_main.model.SpecMainService" />
<jsp:useBean id="b2cproMainSvc" scope="page"
	class="com.front_end_b2cpro_main.model.front_B2cproMainService" />


<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="M_Adnan" />
<title>SHOP_DETAIL</title>

<%@ include file="/front_end/headerSection.jsp"%>


<style>
.col-xs-6 {
	margin-top: 16px;
	margin-right: 82px;
	padding: 13px;
}

.col-md-7 {
	width: 36.333333%;
	margin-left: 146px;
	margin-right: 80px;
}

}
.slides, .slides>li, .flex-control-nav, .flex-direction-nav {
	margin: revert;
	padding: 0px;
	list-style: none;
	list-style-position: initial;
	list-style-image: initial;
	list-style-type: none;
}
</style>

</head>
<body>
<jsp:useBean id="proSpecSvc" scope="page" class="com.pro_spec.model.ProSpecService" />
<jsp:useBean id="specMSvc" scope="page" class="com.spec_main.model.SpecMainService" />
<jsp:useBean id="specDSvc" scope="page" class="com.spec_detail.model.SpecDetailService" />

	<!-- LOADER -->
	<div id="loader">
		<div class="position-center-center">
			<div class="ldr"></div>
		</div>
	</div>

	<!-- Wrap -->
	<div id="wrap">
		<!-- header -->
		<%@ include file="/front_end/headerMenu.jsp"%>

		<!-- Content -->
		<div id="content"></div>

		<!-- Popular Products -->
		<section class="padding-top-100 padding-bottom-100">
			<div class="container">

				<!-- SHOP DETAIL -->
				<div class="shop-detail">
					<div class="row">

						<!-- Popular Images Slider -->
						<div class="col-md-7">

							<!-- Images Slider -->

							<ul class="slides">
								<li data-thumb="images/large-img-1.jpg"><img
									class="img-responsive" width="250px" height="250px"
									src="<%= request.getContextPath()%>/front_end/front_b2cpro_main/front_b2cpro_main.do?pro_id=${b2cpromainVO.pro_id}"
									alt=""></li>
							</ul>
						</div>
						<!-- COntent -->
						<div class="col-md-5">
							<h4>${b2cpromainVO.pro_name}</h4>
							<span class="price"><small>$</small>${b2cpromainVO.rrp}</span>

							<!-- Short By -->
							<div class="some-info">
								<ul class="row margin-top-30">
									<li class="col-xs-4">
										<div class="quinty">
											<!-- QTY -->
											<span class="stock"><small>現有庫存：${b2cpromainVO.stock}</small></span>
										</div>
									</li>
									<!-- ADD TO CART -->
								</ul>

							</div>
						</div>
					</div>
				</div>

				<!--======= PRODUCT DESCRIPTION =========-->
				<div class="item-decribe">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs animate fadeInUp" data-wow-delay="0.4s"
						role="tablist">
						<li role="presentation" class="active"><a href="#descr"
							role="tab" data-toggle="tab">商品描述</a></li>
						<li role="presentation"><a href="#tags" role="tab"
							data-toggle="tab">商品規格</a></li>


					</ul>

					<!-- Tab panes -->
					<div class="tab-content animate fadeInUp" data-wow-delay="0.4s">
						<!-- 描述 -->
						<div role="tabpanel" class="tab-pane fade in active" id="descr">
							<pre>${b2cpromainVO.pro_des}</pre>


						</div>

						<!-- 檢舉-->
					<div role="tabpanel" class="tab-pane fade" id="tags">
<pre>
<c:forEach var="proSpec" items="${proSpecSvc.findByPrimaryKey(b2cpromainVO.pro_id)}">
${specMSvc.findByPrimaryKey(specDSvc.findByPrimaryKey(proSpec.specDet_id).spec_id).spec_des}：${specDSvc.findByPrimaryKey(proSpec.specDet_id).detail_des}
</c:forEach>
</pre>
					</div>
				</div>
			</div>
		</section>





		<%@ include file="/front_end/footerMenu.jsp"%>
		<%@ include file="/front_end/footerSection.jsp"%>
	</div>

	<!------------------------------------ 送出訂單------------------------------------->
	<div class="modal fade" id="buy" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<FORM METHOD="post" ACTION="c2csoMain.do" name="form1">

				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"></h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<h5>已加入購物車！</h5>
						<input type="hidden" name="action" value="insert_soMain">
						<input type="hidden" name="pro_id" value="${b2cpromainVO.pro_id}">
						<input type="hidden" name="buyer_id" value="MEM0001"> <input
							type="hidden" name="status" value="CST0001">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">確定</button>
					</div>
				</div>
			</FORM>
		</div>
	</div>





	<script>
	 $(function(){
		 let data = {};
		 data.reported_content = '${c2cproMainVO.pro_id}';
		 data.informant = 'MEM0002'
		 let url = '<%=request.getContextPath()%>/front_end/c2cproMain/c2cproRep.do';
		 
	     function clean(){
	    	 data.informant = '';
	    	 data.case_description = '';
	    	 data.action = '';
	    	 console.log("clean", data);
			 $('#review [name="case_description"]').val('');
	     }
	     
		 $('#review .no-margin').click(function(){
//			 data["case_description"] = $(this).data("reported_case_descriptioncontent");
			 data.case_description = $('#review [name="case_description"]').val();
			 data.action = 'insert_proRep';
			 console.log("new", data);
			 
			 $.ajax({
				url: '<%=request.getContextPath()%>/front_end/c2cproMain/c2cproRep.do',
				type : 'post',
				data : data,
				datatype : 'json',
				success : function(res) {
					console.log(res)
					res = JSON.parse(res).data;
					alert(res);
					clean();
				}
			});
		});
	});
	</script>

</body>
</html>
