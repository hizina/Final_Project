<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<style>
			/* 	html, body { */
			/*     box-sizing: border-box; */
			/*     padding: 0; */
			/*     margin: 0; */
			/*   } */

			/*   *, *:before, *:after { */
			/*     box-sizing: inherit; */
			/*   } */
			/*   .clearfix:after { */
			/*     content: ''; */
			/*     display: block; */
			/*     clear: both; */
			/*     float: none; */
			/*   } */

			/* ======== Calendar ======== */
			.my-calendar {
				width: 100%;
				/*     margin: 30px; */
				padding: 20px 20px 10px;
				text-align: center;
				/* font-weight: 800; */
				border: 1px solid #ddd;
				cursor: default;
			}

			.my-calendar .clicked-date {
				border-radius: 25px;
				/*     margin-top: 36px; */
				float: left;
				width: 42%;
				padding: 46px 0 26px;
				background: #fafafa;
			}

			.my-calendar .calendar-box {
				float: right;
				width: 58%;
				padding-left: 30px;
			}

			.clicked-date .cal-day {
				font-size: 24px;
			}

			.clicked-date .cal-date {
				font-size: 120px;
			}

			.ctr-box {
				padding: 0 12px;
				margin-bottom: 20px;
				font-size: 18px;
			}

			.ctr-box .btn-cal {
				position: relative;
				float: left;
				width: 25px;
				height: 25px;
				margin-top: 5px;
				font-size: 16px;
				cursor: pointer;
				border: none;
				background: none;
			}

			.ctr-box .btn-cal:after {
				content: '<';
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				line-height: 25px;
				font-weight: bold;
				font-size: 20px;
			}

			.ctr-box .btn-cal.next {
				float: right;
			}

			.ctr-box .btn-cal.next:after {
				content: '>';
			}

			.cal-table {
				width: 100%;
			}

			.cal-table th {
				width: 14.2857%;
				padding-bottom: 5px;
				font-size: 16px;
				font-weight: 900;
			}

			.cal-table td {
				padding: 3px 0;
				/*     height: 50px; */
				height: 40px;
				font-size: 15px;
				vertical-align: middle;
			}

			.cal-table td.day {
				position: relative;
				cursor: pointer;
			}

			.cal-table td.today {
				background: #ffd255;
				border-radius: 0%;
				color: #fff;
			}

			.cal-table td.day-active {
				background: #ff8585;
				border-radius: 0%;
				color: #fff;
			}

			.cal-table td.has-event:after {
				content: '';
				display: block;
				position: absolute;
				left: 0;
				bottom: 0;
				width: 100%;
				height: 4px;
				background: #FFC107;
			}

			/* 지도 */
			#jinaMap,
			#jinaOrg {
				width: 700px;
				height: 480px;
			}

			#jinaMap {
				position: relative;
				left: 30px; 
				top: -60px;
			}

			#jinaOrg {
				position: absolute;
			}

			.point {
				font-size: 12px;
				font-weight: 2px;
				color: aliceblue;
				position: absolute;
				border-radius: 50%;
				width: 50px;
				height: 50px;
				text-align: center;
				/* background-color: #776962; */
				background-color: ;
/* 				opacity: 0.2px; */
			}

			.point:hover {
/* 				background-color: blue; */
			}
			
/*  			.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {  */
/* 				  background-color: #0d99ff5e;  */
/*  				}  */
		</style>
		
<!-- 페이지 타이틀 -->
<div class="page-titles">
   <ol class="breadcrumb">
      <li><h5 class="bc-title">시설</h5></li>
      <li class="breadcrumb-item"><a href="#">
         <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path d="M7.11086 10.2878V13.7208" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M8.86244 12.0045H5.35974" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M13.0856 10.3924H12.9875" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M14.748 13.6691H14.6499" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path d="M6.39948 0.833328C6.39948 1.5121 6.96092 2.06236 7.65349 2.06236H8.62193C9.69042 2.06617 10.5559 2.9144 10.5608 3.9616V4.5804" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
			<path fill-rule="evenodd" clip-rule="evenodd" d="M14.0593 19.1324C11.3045 19.1791 8.60026 19.1771 5.94166 19.1324C2.99069 19.1324 0.833313 17.0275 0.833313 14.1354V9.87325C0.833313 6.98107 2.99069 4.8762 5.94166 4.8762C8.61483 4.83051 11.321 4.83146 14.0593 4.8762C17.0102 4.8762 19.1666 6.98203 19.1666 9.87325V14.1354C19.1666 17.0275 17.0102 19.1324 14.0593 19.1324Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
         시설 예약</a>
      </li>
      <li class="breadcrumb-item active"><a href="#">학교 시설</a></li>
   </ol>
