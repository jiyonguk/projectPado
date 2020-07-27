<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="/WEB-INF/views/include/sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시물 등록 폼</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b554607ceeb060d931e9eedfa0d54dc&libraries=services"></script> -->

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/default.css">
<style>

*{
   background-color: rgb(248, 247, 247);
   margin: auto;
   text-align: center;
   font-family: Nanum Gothic, sans-serif;
   color: rgb(97, 97, 97);
   z-index: 1;
}
   .board{
   margin: auto;
   border: 0.5px solid lightsteelblue;
   width: 614px;
   height: 614px;
   margin-top: 100px;
   border-radius: 10px;
   background-color: white;
   }
   
   #myh3div{
   width : 600px;
   border-radius: 20px;
   height: 80px;
   line-height: 80px;
}

.myh3{
   background-color: white;
   text-align: center;
   font-family: Nanum Gothic;
}
hr{
   border: 0.6px solid rgb(141, 141, 141) ; 
     opacity: 0.4;
}

#midpho{
   position: relative;
   float: left;
   left: 10px;
   height: 50px;

   background-color: white;
   
   
}

.mid{
   border: white;
   direction: none;
   height: 47px;
   text-align: left;
   background-color: white;
   font-size: 20px;
   
}

#photo{
   height: 100px;
   width: 500px;
   background-color: white;
   
}

 #boardtablediv{
   margin: auto;
   background-color: white;

   
}

 #boardtable{
   background-color: white;
   width: 600px;
   height:200px;
   top:30px;
   right:0px;
   position: relative;
}

table>tbody>tr>td{
   text-align: left;
   line-height: 200%;
   background-color: white;
   
}

#bmessage{
   width: 600px;
   background-color: white;
   text-align: left;
}

input{
      background-color: white;
          border-radius: 10px;
          border-color: rgb(138,174,244);
   
}

#bsubmit{
   text-align: center;
}

#inputsubmit{
   margin: 20px;
   background-color: rgb(138,174,244);
       width: 100px;
       height: 30px;
       border-radius: 10px;
       border: none;
       color:white;
       font-size: 17px;
}
</style>


</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
   <div class="board">
   
      <div id="myh3div">
         <h1 class="myh3">게시물 만들기</h1>
      </div>
      <hr>
   <form action="boardReg.do" method="post" enctype="multipart/form-data">
      
      <div id="midpho">
         <img id="photo" alt="프사" src="<%=request.getContextPath()%>/image/icon_profile.png" class="bform pho" readonly> 
         <input type="text" value="${loginInfo}" name="mid" class="bform mid" readonly>
      </div>
      
         <div id="boardtablediv">
         
         <table id="boardtable">
            <tr>
               <td><textarea rows="10" cols="50" name="bmessage" id="bmessage" placeholder="${loginInfo}님, 무슨 생각을 하고 계신가요?"></textarea></td>
            </tr>
            <tr>
               <td> <input type="text" name="baddr" id="sample5_address" placeholder="주소">
               <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br></td>
               
                   </tr>
            <tr>
               <td><input type="file" name="bphoto" id="bphoto"></td>
            </tr>
            <tr>
             <!--   <td> <input type="text" id="sample5_address" placeholder="주소">
                   <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br> -->
                   
            </tr>
            <tr >
               <td id="bsubmit"><input id="inputsubmit" type="submit" value="글쓰기">
               <input   id="inputsubmit"type="reset" value="전체삭제"></td>
            </tr>
         </table>
         </div>
      </form>
   </div>
   
<!--    <input type="text" id="sample5_address" name="baddr" placeholder="주소" value="baddr.value">
 -->    
    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b554607ceeb060d931e9eedfa0d54dc&libraries=services"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };

        //지도를 미리 생성
        var map = new daum.maps.Map(mapContainer, mapOption);
        //주소-좌표 변환 객체를 생성
        var geocoder = new daum.maps.services.Geocoder();
        //마커를 미리 생성
        var marker = new daum.maps.Marker({
            position: new daum.maps.LatLng(37.537187, 127.005476),
            map: map}),

        infowindow = new kakao.maps.InfoWindow({zindex:99}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다




        function sample5_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = data.address; // 최종 주소 변수

                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("sample5_address").value = addr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function (results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {

                            var result = results[0]; //첫번째 결과의 값을 활용

                            // 해당 주소에 대한 좌표를 받아서
                            var coords = new daum.maps.LatLng(result.y, result.x);
                            // 지도를 보여준다.
                            mapContainer.style.display = "block";
                            map.relayout();
                            // 지도 중심을 변경한다.
                            map.setCenter(coords);
                            // 마커를 결과값으로 받은 위치로 옮긴다.
                            marker.setPosition(coords)
                            
                            
                            
                            /* // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
                            searchAddrFromCoords(map.getCenter(), displayCenterInfo);

                            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
                            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
                                searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                                    if (status === kakao.maps.services.Status.OK) {
                                        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                                        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                                                                                
                                        var content = '<div class="bAddr">' +
                                                        '<span class="title">주소정보</span>' + 
                                                        detailAddr +'<input type="submit" id="submitAddress" value="선택하기">'+
                                                    '</div>'
                                                    
                                                    ;
                                        // 마커를 클릭한 위치에 표시합니다 
                                        marker.setPosition(mouseEvent.latLng);
                                        marker.setMap(map);

                                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                        infowindow.setContent(content);
                                        infowindow.open(map, marker); 
                                    }   
                                });
                            }); */
                            
                            
                            
                        }
                    });
                }
            }).open();
        }
        

        
/*         
        
        
        // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'idle', function() {
            searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        });

        function searchAddrFromCoords(coords, callback) {
            // 좌표로 행정동 주소 정보를 요청합니다
            geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
        }

        function searchDetailAddrFromCoords(coords, callback) {
            // 좌표로 법정동 상세 주소 정보를 요청합니다
            geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
        }

        // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
        function displayCenterInfo(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var infoDiv = document.getElementById('centerAddr');
                for(var i = 0; i < result.length; i++) {
                    // 행정동의 region_type 값은 'H' 이므로
                    if (result[i].region_type === 'H') {
                        infoDiv.innerHTML = result[i].address_name;
                        break;
                    }
                }
            }    
        } */

        
    </script>
   
   
   
   
   
</body>
</html>