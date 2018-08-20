<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>장소 등록 </title>
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
      <h1>장소 등록</h1>
   </tr>
</table>

<form action="Insert" id="lp_form" name="lp_form" method="post" enctype="multipart/form-data" >
<table>
	<tr>
		<td>장소명</td>
		<td><input type="text" name="L_SUBJECT"/></td>
	</tr>
	
	<tr>
		주소 <input class = "addrSearch" id="search_keyword_addr" type="text" name="" size="53%" onkeypress="searchAddrEnterKey();" maxlength="25">
		<input type="button" value="검색" onclick="searchAddrEnterKey('13');">
  		<div class="map_title">
  		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
   		</div>
		<input id="detail_addr" type="text" name="L_ADDR" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
		
	</tr>
	
	<tr>
		<td>내용</td>
		<td><textarea name="L_CONTENT" ></textarea></td>
	</tr>
	
	<tr>
		<td>수용인원</td>
		<td><input type="number" name="L_ENABLE"/></td>
	</tr>
	
	<tr>
		<td>비용</td>
		<td><input type="number" name="L_PAYMENT"/></td>
	</tr>
	<tr>
		<td>대관시작날짜</td>
		<td><input type="date" name="L_SDATE"/></td>
	</tr>
	<tr>
		<td>대관끝날짜</td>
		<td><input type="date" name="L_EDATE"/></td>
	</tr>
	
	<tr>
	<td>대표 이미지</td>
	<td><input type="file" id="L_REP_IMG" name="L_REP_IMG"></td>
	</tr>

<!-- 	<tr>
		<td>
		<a href="#this" class="btn" id="addFile">이미지 추가</a>
		<div id="fileDiv">
			<p>
			<input type="file" id="IMAGE" name="IMAGE">
			<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			</p>
			</div>
			</td>
	</tr> -->
				
	<tr>
		<td><input type="button" id="insert" name="insert" value="등록" onclick="#this" /></td>
		<!-- <td><input type="submit" value="등록" ></td> -->
	</tr>
</table>
</form>
 <script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
    $("#insert").on("click", function(e) { //등록
       e.preventDefault();
       if($('#L_SUBJECT').val()==""){
			alert("장소명을 입력해주세요.");
			return false;
		 } else if($('#L_ADDR').val()==""){
			 alert("주소를 입력해주세요.");
				return false;
		 } else if($('#L_CONTENT').val()==""){
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
		 } else if($('#L_REP_IMG').val()==""){
			alert("대표이미지를 선택해주세요.");
			    return false;
		 }  else {
       fn_insertLendplace();
		 }
    });
});

 
 
 function fn_insertLendplace(){
    var comSubmit = new ComSubmit("lp_form");
    comSubmit.setUrl("<c:url value='/admin/lendplace/Insert' />");
    comSubmit.submit();
 } 
 
/*  $("#addFile").on("click", function(e){ //파일 추가 버튼
		e.preventDefault();
		fn_addFile();
	});
 
 function fn_addFile(){
		var str = "<p><input type='file' name='IMAGE'> <a href='#this' class='btn' name='delete'>삭제</a></p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}
 
 function fn_deleteFile(obj){
		obj.parent().remove();
	} */
	

     
      //지도
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level : 3
         // 지도의 확대 레벨
         };

         // 지도를 생성합니다    
         var map = new daum.maps.Map(mapContainer, mapOption);

         // 장소 검색 객체를 생성합니다
         var ps = new daum.maps.services.Places(); 
         var searchAddr = document.getElementById('search_keyword_addr');
         function searchAddrEnterKey(btn){
             if(event.keyCode == 13 || btn==13) {
               ps.keywordSearch(searchAddr.value, placesSearchCB); 
            }
         }
         
         // 키워드 검색 완료 시 호출되는 콜백함수 입니다
         function placesSearchCB (status, data, pagination) {
             if (status === daum.maps.services.Status.OK) {

                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                 // LatLngBounds 객체에 좌표를 추가합니다
                 var bounds = new daum.maps.LatLngBounds();

                 for (var i=0; i<data.places.length; i++) {
                     displayMarker(data.places[i]);    
                     bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
                 }       
                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                 map.setBounds(bounds);
             } 
         }

         // 지도에 마커를 표시하는 함수입니다
         function displayMarker(place) {
             // 마커를 생성하고 지도에 표시합니다
             var marker = new daum.maps.Marker({
                 map: map,
                 position: new daum.maps.LatLng(place.latitude, place.longitude) 
             });

             daum.maps.event.addListener(marker, 'click', function() {
                searchDetailAddrFromCoords(new daum.maps.LatLng(place.latitude, place.longitude), function(status, result) {
                  if (status === daum.maps.services.Status.OK) {
                     var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
                     document.getElementById('detail_addr').value=detailAddr;
                     document.getElementById('o_title').value=place.title;
                     // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                       infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
                       infowindow.open(map, marker);
                  }
               });
             });
         }
         
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new daum.maps.services.Geocoder();
         var marker = new daum.maps.Marker() // 클릭한 위치를 표시할 마커입니다
          ,infowindow = new daum.maps.InfoWindow({
            zindex : 1
         });  // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
         
         // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
         daum.maps.event.addListener(map, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
               if (status === daum.maps.services.Status.OK) {
                  var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
                  document.getElementById('detail_addr').value=detailAddr;
                  
                  // 마커를 클릭한 위치에 표시합니다 
                  marker.setPosition(mouseEvent.latLng);
                  marker.setMap(map);
                  
                  // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                  infowindow.setContent('<div style="padding:5px;font-size:12px;">' + detailAddr + '</div>');
                  infowindow.open(map, marker);
               }
            });
         });

         function searchAddrFromCoords(coords, callback) {
            geocoder.coord2addr(coords, callback); // 좌표로 행정동 주소 정보를 요청합니다
         }

         function searchDetailAddrFromCoords(coords, callback) {
            geocoder.coord2detailaddr(coords, callback); // 좌표로 법정동 상세 주소 정보를 요청합니다
         }
</script>
</body>
</html>