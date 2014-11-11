<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.search.model.*"%>
<%@ page import="com.search.controller.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/_00_fragment/css.jsp" />
<%@ include file="page1.file"%>
<title>Goo-go</title>
<!-- Google Map Start-->
<style>
html, body, #map-canvas {
	height: 400px;
	width: 400px;
	margin: 10px;
	padding: 10px;
}
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>
	// The following example creates complex markers to indicate beaches near
	// Sydney, NSW, Australia. Note that the anchor is set to
	// (0,32) to correspond to the base of the flagpole.

	function initialize() {
		var mapOptions = {
			zoom : 10,
			center : new google.maps.LatLng(25.02, 121.41)
		//center : new google.maps.LatLng(-33.890542, 151.274856)
		}
		var map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		findComMarkers(map);
	}//end function initialize()

	var comAdressArray = <%=request.getAttribute("comAdressArray")%>; //公司地址陣列
	var comNameArray =<%=request.getAttribute("comNameArray")%>;//公司名稱陣列
	function setMarkers(map, locations) {
		// Add markers to the map

		// Marker sizes are expressed as a Size of X,Y
		// where the origin of the image (0,0) is located
		// in the top left of the image.

		// Origins, anchor positions and coordinates of the marker
		// increase in the X direction to the right and in
		// the Y direction down.
		var image = {
			url : 'images/icon1.jpg',
			// This marker is 20 pixels wide by 32 pixels tall.
			size : new google.maps.Size(109, 106),
			// The origin for this image is 0,0.
			origin : new google.maps.Point(0, 0),
			// The anchor for this image is the base of the flagpole at 0,32.
			anchor : new google.maps.Point(0, 32)
		};
		// Shapes define the clickable region of the icon.
		// The type defines an HTML &lt;area&gt; element 'poly' which
		// traces out a polygon as a series of X,Y points. The final
		// coordinate closes the poly by connecting to the first
		// coordinate.
		var shape = {
			coords : [ 1, 1, 1, 20, 18, 20, 18, 1 ],
			type : 'poly'
		};
		var beach = locations;
		var myLatLng = new google.maps.LatLng(beach[1], beach[2]);
		var marker = new google.maps.Marker({
			position : myLatLng,
			map : map,
			// icon: image,
			shape : shape,
			title : beach[0],
		//zIndex : beach[3]
		});
	}//end function setMarkers(map, locations)
	function addressToLatLng(comName,addr, map) {//將中文地址轉為經緯度
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			"address" : addr
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				var coordinate = [comName, results[0].geometry.location.lat(),
						results[0].geometry.location.lng() ]
				setMarkers(map, coordinate);
				//alert(position);
			} else {
				alert("查無經緯度");
			}
		});//end  geocoder.geocode
	}//end function addressToLatLng(addr) 
	function findComMarkers(map) {
		var rowsPerPage = <%=request.getAttribute("rowsPerPage") %>;
		var whichPage= <%=request.getAttribute("whichPage")%>;//此頁第幾頁
		//alert("rowsPerPage="+rowsPerPage);
		//alert("whichPage="+whichPage);
		var startIndex=(whichPage-1)*rowsPerPage;//該頁起始筆數
		var endIndex = (whichPage*rowsPerPage-1); //該頁終止筆數
		if((comAdressArray.length-1)<endIndex){//當最後一頁顯示筆數不足rowsPerPage
			endIndex = comAdressArray.length-1; //則將剩餘的顯示
		}
		for (var i = startIndex; i <= endIndex ; i++) {	
			addressToLatLng(comNameArray[i],comAdressArray[i], map); //傳入地址陣列
		}
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<!-- Google Map End-->

</head>
<body>
	<!-- top1 -->
	<jsp:include page="/_00_fragment/top1.jsp" />
	<!-- Page Content -->
	<div class="container">
		<br>
		<!-- Search bar -->
		<div class="well">
			<div class="row">
				<div class="col-lg-12 text-center">
					<jsp:include page="/_03_research/researchBar.jsp" />
				</div>
			</div>
		</div>
		<!-- /.Search bar -->
		<!-- 搜尋結果 -->
		<div class="row">
			<!-- 地圖-->
			<div class="col-md-5" id="map-canvas">
				<!-- 				<div id="map-canvas"></div> -->
				<!-- 				<img class="img-responsive" -->
				<%-- 					src="${pageContext.request.contextPath}/img/06.jpg"> <br> --%>
			</div>
			<!-- /.地圖-->
			<!-- 商家列表 -->
			<!-- 右Projects Row -->
			<div class="col-md-7">
				<c:forEach var="SearchComVO" items="${comList}"
					begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					<!-- 第1筆商家 -->
					<div class="col-md-6 img-portfolio">
						<a href="<c:url value='/_05_company/company.jsp'/>"> <img
							class="img-responsive img-hover"
							src="${pageContext.request.contextPath}/img/13.jpg" alt="">
						</a>
						<h3>
							<a href="<c:url value='/_05_company/company.jsp'/>">${SearchComVO.com_name}</a>
						</h3>
						<p>${SearchComVO.com_name}，地點位於${SearchComVO.com_address}，是一家信賴的商家。
						</p>
					</div>
				</c:forEach>
				<!-- Projects Row -->

				<!--/.商家列表 -->

			</div>
			<!-- /.搜尋結果-->
			<br>

			<!-- 頁數 -->
			<div class="row text-center">
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<c:forEach var="i" begin="1" end="<%=pageNumber%>">
							<c:if test="${i == whichPage}">
								<li class="active"><a
									href="${pageContext.request.contextPath}/SearchServlet.do?whichPage=${i}&location=${location}&prod_type=${prod_type}&keySearch=${keySearch}">${i}</a></li>
							</c:if>
							<c:if test="${i != whichPage}">
								<li><a
									href="${pageContext.request.contextPath}/SearchServlet.do?whichPage=${i}&location=${location}&prod_type=${prod_type}&keySearch=${keySearch}">${i}</a></li>
							</c:if>
						</c:forEach>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- /.頁數-->

		<br>

		<!-- Footer -->
		<jsp:include page="/_00_fragment/footer.jsp" />

	</div>
	<!-- /.container -->


	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>


</body>

</html>