<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- ===================[fullCalendar 6.1.4 CDN]===================== -->
<!--  fullCalendar 6.1.4버전 CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.4/index.global.min.js"></script>
<!-- fullCalendar 6.1.4버전 언어 설정 -->
<script src="/resources/fullcalendar/ko.global.min.js"></script>
<!-- ===================[fullCalendar 6.4.1 CDN]===================== -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<title>calendar</title>

<script>
	(function() {
		$(function() {
			var request = $.ajax({
				url : "/calendar/list",
				type : "post",
				dataType : 'json',
			/* success : function(data){
			
			} */
			});
			request.fail(function(jqXHR, textStatus) {
				alert("오류발생!! : " + textStatus);
			});

			request
					.done(function(data) {

						$("input[name=studyCode]").val(data[0].groupId);

						var modalElement = document
								.getElementById('calendarModal')
						var modal = new bootstrap.Modal(modalElement);
						//룸코드..추가해보자
						var id = $("#calNo").val();
						var groupId = $("#studyCode").val();
						var title = $("#calendar_title"); //일정 제목
						var content = $("#calendar_content"); //일정 내용
						var barColor = $("#barColor"); // 색상

						var startTime = $("#startTime"); //시작시간
						var endTime = $("#endTime"); //종료시간
						var start = $("#calendar_start_date");
						var end = $("#calendar_start_date");

						var saveBtn = $("#addCalendar");
						var closeBtn = $("#closeBtn");
						var modalCloseBtn = $("#modalClose");
						var deleteBtn = $("#delCalendar");
						var flag = false;

						//saveBtn 시작//////////////////////////////////////////
						saveBtn
								.on(
										"click",
										function() {
											console.log("flag == ", flag);
											var groupId = $("#studyCode").val();
											console
													.log("studyCode : ",
															groupId);
											var title = $("#calendar_title");
											//memo라서 헷갈린당..
											var content = $("#calendar_content");
											//color을 안 넣어줬었지 이건 내가 처리해야댐
											var barColor = $("#barColor");

											var startTime = $("#startTime");
											var endTime = $("#endTime");
											//allDay 생겼네?
											var allDay = $("#allDay");
											var start = $("#calendar_start_date");
											var end = $("#calendar_end_date");

											var saveBtn = $("#addCalendar");
											var closeBtn = $("#closeBtn");
											var modalCloseBtn = $("#modalClose");
											var deleteBtn = $("#delCalendar");

											//일정등록
											if (flag == true) {
												titleInput = title.val();
												contentInput = content.val();
												console.log("allDay체크 ::",
														allDay.val());

												startTimeInput = startTime
														.val();
												endTimeInput = endTime.val();
												alert("startTimeInput : "
														+ startTimeInput
														+ ", endTimeInput : "
														+ endTimeInput);

												startInput = document
														.getElementById('calendar_start_date').value;
												endInput = document
														.getElementById('calendar_end_date').value;

												barColorInput = barColor.val();//색추가

												console.log("startInput : "
														+ startInput);

												console.log("title : "
														+ titleInput
														+ ", content : "
														+ contentInput
														+ "startDate : "
														+ startInput);

												// value="T" 체크박스설정임...입력값을 받아와서 디비에 저장
												/*                   if(allDay.val() == 'T'){ //일정이 하루종일인 경우
												                     $.ajax({
												                        type : "POST",
												                        url : "/calendar/register",
												                        data :{
												                           'title' : titleInput,
												                           'content' : contentInput,
												                           'startDate' : startInput + "T" + "00:00:00",
												                           'endDate ' : startInput + "T" + "24:00:00"
												                        },
												                        success : function(res){
												                           alert("일정이 추가되었습니다.");
												                           location.reload();
												                              if(title == null || title == ""){
												                                 alert("일정의 제목을 입력하세요.");
												                              }
												                              if(content == null || content == ""){
												                                 alert("일정의 제목을 입력하세요.");
												                              }
												                              if(new Date(endInput) - new Date(startInput) < 0){
												                                 alert("종료일이 시작일보다 먼저입니다.")
												                              }
												                        }
												                     });
												                  } */
												$
														.ajax({
															type : "POST",
															url : "/calendar/register",
															data : {
																'studyCode' : $(
																		"input[name=studyCode]")
																		.val(),
																'scTitle' : titleInput,
																'scContent' : contentInput,
																'scSdate' : startInput
																		+ "T"
																		+ startTimeInput,
																'scEdate' : endInput
																		+ "T"
																		+ endTimeInput,
																'scBarColor' : barColorInput
															// 색추가
															},
															success : function(
																	res) {
																alert("일정이 추가되었습니다.");
																location
																		.reload();
																//룸코드는 이런거 없어도 되지 않을까 강제로 넣는건데.....
																if (title == null
																		|| title == "") {
																	alert("일정의 제목을 입력하세요.");
																}
																if (content == null
																		|| content == "") {
																	alert("일정의 내용을 입력하세요");
																}
																if (new Date(
																		endInput)
																		- new Date(
																				startInput) < 0) {
																	alert("종료일이 시작일보다 먼저입니다.");
																}
															}
														});
												$("#calendar_content").val('');
												$("#calendar_start_date").val(
														'');
												$("#calendar_end_date").val('');
												$("#barColor").val(''); //색추가
												modal.hide();
												//깜빡
												location.reload();

											} else {
												id = $("#calNo").val();
												groupId = $("#studyCode").val();
												title = $("#calendar_title")
														.val();
												content = $("#calendar_content")
														.val();
												startDate = $(
														"#calendar_start_date")
														.val();
												endDate = $(
														"#calendar_end_date")
														.val();
												startTime = $("#startTime")
														.val();
												endTime = $("#endTime").val();
												barColor = $("#barColor").val(); //색추가

												//   console.log(">> 수정 : " + id + ", " + groupId + ", " + title + ", " + content + ", " + startDate + ", " + startTime);
												console.log(">> 수정 : ",
														barColor);
												var param = {
													'scNo' : id,
													'studyCode' : groupId,
													'scTitle' : title,
													'scContent' : content,
													'scSdate' : startDate + "T"
															+ startTime,
													'scEdate' : endDate + "T"
															+ endTime,
													'scBarColor' : barColor
												//색 추가함
												}
												$.ajax({
													type : "post",
													url : "/calendar/update",
													data : param,
													dataType : "json",
													success : function(req) {
														console.log(reg);
													}
												}); //ajax end
												alert("수정 완료????");
												modal.hide();
												location.reload();
											}
										});
						//saveBtn끝///////////////////////////////////////

						//deleteBtn 시작/////////////////////////////////////
						deleteBtn.on("click", function() {
							id = $("#calNo").val();
							var param = {
								'scNo' : id,
							}
							if (confirm("삭제할꺼야?")) {
								$.ajax({
									type : "post",
									url : "/calendar/remove",
									data : param,
									dataType : "json",
									success : function(req) {
										console.log("reg : " + req);
									}
								});
								alert(title + "삭제되었어")
								//  event.remove(); // 캘린더 화면에서 해당 일정 삭제
								modal.hide();
								location.reload();
							} // if(confirm) end
						});
						//deleteBtn 끝////////////////////////////////////////

						//closeBtn 시작//////////////////////////////////////////

						// modal [x] 버튼
						closeBtn.on("click", function() {
							//modal 창 내용 초기화
							$("#studyCode").val('');
							$("#calendar_title").val('');
							$("#calendar_content").val('');
							$("#calendar_start_date").val('');
							$("#calendar_end_date").val('');
							$("#barColor").val(''); //색깔
							calendar.unselect();
							console.log("x버튼 클릭")
							modal.hide();
						});
						//closeBtn 끝//////////////////////////////////////////

						//modalClose 시작/////////////////////////////////////
						//modal [취소] 버튼
						modalCloseBtn.on("click", function() {
							//modal 창 초기화
							$("#studyCode").val('');
							$("#calendar_title").val('');
							$("#calendar_content").val('');
							$("#calendar_start_date").val('');
							$("#calendar_end_date").val('');
							$("#barColor").val(''); //색깔
							calendar.unselect();
							console.log("취소버튼 클릭");
							modal.hide();
						});
						////modalClose 끝/////////////////////////////////////

						//log로 controller에서 넘어온 데이터 정보
						console.log("data가 잘 넘어오는지.." + JSON.stringify(data));
						var calendarElement = $('#calendar')[0];

               /////////////////////////////////////////////////
               // full-calendar 생성////////////////////////
               var calendar = new FullCalendar.Calendar(calendarElement, {
									//                   height:700px,
									//                   width:800px,
									expandRows : true, //높이 맞게 재설정
									//헤더에 표시할 툴바
									headerToolbar : {
										left : 'prev,next,today',
										center : 'title',
										right : 'dayGridMonth, timeGridWeek, timeGridDay, listWeek'
									},
									initialView : 'dayGridMonth', // 초기 로드 화면
									navLinks : true, // 날짜 선택시 daysk week 캘린더로
									editable : true, //수정 가능 여부
									selectable : true, //달력 일자 드래그
									nowIndicator : true, //현재 시간 마크
									dayMaxEvents : true, //이벤트가 오버되면 높이 제한(+몇 개)
									locale : 'ko', //한국어 설정

									//select 시작
									select : function(info) { //캘린더에서 드래그이벤트
										flag = true;
										console.log("info1 >>", info);
										//이게 없으면 
										$("#deleteCalendar").hide(); //'삭제' 버튼이 남아있는 것을 숨김
										modal.show();

										console.log("title : ", title);
										//이부분이 if(title == null || title == ""){ 였음
										//사실상 모양만 추가로 한다는 것임
										if (flag = true) {
											$("#addCalendar").text("추가");
										}

										$('#calendarModal').modal();
										var saveBtn = $("#addCalendar");

										$("#calendar_start_date").val(
												info.startStr); //startStr은 라이브러리에있는걸까
										$("#calendar_end_date")
												.val(info.endStr);

										calendar.unselect() //일정 선택 취소 시 실행될 코드 작성
									},
									//select 끝
									//eventClick 시작
									eventClick : function(info) { //등록 일정 클릭했을때
										console.log("info2 >>", info.event);
										console.log(calendar.getEvents());//캘린더 안의 데이터 확인용
										//$("#calNo").val(info.event.extendedProps.no); 수정함
										$("#calNo").val(info.event.id); //이렇게 쓰는게 아니고 원체없는 값이면 extendedProps를 꼭 써줘야해
										//$("#studyCode").val(info.event.extendedProps.studyCode);
										$("#studyCode").val(info.event.groupId);
										//이부분이 머더라.. 아마 처음 셋팅 값인듯 
										var startDate = info.event.startStr
												.split('T')[0];
										var startTime = (info.event.startStr
												.split('T')[1]).split('+')[0];
										var endDate = info.event.endStr
												.split('T')[0];
										var endTime = (info.event.endStr
												.split('T')[1]).split('+')[0];

										// split은 문자열을 인자로 주어진 문자열을 
										// 기준으로 쪼개서 배열에 담는다.

										title = info.event.title;
										content = info.event.extendedProps.content;
										deleteBtn = $("#delCalendar");
										if (title != null || title != '') {
											/* 추가였지만 등록된걸 누르면 수정 */

											$("#addCalendar").text('수정');
											deleteBtn.css("display", "inline");
											//                         $("#deleteCalendar").attr("style","display:inline");
										}
										//검색검색
										modal.show();
										$('#calendarModal').modal();
										$('#studyCode').val(groupId);
										$("#calendar_title").val(title);
										$("#calendar_content").val(content);
										//startDate와 endDate는 시간날짜 합친거라고 하기에는...애매한데.. 
										$("#calendar_start_date")
												.val(startDate);
										$("#calendar_end_date").val(endDate);
										$("#startTime").val(startTime);
										$("#endTime").val(endTime);
										$("#barColor").val(barColor)//색깔

									},
									//이벤트 부분에 데이터가 아무것도 없으니깐 아무것도 안떴지..죽자
									//비동기라 따로노는 부분임
									events : data
								//                      [
								//                       {
								//                          title: 'All Day Event',
								//                          start: '2023-04-06',
								//                       },
								//                       {
								//                          title: 'All Day Event',
								//                          start: '2023-04-07',
								//                      }
								//                   ]
								});
						// full-calendar 생성 끝///////////
						// 캘린더 랜더링
						calendar.render();
					});
		});
	})();
