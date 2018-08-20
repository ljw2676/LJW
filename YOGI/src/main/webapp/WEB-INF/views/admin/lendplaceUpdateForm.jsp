<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>장소 수정</title>
<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">
<style>
.map_title { position: relative; width: 730px;   height:350px; margin-left: 2px;}

div.map_title{
   border-color: gray;
   border-style: solid;
   border-width: thin;
   position:relative;

}
</style>
</head>
<body>
<table border="0" width=1000px align=center>
   <tr>
      <h1>장소 수정</h1>
   </tr>
</table>

<form id="up_form" name="up_form" method="post" enctype="multipart/form-data" >
<input type="hidden" value="${map.L_NO}" name="L_NO">
<table>
	<tr>
		<td>장소명 ${map.L_SUBJECT }</td>
	</tr>
	<tr>
		<td>주소 ${map.L_ADDR }</td>
		<td><div id="map" style="width:700px;height:500px;" class="om_detail_contet_map"></div></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><textarea name="L_CONTENT" >${map.L_CONTENT }</textarea></td>
	</tr>
	
	<tr>
		<td>수용인원</td>
		<td><input type="number" name="L_ENABLE" value="${map.L_ENABLE }"/></td>
	</tr>
	
	<tr>
		<td>비용</td>
		<td><input type="number" name="L_PAYMENT" value="${map.L_PAYMENT }"/></td>
	</tr>
	<tr>
		<td>대관 시작날짜 <input type="hidden" data-toggle="datepicker1" name="L_SDATE"></input>
			<div id="datepicker-container1"></div></td></tr>
	<tr>
		<td>대관 종료날짜 <input type="hidden" data-toggle="datepicker2" name="L_EDATE"></input>
		<div id="datepicker-container2"></div></td></tr>
	<tr>
		<td>대표 이미지</td>
	</tr>
	
	<tr>
		<td><input type="button" id="update"  value="수정"/></td>
	</tr>
</table>
</form>
<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#update").on("click", function(e) { //등록
		       e.preventDefault();
		        if($('#L_CONTENT').val()==""){
					 alert("내용을 입력해주세요.");
						return false;
				 } else if($('#L_ENABLE').val()==""){
					 alert("수용인원을 입력해주세요.");
						return false;
				 } else if($('#L_PAYMENT').val()==""){
					 alert("비용을 입력해주세요.");
						return false;
				 } else if($('#L_SDATE').val()==""){
					 alert("대관 시작 날짜를 입력해주세요.");
						return false;
				 } else if($('#L_EDATE').val()==""){
					 alert("대관 종료 날짜를 입력해주세요.");
						return false;
				 } else {
		       fn_updateLendplace();
				 }
		    });
		
		var l_sdate = $('[data-toggle="datepicker1"]').datepicker({
	 		  language: 'ko-KR',
	 		  inline: true,
	 		  container: '#datepicker-container1',
	 		  format: 'yyyy-mm-dd'
	 	      	}).on('pick.datepicker', function (e) {
	 	    		l_edate.datepicker('setStartDate', e.date);
	 			}),
	 		l_edate = $('[data-toggle="datepicker2"]').datepicker({
		 		  language: 'ko-KR',
		 		  inline: true,
		 		  container: '#datepicker-container2',
		 		  format: 'yyyy-mm-dd'
		 	 });
});
	function fn_updateLendplace(){
	    var comSubmit = new ComSubmit("up_form");
	    comSubmit.setUrl("<c:url value='/lendplace/update' />");
	    comSubmit.submit();
	 } 
      //지도
     
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addr2coord('${map.L_ADDR}', function(status, result) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${map.L_SUBJECT}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});
</script>
</body>
</html>