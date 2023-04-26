<%--
  Created by IntelliJ IDEA.
  User: gion6
  Date: 2023-04-24
  Time: AM 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>공연장정보</title>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37eb6d4d340481c71f7f17add0ea7792&libraries=services,clusterer"></script>
</head>
<body>

<!--공연장 정보-->
<div class="bxo_vcb" style>
  <div class="tib">
    <h4 class="nb_tit1">


      ${loc.loc_name}



    </h4>
    <p class="tip_btn_area"><a href="javascript:fnPrfplcView('FC001418');" class="bt_st3">시설정보 상세 <span>&gt;</span></a></p>
  </div>
  <ul class="ro_utb nvw">

    <li>
      <div>
        <dl>
          <dt>좌석수</dt>
          <dd>${loc.loc_seatscale}</dd>
        </dl>
      </div>
    </li>
    <li>
      <div>
        <dl>
          <dt>주소</dt>
          <dd>${loc.loc_addr}</dd>
        </dl>
      </div>
    </li>
    <li>
      <div>
        <dl>
          <dt>홈페이지</dt>
          <dd style="word-break:break-all;" wrap="hard">
            <!-- Java 모바일 체크 -->

            <a href="${loc.loc_url}" target="_blank" title="새 창 열림">${loc.loc_url}</a>

          </dd>
        </dl>
      </div>
    </li>
    <li>
      <div>
        <dl class="bkv">
          <dt>공연장 위치</dt>
        </dl>
      </div>
    </li>

  </ul>
</div>

<!--지도 표시 영역-->
<div id="map" style="width:70%;height:350px;">
  <!--표시즁~~◠ ͜ ◠-->
  <!--표시즁~~◠ ͜ ◠-->
  <!--표시즁~~◠ ͜ ◠-->
  <!--표시즁~~◠ ͜ ◠-->
</div>



<!--공연장 정보 -->
<ul>

  <li>공연장ID: ${loc.loc_id} </li>
  <li>이름:${loc.loc_name}</li>
  <li>번호:${loc.loc_tel}</li>
  <li>홈피:${loc.loc_url}</li>
  <li>주소:${loc.loc_addr}</li>
  <li>위:${loc.loc_la}</li>
  <li>경도:${loc.loc_lo}</li>
  <li>객석수:${loc.loc_seatscale}</li>
</ul>
</body>

<script>
    //=====기본 지도 설정 및 생성=====>>>>>//

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div(id로 따짐)
    mapOption = {
    center: new kakao.maps.LatLng(${loc.loc_la}, ${loc.loc_lo}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
    };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);

    //<<<<<=====기본 지도 설정 및 생성=====//


    //=====지도 내부 스카이뷰, 줌 기능 컨트롤 버튼 생성=====>>>>>//

    // 일반지도, 스카이뷰 전환 가능한 컨트롤 만들기
    var mapTypeControl = new kakao.maps.MapTypeControl();

    //map 지도에 addControl 한다 mapTypeControl의 컨트롤 버튼을 kakao.maps.ControlPosition.TOPRIGHT 의 위치로
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치 정의, TOPRIGHT는 오른쪽 위 생성
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    //  확대 축소를 제어할 수 있는  줌 컨트롤을 생성
    //addControl로 zoomControl을 kakao.maps.ControlPosition.RIGHT의 위치에 생성
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    //<<<<<=====지도 내부 스카이뷰, 줌 기능 컨트롤 버튼 생성=====//


    //=====지도 내부에 해당 주소 마커 생성=====>>>>>//

    // 마커가 표시될 위치입니다
    var markerPosition = new kakao.maps.LatLng(${loc.loc_la}, ${loc.loc_lo});

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
      position: markerPosition
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);

    //<<<<<=====지도 내부에 해당 주소 마커 생성=====//

</script>
</html>