</script>

<body>
	<!-- 모달창  시작 -->
	<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="display: none; z-index: 9000;">
		<div class="modal-dialog" role="document">
			<div class="modal-content" id="modalBox" style="display: block;">
				<div class="modal-header">
					<span id="closeBtn" class="close" data-dismiss="modal"
						aria-label="Close" style="margin-left: 380px; display: inline;">X</span>
					<h3 class="modal-title" id="exampleModalLabel" style="margin: 0">일정
						등록</h3>
					<hr />
				</div>
				<div class="modal-body">
					<input type="text" id="calNo" name="calNo" value=""><br />
					<!-- 여기가 아니라 위에다 studyCode.val()으로 직접 넣어줬음... -->
					<input type="hidden" id="studyCode" name="studyCode" value="1">
					<!-- name의 행방이매우 궁금했었음. -->
					<!-- name이랑 VO 가 안이어져도 되는 이유는 controller에서 put으로 데이터를 넣는 작업을 해주었기 떄문에 안해도 되는것같음..   -->
					<div>
						일정 제목 <input type="text" class="form-control" id="calendar_title"
							name="calendar_title">
					</div>
					<div>
						내용<br> <br>
						<textarea class="form-control" id="calendar_content"
							name="calendar_content" rows="10" cols="50"
							style="margin-left: 10px"></textarea>
						<br> <br>
					</div>
					<div>
						시작 날짜 <input type="date" class="form-control"
							id="calendar_start_date" name="calendar_start_date"> <input
							type="time" id="startTime" name="startTime">
						<!-- <inputtype="checkbox" id="allDay" name="allDay" value="T">하루종일<br> -->
						<br>
					</div>
					<div>
						종료 날짜 <input type="date" class="form-control"
							id="calendar_end_date" name="calendar_end_date"> <input
							type="time" id="endTime" name="endTime"> <br> <br>
					</div>
					<div>
						색깔 선택
						<div class="row">
							<select class="barColor" id="barColor" name="barColor">
								<option disabled selected>색상 선택</option>
								<option value="red">빨강</option>
								<option value="orange">오렌지</option>
								<option value="blue">파랑</option>
								<option value="green">초록</option>
							</select>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="추가" id="addCalendar">추가</button>
						<button type="button" class="딜리트" id="delCalendar"
							style="display: none">삭제</button>
						<button type="button" class="취소" id="modalClose"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달창 끝 -->

	<!-- 캘린더 -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
</body>