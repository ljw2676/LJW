<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function insert() {
		var g = document.groupinput
		if(g.gg_category.value == ""){
			alert("카테고리를 해주세요");
			g.gg_category.focus();
			return false;
		}
		if(g.gg_name.value == ""){
			alert("모임 명을 입력해주세요");
			g.gg_name.focus();
			return false;
		}
		if(g.gg_date.value == ""){
			alert("날짜를 입력해주세요");
			g.gg_date.focus();
			return false;
		}
		if(g.gg_addr.value == ""){
			alert("주소를 입력해주세요");
			g.gg_addr.focus();
			return false;
		}
		if(g.gg_place.value == ""){
			alert("장소 명을 입력해주세요");
			g.gg_place.focus();
			return false;
		}
		if(g.gg_total.value == ""){
			alert("모집 인원을 입력해주세요");
			g.gg_total.focus();
			return false;
		}
		if(g.gg_cost.value == ""){
			alert("비용을 입력해주세요");
			g.gg_cost.focus();
			return false;
		}
		alert("모임 등록이 완료되었습니다 :3");
		g.submit();
		
		
	}
	
</script>
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

<form:form commandName="group" name="groupinput" method="post" enctype="multipart/form-data">
	카테고리 : <select name="gg_category">
					<option value="실외활동">실외활동</option>
					<option value="패션">패션</option>
					<option value="맛집">맛집</option>
					<option value="게임">게임</option>
					<option value="게임">동물</option>
					<option value="보드게임">보드게임</option>
					<option value="전시/공연">전시/공연</option>
					<option value="취업/스터디">취업/스터디</option>
					<option value="춤">춤</option>
					<option value="독서/토론">독서/토론</option>
					<option value="음악">음악</option>
					<option value="언어교환">언어교환</option>
					<option value="여행">여행</option>
					<option value="웰빙">웰빙</option>
					<option value="공예">공예</option>
			   </select>
			   <br>
	모임 명 : <input type="text" name="gg_name"><br>
	날짜 : 	<input type="text" name="gg_date"><br>
	주소 : <input class = "addrSearch" id="search_keyword_addr" type="text" name="" size="53%" onkeypress="searchAddrEnterKey();" maxlength="25">
			<input type="button" value="검색" onclick="searchAddrEnterKey('13');">
  			<div class="map_title">
  			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
   			</div>
			<input class = "addrForm" id="detail_addr" type="text" name="gg_addr" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
	장소 명 : <input type="text" id="o_title" name="gg_place"><br>
	모집 인원 : <input type="number" name="gg_total"><br>
	비용 : <input type="number" name="gg_cost"><br>
	첨부 사진 : <input type="file" name="file"><br>
	상세 내용 : <input type="text" name="gg_detail"><br>
	
	<input type="button" value="등록" onclick="insert()"/>
</form:form>

<%@ include file="/WEB-INF/include/common-body.jspf"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
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