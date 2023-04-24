<%--
  Created by IntelliJ IDEA.
  User: gion6
  Date: 2023-04-23
  Time: PM 7:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String root = request.getContextPath();
  System.out.println(root);
%>
<html>
<head>
    <title>공연에대한 상세 정보</title>
</head>
<body>
<div id="su_con">
  <div class="tibt_bb">
    <div class="tib">
      <h4 class="tit">하나 둘 셋, 김치! [전주]</h4>
      <span class="cls_bxAAAA">연극</span>
    </div>

    <div class="btb">

      <a href="javascript:pop04('1');" class="bt_st3">예매처 바로가기 &gt;</a>
    </div>
  </div>
  <div class="bxo_vbk">
    <div class="tu">
      <p><img src= '${info.playPoster}' onerror="this.src='/images/por/main_no_img.jpg';" alt="하나 둘 셋, 김치! [전주]"></p>
    </div>
    <div class="zi">
      <ul class="ro_utb nvw">
        <li>
          <div>
            <dl>
              <dt>공연기간</dt>
              <dd>2023.03.24(금) ~


                2023.06.03(토)
              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>공연장소</dt>
              <dd>

                <a href="/por/db/prfplc/prfplcView.do?menuId=MNU_00021&amp;mt10Id=FC001418">한옥마을아트홀 </a>


              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>공연시간</dt>
              <dd>


                금요일(19:30)<br>화요일 ~ 금요일(19:30)<br>토요일(15:00,19:00)<br>공휴일(15:00,19:00)



                <ul>

                </ul>
              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>관람연령</dt>
              <dd>

                만 6세 이상


              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>티켓가격</dt>
              <dd>



                <ul>
                  <li>전석 20,000원</li>
                </ul>



              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>출연진</dt>
              <dd>





                정찬호, 홍정은, 장윤경, 진시라





              </dd>
            </dl>
          </div>
        </li>
        <!-- 장르가 연극일때만 원작자/창작자 보임 start-->






        <!-- 장르가 연극일때만 원작자/창작자 보임 end-->
        <!-- 화면 공연수상내역 start-->



        <!-- 화면 공연수상내역 end-->
        <li>
          <div>
            <dl>
              <dt>제작진</dt>
              <dd>



                해당정보 없음


              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>주최·주관</dt>
              <dd>




                <a href="/por/db/mnfct/mnfctView.do?menuId=MNU_00022&amp;mt30Id=AG004303">재인촌 우듬지(주최)</a>
                ,

                <a href="/por/db/mnfct/mnfctView.do?menuId=MNU_00022&amp;mt30Id=AG004159">한옥마을아트홀(주관)</a>



                <!-- <a href="/por/db/mnfct/mnfctView.do?menuId=MNU_00022&mt30Id="></a>
                 -->



              </dd>
            </dl>
          </div>
        </li>
        <li>
          <div>
            <dl>
              <dt>기획·제작</dt>
              <dd>



                해당정보 없음


              </dd>
            </dl>
          </div>
        </li>

      </ul>
      <p class="btn_wrap btn_align_center">
        <a href="<%=root%>/list.do" class="bt_st3 bt_list">목록 보기</a>
      </p>
    </div>
  </div>

  <div class="bls_tbbk">
    <ul class="bls_tbls c3">
      <li class="on"><p><a href="#n" id="poster">소개</a></p></li>
      <li><p><a href="<%=root%>/loc.do?locId=${info.locId}" id="perf">공연장</a></p></li>
    </ul>
  </div>
  <div class="bxo_vcb">
    <div class="detailArea">


      <img src="${info.playStyurls}" alt="" style="max-width: 100%; height: auto;">

    <!-- 상세 이미지 어찌하냐.. -->
      <img src="/upload/pfmIntroImage/PF_PF217073_230419_1231503.jpg" alt="" style="max-width: 100%; height: auto;">


      <img src="/upload/pfmIntroImage/PF_PF217073_230419_1231502.jpg" alt="" style="max-width: 100%; height: auto;">


      <img src="/upload/pfmIntroImage/PF_PF217073_230419_1231501.jpg" alt="" style="max-width: 100%; height: auto;">


    </div>
  </div>
<!--공연장정보드갈곳===============================================-->
<!--공연장정보드갈곳===============================================-->
<!--공연장정보드갈곳===============================================-->
<!--공연장정보드갈곳===============================================-->






<!--공연장정보드갈곳===============================================-->
<!--공연장정보드갈곳===============================================-->
<!--공연장정보드갈곳===============================================-->
<!--공연장정보드갈곳===============================================-->

  <!--통계정보 -->
  <div class="bxo_vcb" style="display: none">
    <div class="tib">
      <h4 class="nb_tit1">통계 정보</h4>
      <p class="tip_btn_area"><a href="javascript:fnStatByFct('FC001418');" class="bt_st3">시설통계 상세<!-- 통계현황 이동 --> <span>&gt;</span></a></p>
    </div>
    <ul class="ro_utb nvw">
      <li>
        <div>
          <dl>
            <dt>개막편수</dt>
            <dd>
              <span id="stats_data4">1</span>편
            </dd>
          </dl>
        </div>
      </li>
      <li>
        <div>
          <dl>
            <dt>상연횟수</dt>
            <dd>
              <span id="stats_data5">0</span>회
            </dd>
          </dl>
        </div>
      </li>
    </ul>
  </div>

  <div class="right_area" style="display: none;">
    <button class="btn_more" title="집계정보"><span>집계정보</span></button>
  </div>
  <div class="comment_wrap3" style="display: none;">
    <ul>
      <li id="commentDt">· <span>최종집계일자 </span>: 2023.04.23</li>
    </ul>
    <ul>
      <li><span>·</span> 연관통계정보는 해당 공연시설에서 해당공연의 예매/취소 데이터를 최근 1년전부터 전일 기준까지 집계하여 제공합니다.</li>
      <li><span>·</span> 전산발권 되지 않은 티켓(수기티켓 등)은 집계에서 제외되므로 실제 상연횟수와는 차이가 있을 수 있습니다.</li>
    </ul>
  </div>
  <!--통계정보 -->

</div>


  <div>
    <ul>

      <li>공연 시설ID:${info.locId}</li>
      <li>공연ID:${info.playId}</li>
      <li>출연진 정보:${info.playPrfcast}</li>
      <li>제작진 정보:${info.playPrfcrew}</li>
      <li>공연런타임:${info.playPrfruntime}</li>
      <li>관람연령:${info.playPrfage}</li>
      <li>제작사였구나:${info.playEntrpsnm}</li>
      <li>티켓가격${info.playTicketprice}</li>
      <li>포스터 이미지 ${info.playPoster}</li>
      <li>상세정보 이미지${info.playStyurls}</li>
      <li>공연시작 일시${info.playDtguidance}</li>

    </ul>
 </div>

</body>
<script>

</script>
</html>
