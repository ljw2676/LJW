<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<form action="Insert" name="g_form" method="post" enctype="multipart/form-data" id="g_form">
	카테고리 : <select name="gg_category" id="gg_category">
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
	모임 명 : <input type="text" name="gg_name" id="gg_name"><br>
	
	날짜 : <input type="hidden" data-toggle="datepicker" name="gg_date" id="gg_date"></input>
		  	<div id="datepicker-container"></div><br>
		  	
	장소 검색 : <input class = "addrSearch" id="search_keyword_addr" type="text" name="" size="53%" onkeypress="searchAddrEnterKey();" maxlength="25">
		<input type="button" value="검색" onclick="searchAddrEnterKey('13');">
  		<div class="map_title">
  		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
   		</div>
	주소 : 	<input id="L_ADDR" type="text" name="gg_addr" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
	
	장소 명 : <input type="text" id="o_title" name="gg_place"><br>
	
	모집 인원 : <input type="number" name="gg_total" id="gg_total"><br>
	
	비용 : <input type="number" name="gg_cost" id="gg_cost"><br>
	
	첨부 사진 : <input type="file" name="file"><br>
	
	상세 내용 : <input type="text" name="gg_detail"><br>
	
	<input type="button" id="insert" name="insert" value="등록" onclick="#this" />
</form>

<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
<script type="text/javascript">

$(document).ready(function() {
    $("#insert").on("click", function(e) { //등록
       e.preventDefault();
		if($('#gg_category').val()==""){
			alert("카테고리를 골라주세요");
			return false;
		}
		else if($('#gg_name').val()==""){
			alert("모임 명을 입력해주세요");
			return false;
		}
		if($('#gg_category').val()==""){
			alert("날짜를 입력해주세요");
			return false;
		}
		else if($('#detail_addr').val()==""){
			alert("주소를 입력해주세요");
			return false;
		}
		else if($('#o_title').val()==""){
			alert("장소 명을 입력해주세요");
			return false;
		}
		else if($('#gg_total').val()==""){
			alert("모집 인원을 입력해주세요");
			return false;
		}
		else if($('#gg_cost').val()==""){
			alert("비용을 입력해주세요");
			return false;
		}else{
		alert("모임 등록이 완료되었습니다 :3");
		fn_insertGroup();
	 }
});
    
    var gg_date = $('[data-toggle="datepicker"]').datepicker({
   	 language: 'ko-KR',
   	 inline: true,
   	 container: '#datepicker-container',
   	format: 'yyyy-mm-dd'
    });
});

function fn_insertGroup(){
    var comSubmit = new ComSubmit("g_form");
    comSubmit.setUrl("<c:url value='/groupInsert' />");
    comSubmit.submit();
 } 
 
 
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
                document.getElementById('L_ADDR').value=detailAddr;
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