</div>
<div class="container-fluid">

	<!-- 표현하고자 하는 내용 넣기 -->
			<div class="row">
			<div class="col-md-8">
				<div class="card mb-0">
					<div id="jinaMap">
						<img src="/resources/images/map.png" id="jinaOrg">
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					<div class="card-header" style="padding-bottom:10px;">
						<h4><span style="font-size:20px; color: #f96d00">|</span><strong>&nbsp;시설물 현황</strong></h4>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<table class="table">
									<thead>
										<tr>
											<th><i class="fa-solid fa-check"></i>&nbsp;&nbsp;시설명</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="ftbody">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<h4><strong id="selectResult" style="color: #f95959;"></strong></h4>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<div class="card-title"><span style="font-size:20px; color: #f96d00;">|</span><strong style="font-size:17px;">&nbsp;시설 예약 현황</strong> 
						 <span class="text-danger">&nbsp;&nbsp;&nbsp;*</span><span class="m-0" style="color: #ff894c; font-size:12px;">예약은 최대 2시간까지 가능합니다.</span></div>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-5">
									
								<div class="mb-3 col-md-12">
									<!-- 달력 -->
									<div class="my-calendar clearfix">
										<div class="clicked-date">
											<div class="cal-day"></div>
											<div class="cal-date"></div>
										</div>
										<div class="calendar-box">
											<div class="ctr-box clearfix">
												<button type="button" title="prev" class="btn-cal prev">
												</button>
												<span class="cal-month"></span> <span class="cal-year"></span>
												<button type="button" title="next" class="btn-cal next">
												</button>
											</div>
											<table class="cal-table">
												<thead>
													<tr>
														<th style="color:#f95959;">일</th>
														<th>월</th>
														<th>화</th>
														<th>수</th>
														<th>목</th>
														<th>금</th>
														<th style="color:#005792;">토</th>
													</tr>
												</thead>
												<tbody class="cal-body"></tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4" style="height:370px; overflow:scroll;">
								<table class="table table-bordered table-hover" id="timeTable">
									<thead class="text-center" style="width: 20px;">
										<tr>
											<th width="20%">#</th>
											<th width="40%">시   간</th>
											<th width="40%">상   태</th>
										</tr>
									</thead>
									<tbody class="text-center" id="timeTbody">
										<tr>
											<td>1</td>
											<td data-start="09:00" data-end="10:00">09:00 ~ 10:00</td>
											<td></td>
										</tr>
										<tr>
											<td>2</td>
											<td data-start="10:00" data-end="11:00">10:00 ~ 11:00</td>
											<td></td>
										</tr>
										<tr>
											<td>3</td>
											<td data-start="11:00" data-end="12:00">11:00 ~ 12:00</td>
											<td></td>
										</tr>
										<tr>
											<td>4</td>
											<td data-start="12:00" data-end="13:00">12:00 ~ 13:00</td>
											<td></td>
										</tr>
										<tr>
											<td>5</td>
											<td data-start="13:00" data-end="14:00">13:00 ~ 14:00</td>
											<td></td>
										</tr>
										<tr>
											<td>6</td>
											<td data-start="14:00" data-end="15:00">14:00 ~ 15:00</td>
											<td></td>
										</tr>
										<tr>
											<td>7</td>
											<td data-start="15:00" data-end="16:00">15:00 ~ 16:00</td>
											<td></td>
										</tr>
										<tr>
											<td>8</td>
											<td data-start="16:00" data-end="17:00">16:00 ~ 17:00</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-3">
								<form action="/facility/reservation" method="post" id="facilityForm">
									<input type="hidden" name="facCode" id="facCode" value="" />
									<input type="hidden" name="databox" id="databox" value="" />
									<input type="hidden" name="frStime" id="frStime" value="" /> 
									<input type="hidden" name="frEtime" id="frEtime" value="" />
									<div class="row">
										<div class="mb-3 col-md-12">
											<label class="form-label"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;사용인원 <span class="text-danger"> *</span></label> 
											<input type="text" class="form-control" value="" id="frUsercnt" name="frUsercnt" placeholder="숫자만 입력해주세요.">
										</div>
									</div>
									<div class="row">
										<div class="mb-3">
											<label class="form-label"><i class="fa-solid fa-check"></i>&nbsp;&nbsp;사용목적 <span class="text-danger"> *</span></label>
											<textarea class="form-txtarea form-control" rows="8" name="frPurpose" id="comment" placeholder="사용목적을 입력해 주세요."></textarea>
										</div>
									</div>
									<div class="row">
										<div class="mb-3 p-0">
											<h4><strong id="timeResult" style="color: #7c73e6;"></strong></h4>
										</div>
									</div>
									<div class="row" style="padding-left:12px; padding-right:12px;">
										<button type="button" class="btn btn-primary" id="reservBtn">예약하기</button> 
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
		
		
		




		<script>

			//================================
			//START YOUR APP HERE
			//================================
			const init = {
				monList: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				dayList: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
				today: new Date(),
				monForChange: new Date().getMonth(),
				activeDate: new Date(),
				getFirstDay: (yy, mm) => new Date(yy, mm, 1),
				getLastDay: (yy, mm) => new Date(yy, mm + 1, 0),

				nextMonth: function () {
					let d = new Date();
					d.setDate(1);
					d.setMonth(++this.monForChange);
					this.activeDate = d;
					return d;
				},
				prevMonth: function () {
					let d = new Date();
					d.setDate(1);
					d.setMonth(--this.monForChange);
					this.activeDate = d;
					return d;
				},
				addZero: (num) => (num < 10) ? '0' + num : num,
				activeDTag: null,
				getIndex: function (node) {
					let index = 0;
					while (node = node.previousElementSibling) {
						index++;
					}
					return index;
				}
			};



			const $calBody = document.querySelector('.cal-body');
			const $btnNext = document.querySelector('.btn-cal.next');
			const $btnPrev = document.querySelector('.btn-cal.prev');

			/**
			* @param {number} date
			* @param {number} dayIn
			*/
			function loadDate(date, dayIn) {
				document.querySelector('.cal-date').textContent = date;
				document.querySelector('.cal-day').textContent = init.dayList[dayIn];
			}

			/**
			* @param {date} fullDate
			*/
			function loadYYMM(fullDate) {
				let yy = fullDate.getFullYear();
				let mm = fullDate.getMonth();
				let firstDay = init.getFirstDay(yy, mm);
				let lastDay = init.getLastDay(yy, mm);
				let markToday;  // for marking today date

				if (mm === init.today.getMonth() && yy === init.today.getFullYear()) {
					markToday = init.today.getDate();
				}

				document.querySelector('.cal-month').textContent = init.monList[mm];
				document.querySelector('.cal-year').textContent = yy;

				let trtd = '';
				let startCount;
				let countDay = 0;
				for (let i = 0; i < 6; i++) {
					trtd += '<tr>';
					for (let j = 0; j < 7; j++) {
						if (i === 0 && !startCount && j === firstDay.getDay()) {
							startCount = 1;
						}
						if (!startCount) {
							trtd += '<td>'
						} else {
							let fullDate = yy + '-' + init.addZero(mm + 1) + '-' + init.addZero(countDay + 1);
							trtd += '<td class="day';
							trtd += (markToday && markToday === countDay + 1) ? ' today" ' : '"';
							trtd += `onclick='f_clickedDay(this)' data-date="\${countDay + 1}" data-fdate="\${fullDate}">`;
						}
						trtd += (startCount) ? ++countDay : '';
						if (countDay === lastDay.getDate()) {
							startCount = 0;
						}
						trtd += '</td>';
					}
					trtd += '</tr>';
				}
				$calBody.innerHTML = trtd;
			}

			/**
			* @param {string} val
			*/
			function createNewList(val) {
				let id = new Date().getTime() + '';
				let yy = init.activeDate.getFullYear();
				let mm = init.activeDate.getMonth() + 1;
				let dd = init.activeDate.getDate();
				const $target = $calBody.querySelector(`.day[data-date="${dd}"]`);

				let date = yy + '-' + init.addZero(mm) + '-' + init.addZero(dd);

				let eventData = {};
				eventData['date'] = date;
				eventData['memo'] = val;
				eventData['complete'] = false;
				eventData['id'] = id;
				init.event.push(eventData);
				$todoList.appendChild(createLi(id, val, date));
			}

			loadYYMM(init.today);
			loadDate(init.today.getDate(), init.today.getDay());

			$btnNext.addEventListener('click', () => loadYYMM(init.nextMonth()));
			$btnPrev.addEventListener('click', () => loadYYMM(init.prevMonth()));

			$calBody.addEventListener('click', (e) => {
				if (e.target.classList.contains('day')) {
					if (init.activeDTag) {
						init.activeDTag.classList.remove('day-active');
					}
					let day = Number(e.target.textContent);
					loadDate(day, e.target.cellIndex);
					e.target.classList.add('day-active');
					init.activeDTag = e.target;
					init.activeDate.setDate(day);
					//   reloadTodo();
				}
			});
			

			function f_clickedDay(p_this) {
				
				let selectedDate = p_this.getAttribute("data-fdate");
				console.log("selectedDate ::", selectedDate);
				
				document.querySelector("#databox").value = selectedDate;	// databox의 value에 selectedDate 값 셋팅
				
				
				let code = 	$("#facCode").val();		
				console.log("code ::: ", code);
				
				let data = {
					facCode : code
				}
				
				let xhr = new XMLHttpRequest();
                xhr.open("post", "/facility/getFacilityReservation", true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                xhr.onreadystatechange = () => {
                	
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        console.log("온값: ", xhr.responseText);
                        
                        let listArr = JSON.parse(xhr.responseText);
						console.log("listArr :: ", listArr);
						
						let timeTbody = document.querySelector("#timeTbody");
						let trs = timeTbody.children;
						
						for(let i=0; i< trs.length; i++){
							trs[i].children[2].innerHTML = "<div class='d-flex align-items-center justify-content-center'><i class='fa fa-circle text-success me-1'></i> 사용가능</div>";
						}
						
						for(let i=0; i< listArr.length; i++){
							let sday = listArr[i].frStime.split(" ")[0].split()[0];
							let stime = listArr[i].frStime.substr(-5);
							let etime = listArr[i].frEtime.substr(-5);
							let facilityCode = listArr[i].facCode;
							
							if(sday == selectedDate){
								console.log("stime ->", stime);	
								console.log("sday ->", sday);
								console.log("facilityCode ->", facilityCode);
								
								for(let i=0; i< trs.length; i++){
									let tdStime = trs[i].children[1].dataset.start;
									let tdEtime = trs[i].children[1].dataset.end;
									console.log("tdStime :", tdStime);
									
									trs[i].children[2].innerHTML = "<div class='d-flex align-items-center justify-content-center'><i class='fa fa-circle text-success me-1'></i> 사용가능</div>";
	
									// endtime 비교
									if(stime == tdStime && sday == selectedDate){
										trs[i].children[2].innerHTML = "<div class='d-flex align-items-center justify-content-center'><i class='fa fa-circle text-danger me-1'></i> 사용불가</div>";
									}
									
									if(etime == tdEtime && sday == selectedDate){
										trs[i].children[2].innerHTML = "<div class='d-flex align-items-center justify-content-center'><i class='fa fa-circle text-danger me-1'></i> 사용불가</div>";
										
									}
									
									
									
	// 								if(stime == tdStime && sday != selectedDate){
	// 									trs[i].children[2].style.backgroundColor="white";
	// 									break;
	// 								}
								}
							}
						}
                    }
                }
                xhr.send(JSON.stringify(data)); // post,put,delete등은 요기에 값을 넣는당(문자열롱)
			}
				
			///////// 지도 /////////				
			const jinaMap = document.querySelector("#jinaMap");
			const selectResult = document.querySelector("#selectResult");

			const jinaCord = [
				{ left: "215", top: "247" },     // 9    도서관(1)
				{ left: "488", top: "199" },     // 26    농구장(2)
				{ left: "383", top: "160" },     // 27    실내체육관(3) - 배드민턴장 / 스쿼시장 1, 2, 3 / 탁구장
				{ left: "179", top: "173" },     // 29    운동장(4)
			];


			var facility = ["F-M", "F-BC", "F-G", "F-PG"];	// 도서관, 농구장, 실내체육관, 운동장
			for (let i = 1; i <= 4; i++) {
// 				let jinaPoint = document.createElement("div");
// 				jinaPoint.id = "p" + i;
// 				jinaPoint.className = "point";
// 				jinaPoint.style.left = jinaCord[i - 1].left + "px";
// 				jinaPoint.style.top = jinaCord[i - 1].top + "px";
// 				jinaPoint.innerHTML = i;
// 				jinaPoint.setAttribute("data-no", facility[i - 1]);

				let jinaPoint = document.createElement("img");
				jinaPoint.id = "p" + i;
				jinaPoint.className = "point";
				jinaPoint.style.left = jinaCord[i - 1].left + "px";
				jinaPoint.style.top = jinaCord[i - 1].top + "px";
				jinaPoint.style.opacity = "0.7px";
// 				jinaPoint.innerHTML = i;
				jinaPoint.setAttribute("data-no", facility[i - 1]);
				jinaPoint.setAttribute("src", "/resources/images/marker_red2.png");
				jinaPoint.setAttribute("alt", "marker" + facility[i - 1]);
				

				jinaPoint.addEventListener("mouseover", (event) => {
					event.target.style.width = "55px";
					event.target.style.height = "55px";
					event.target.style.opacity = "1";
				});
				jinaPoint.addEventListener("mouseout", (event) => {
					event.target.style.width = "50px";
					event.target.style.height = "50px";
				});
				
				// 클릭 이벤트
				jinaPoint.onclick = () => {
					selectResult.innerHTML = "";
					let jina = event.currentTarget;

					console.log(jina.innerHTML);
					console.log(jina.getAttribute("data-no"));

					let data = {
						facCode: jina.getAttribute("data-no")
					}
					// 비동기 시작
					let xhr = new XMLHttpRequest();
					xhr.open("post", "/facility/getFacility", true);
					xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
					xhr.onreadystatechange = () => {
						if (xhr.readyState == 4 && xhr.status == 200) {
							let listArr = JSON.parse(xhr.responseText);
							console.log("listArr :: ", listArr);

							let html = "";
							for (let i = 0; i < listArr.length; i++) {
								html += "<tr>";
								html += "	<td width='60%'><i class='bi bi-dot' style='font-size:16px;'></i>&nbsp;&nbsp;" + listArr[i].facName + "</td>";
								html += "	<td><button class='btn light btn-warning btn-xxs' data-no='" + listArr[i].facCode + "' id='selectBtn'>선택</button></td>";
								html += "</tr>";
							}

							ftbody = document.querySelector("#ftbody");
							ftbody.innerHTML = html;		// 화면에 뿌리기

						}
					}
					xhr.send(JSON.stringify(data));

				}
				jinaMap.appendChild(jinaPoint);
			}

			$(function () {
				$("#ftbody").on("click", "#selectBtn", function () {	
					console.log($(this).parents("tr").html());
					console.log(":::", $(this).data("no"));
					
					$("#facCode").val($(this).data("no"));	// 시설코드를 셋팅
					$("#selectResult").text($(this).parents("tr").find("td:eq(0)").text()+ "를(을) 선택했습니다.");
				
					// 다른 시설을 눌렀을때 초기화
					for(var i = 0; i < 8; i++){	// jina update
						$("#timeTbody").find("tr:eq("+i+")").find("td:eq(2)").html("");
					}
					$(".day-active").removeClass("day-active");
				});


				var countClick = 0;
				var firstIndex = -1;
				var startTime = "";		// hidden에 넣을 시작시간
				var endTime = "";		// hidden에 넣을 종료시간
				let firstSelect = null;
				let secondSelect = null;
				// 테이블 안 시간 선택시
				$("#timeTbody").on("click", "tr", function () {
					countClick++;	
					firstIndex = $(this).index();
					
					if(countClick > 1) { // 1번 클릭시
						countClick = 0;
						firstIndex = -1;
						endTime = $(this).find("td:eq(1)").data("end");
						secondSelect = $(this);
						secondSelect.css("background-color", "lightblue");
						console.log("나 두번쨰");
					} else {
						startTime = $(this).find("td:eq(1)").data("start");
						endTime = $(this).find("td:eq(1)").data("end");
						firstSelect = $(this);
						firstSelect.css("background-color", "lightblue");
						console.log("나 첫번쨰");
					}
					
					var startTimeSplit = startTime.trim().split(":");
					var endTimeSplit = endTime.trim().split(":");
					var result = parseInt(endTimeSplit[0]) - parseInt(startTimeSplit[0]);
					// 당신이 2시간 이상의 시간테이블을 선택할때 block
					if(result > 2){
// 						alert("예약 시간은 2시간을 초과할 수 없습니다.");
						Swal.fire({
							title: "예약 실패",
							text: "예약 시간은 2시간을 초과할 수 없습니다!",
							icon: "error",
							closeOnClickOutside: false
						});
						firstSelect.css("background-color", "");
						secondSelect.css("background-color", "");
						firstSelect = null;
						secondSelect = null;
						return;
					}
					
					$("#frStime").val($("#databox").val() + " " + startTime);
					$("#frEtime").val($("#databox").val() + " " + endTime);
					$("#timeResult").text(startTime + " ~ " + endTime + "에 사용하시겠습니까?");
				});
				

				$("#reservBtn").on("click", function () {
					var facilitycode = $("#facCode").val();
					var people = $("#frUsercnt").val();
					var comment = $("#comment").val();
					var databox = $("#databox").val();
					var stime = $("#frStime").val();
					var etime = $("#frEtime").val();
					
					if(facilitycode == null || facilitycode == ""){
						Swal.fire({
							title: "예약 실패",
							text: "사용하실 시설을 선택해주세요!",
							icon: "error",
							closeOnClickOutside: false
						});
						return false;
					}
					if(stime == null || stime == "" && etime == null || etime == ""){
						Swal.fire({
							title: "예약 실패",
							text: "사용하실 시간을 선택해주세요!",
							icon: "error",
							closeOnClickOutside: false
						});
						return false;
					}
					
					if (people == null || people == "") {
						Swal.fire({
							title: "Error!",
							text: "사용인원을 꼭 작성해주세요!",
							icon: "error",
							closeOnClickOutside: false
						});
						return false;
					}

					if (comment == null || comment == "") {
						Swal.fire({
							title: "예약 실패",
							text: "사용목적을 꼭 작성해주세요!",
							icon: "error",
							closeOnClickOutside: false
						});
						return false;
					}

					if(databox == null || databox == ""){
						$("#frStime").val($(".today").data("fdate") + $("#frStime").val());
						$("#frEtime").val($(".today").data("fdate") + $("#frEtime").val());
					}
					
					Swal.fire({
			  			  title: '예약 신청',
			  			  html : "예약 신청을 하시겠습니까?",
			  			  icon: 'question',
			  			  showCancelButton: true,
			  			  confirmButtonText: 'Yes'
			  			}).then((result) => {
			  			  if (result.isConfirmed) {
			  				 Swal.fire(
			  				      '예약 성공',
			  				      '예약이 완료되었습니다!',
			  				      'success'
			  				 ).then((result)=>{
									firstSelect.css("background-color", "");
									secondSelect.css("background-color", "");
									firstSelect = null;
									secondSelect = null;
			  					facilityForm.submit();
			  				 })
			  			  } else {
			  				  Swal.fire(
			  				      '예약 중단',
			  				      '예약 신청이 중단되었습니다!',
			  				      'error'
			  				  ).then((result)=>{
										firstSelect.css("background-color", "");
										secondSelect.css("background-color", "");
										firstSelect = null;
										secondSelect = null;
									})
			  			  }
			  			});
					
					
				});


			});






		</script>