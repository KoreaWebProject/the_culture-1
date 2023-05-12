<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="./resources/assets/css/style.css?ver=1" rel="stylesheet">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<style>
.rate_radio+label {
	position: relative;
	display: inline-block;
	margin-left: 0px;
	z-index: 10;
	width: 30px;
	height: 60px;
	background-repeat: no-repeat;
	background-size: 30px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rate_radio:checked+label {
	background-color: #fc3;
}

.rate_radio2+label {
	position: relative;
	display: inline-block;
	margin-left: 3px;
	z-index: 10;
	width: 30px;
	height: 60px;
	background-repeat: no-repeat;
	background-size: 30px 60px;
	cursor: pointer;
	background-color: #f0f0f0;
}

.rate_radio2:checked+label {
	background-color: #fc3;
}
</style>
<script src="./resources/js/httpRequest.js"></script>
</head>
<body>
	<main class="container">


		<div id="con" class="container row d-flex justify-content-center">
			<div style="border: margin-top: 20px; position: relative; padding-bottom: 50px; border-radius: 0px 0px 60px 0px">
				<h4 class="d-flex justify-content-center" style="margin-top: 20px;">후기 작성하기</h4>
				<div class="wrap">
					<form>
						<input type="hidden" name="reple_rating" id="rate" value="0" /> <input type="hidden" name="play_id" value="${play_id}"> <input
							type="hidden" name="user_id" value="${login.user_id}">

						<div class="review_rating">

							<div class="rating d-flex align-items-center justify-content-center " style="text-align: center">
								<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
								<c:forEach var="i" begin="1" end="10">
									<c:choose>
										<c:when test="${i % 2 eq 0 }">
											<input type="checkbox" style="visibility: hidden; position: absolute;" id="rating${i}" value="${i}" class="rate_radio" title="${i}점">
											<label for="rating${i}" style="background-image: url('./resources/img/starrate_r.png');"></label>
										</c:when>
										<c:otherwise>
											<input type="checkbox" style="visibility: hidden; position: absolute;" id="rating${i}" value="${i}" class="rate_radio" title="${i}점">
											<label for="rating${i}" style="background-image: url('./resources/img/starrate_l.png');"></label>
										</c:otherwise>
									</c:choose>
									  
								</c:forEach>
								<label class="rating-emoji" style="font-size: 40px;">😢</label>
							</div>
						</div>
						<div style="top: 43px; left: 10px; position: relative; margin-bottom: 80px;">
							<textarea rows="6" cols="52" placeholder="후기를 입력해 주세요" class="review_text" name="reple_contents" style="resize: none;"></textarea>
						</div>
						<div class="d-flex justify-content-center"> 
						<input type="button" class="btn btn-primary" name="save"
							id="save" value="등록" onclick="register(this.form);">
							<input type="button" style="margin-left: 20px;" class="btn btn-primary" onclick="win_close();" value="닫기">
						</div>
					</form>
				</div>


			</div>
		</div>

	</main>


	<script>
		function win_close() {
			window.close();
		};
	</script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			//별점선택 이벤트 리스너
			document.querySelector('.rating').addEventListener('click',
					function(e) {
						let elem = e.target;
						console.log(elem.value);
						const ratingEmoji = document.querySelector('.rating-emoji');
						switch (elem.value) {
					       case '1':
					         ratingEmoji.innerHTML = '😞'; // 1점
					         break;
					       case '2':
						         ratingEmoji.innerHTML = '😞'; // 1점
						         break;
					       case '3':
						         ratingEmoji.innerHTML = '😕'; // 2점
						         break;
					       case '4':
					         ratingEmoji.innerHTML = '😕'; // 2점
					         break;
					       case '5':
						         ratingEmoji.innerHTML = '😐'; // 3점
						         break;
					       case '6':
					         ratingEmoji.innerHTML = '😐'; // 3점
					         break;
					       case '7':
						         ratingEmoji.innerHTML = '😊'; // 4점
						         break;
					       case '8':
					         ratingEmoji.innerHTML = '😊'; // 4점
					         break;
					       case '9':
						         ratingEmoji.innerHTML = '😍'; // 5점
						         break;
					       case '10':
					         ratingEmoji.innerHTML = '😍'; // 5점
					         break;
					       default:
					         break;
					     }
	
						let reple_rating = document.getElementById('rate');
						reple_rating.value = elem.value / 2;
						if (elem.classList.contains('rate_radio')) {
							rating.setRate(parseInt(elem.value));
						}
					})
		});

		//별점 마킹 모듈 프로토타입으로 생성
		function Rating() {
		};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate) {
			//별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
			this.rate = newrate;
			let items = document.querySelectorAll('.rate_radio');
			items.forEach(function(item, idx) {
				if (idx < newrate) {
					item.checked = true;
				} else {
					item.checked = false;
				}
			});
		}

		/* function register(f) {
			if ("${login}" == "") {
				if (confirm("로그인후 사용가능한 서비스입니다. 로그인 하시겠습니까?")) {
					location.href = "login_main.do";
					return;
				}
				return;
			}
			f.action = "review.do"
			f.submit();
			opener.parent.location.reload();
			window.close();
		
			
			
		} */
		
		function register(f) {
			
			let play_id = f.play_id.value;
			let user_id = f.user_id.value;
			let reple_contents = f.reple_contents.value;
			let reple_rating = f.reple_rating.value;
			
			var url = "review.do";
			var param = "play_id="+play_id+"&user_id="+user_id+"&reple_contents="+encodeURIComponent(reple_contents)+"&reple_rating="+reple_rating;
			
			
			sendRequest(url, param, resFn, "POST")
			
		
			
			
		}
		let rating = new Rating();//별점 인스턴스 생성
		
		function resFn(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var data = xhr.responseText;
				if(data == 'success'){
		
	
					opener.parent.location.reload();
					
					/* radio.checked; */
					window.close();
				}
			}
			
		}

		
	</script>

</body>
</html> 