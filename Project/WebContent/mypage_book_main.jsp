<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title id="title_seoul_escape">MyPage</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, maximum-scale=1">


<link rel="stylesheet" href="Resources/css/mypage.css" type="text/css" />
<link rel="stylesheet" href="Resources/css/mypage2.css" type="text/css" />
<link rel="stylesheet" href="Resources/css/datepicker.css"
	type="text/css" />
<script type="text/javascript" src="Resources/js/mypage.js"></script>
<script type="text/javascript" src="Resources/js/mypage2.js"></script>


</head>


<body ng-app="myapp">

	
	<div id="body_wrapper">
		<div id="body_inner">
			<nav class="navbar navbar-default" role="navigation" id="nav">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<div id="top_logo">
							<a class="navbar-brand" href="/"><img
								src="/static/image/logo_v6.jpg"></a>
						</div>
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#nav_collapse"
							id="mobile_menu_button">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="nav_collapse">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="/"> HOME </a></li>
							<li><a href="/about/"> ABOUT </a></li>
							<li><a href="/rooms/"> ROOMS </a></li>
							<li><a href="/reservation/" class="active"> BOOKING </a></li>
							<li><a href="/contact/"> CONTACT </a></li>
							<li class=""><a class="set_lang_en" href="#"> ENGLISH </a></li>

						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>

			<div id="main_content">


				<div class="container" id="reservation_container"
					ng-controller="AppController">
					<div id="reservation_bg">
						<img id=reservation_img src="Resources/mypageImage.jpg">
					</div>



					<div id="booking_toggle_wrapper" class="subtitle">
						<span class="tab_wrapper"> <a id="btn_toggle_book"
							class="toggle_button active" href="mypage_book_main.jsp"> 예약
								현황 </a>
						</span>
						<!-- <span class="tab_wrapper"> <a id="btn_toggle_priceinfo" class="toggle_button" href="mypage_message.jsp"> 받은 메시지 </a> </span> -->

						<span class="tab_wrapper"> <a id="btn_toggle_priceinfo"
							class="toggle_button" href="mypage_modifyInfo.jsp"> 회원정보 수정
						</a>
						</span> <span class="tab_wrapper"> <a id="btn_toggle_cancel"
							class="toggle_button" href="mypage_memberout.jsp"> 회원 탈퇴 </a>
						</span>
					</div>



					<table class="table">
						<thead>
							<tr>
								<th>예약아이디</th>
								<th>날짜</th>
								<th>시간</th>
								<th>장소</th>
								<th>인원</th>
								<th>D-day</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<!--       <tbody> tbody밑으로 행을 추가한다.
        <tr ng-show="!loaded">
          <td colspan="6"> Loading.. </td>
        </tr>
        <tr ng-repeat="book in sortedBookList" ng-show="loaded">
          <td> {$ book.branch $} </td>
          <td> {$ book.hour $} </td>
          <td> {$ book.duration $} 분 </td>
          <td> {$ book.room $} </td>
          <td class="difficulty">
          <span class="foreground"><i class="fa fa-star" ng-repeat="n in range(0, book.difficulty)"></i><i class="fa fa-star-half-o" ng-if="book.hasHalf==true"></i><i class="fa fa-star-o" ng-repeat="n in range(0, book.restDiff)"></i></span>
          <td ng-if="currentBranch.can_join==true"> {$ book.available_people $} </td>
          <span class="background"><i class="fa fa-star-o" ng-repeat="n in range(0, 5)"></i></span> </td>
          <td ng-if="book.booked==true" class="red"> {$ resv_completed $} </td>
          <td ng-if="book.booked==false"><a class="yellow" href="#book_a_session_wrapper" ng-click="openReservation($event, book)"> {$ resv_available $} </a></td>
        </tr>
      </tbody> -->

						<tbody>
							<td></td>


						</tbody>
					</table>

				</div>

			</div>


		</div>

	</div>

</body>
</html>