<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#historyTbl {
	user-select: none;
}
</style>
<!-- 페이지 타이틀 -->
<div class="page-titles">
	<ol class="breadcrumb">
		<li><h5 class="bc-title">수강이력</h5></li>
		<li class="breadcrumb-item"><a href="javascript:void(0)"> <svg
					width="17" height="17" viewBox="0 0 17 17" fill="none"
					xmlns="http://www.w3.org/2000/svg">
            <path
						d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z"
						stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round" />
            <path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C"
						stroke-linecap="round" stroke-linejoin="round" />
        </svg> 수강정보
		</a></li>
		<li class="breadcrumb-item active"><a href="javascript:void(0)">수강이력</a></li>
	</ol>
</div>
<div class="container-fluid">
	<!-- 표현하고자 하는 내용 넣기 -->
	<!--  수강이력 조회  -->
	<!-- 내 기본정보 -->
	<div class="row">
		<div class="card">
			<div class="card-body" style="border: none;">
				<div class="row">
					<div class="col-md-1 text-center"
						style="margin-top: 10px; padding: 0;">학번:</div>
					<div class="col-md-2">
						<input type="text" name="" value="${stuInfo.stuId}"
							disabled="disabled" class="form-control">
					</div>
					<div class="col-md-1 text-center"
						style="margin-top: 10px; padding: 0;">이름:</div>
					<div class="col-md-2">
						<input type="text" name="" value="${stuInfo.stuNameKo}"
							disabled="disabled" class="form-control">
					</div>
					<div class="col-md-1 text-center"
						style="margin-top: 10px; padding: 0;">학부(과):</div>
					<div class="col-md-3">
						<input type="text" name="" value="${stuInfo.deptName}"
							disabled="disabled" class="form-control">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 내 기본 정보 표시 끝-->

	<div class="row">
		<div class="card" style="padding-top:20px;">

			<!-- 수강이력 조회-->
			<div class="row">
			<div class="col-md-5">
				<div class="card" style="height: 40vh; overflow: auto;">
					<div class="card-header" style="padding-bottom: 10px;">
						<h4>
							<span style="font-size: 20px; color: #f96d00;">|</span><strong>&nbsp;수강이력</strong>
						</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover text-center table-bordered"
								id="historyTbl">
								<thead>
									<tr class="bg-primary bg-gradient text-white">
										<th>학년도</th>
										<th>학기</th>
										<th>신청학점</th>
										<th>이수학점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${courseHistoryList }" var="couHistory">
										<tr class="historyTr"
											data-lec-open-year="${couHistory.lecOpenYear }"
											data-lec-open-semester="${couHistory.lecOpenSemester }">
											<td>${couHistory.lecOpenYear }년도</td>
											<td>${couHistory.lecOpenSemester }학기</td>
											<td>${couHistory.totalCredits }</td>
											<td>${couHistory.compleCredits }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!--수강이수 조회 끝-->

				<!-- 학점이수 현황-->
				<div class="card" style="height: 30vh; overflow: auto;">
					<div class="card-header" style="padding-bottom: 10px;">
						<h4>
							<span style="font-size: 20px; color: #f96d00;">|</span><strong>&nbsp;학점이수현황</strong>
						</h4>
					</div>
					<div class="card-body" style="overflow: hidden;">
						<canvas id="myChart"></canvas>
					</div>
					<!-- <div class="card-footer">
                    합계:
                </div> -->
				</div>
				<!-- 학점 이수현황 끝-->
			</div>
			<!-- col-md-5 끝 -->

			<!-- 수강이력 상세조회 -->
			<div class="col-md-7">
				<div class="card" style="height: 72vh; overflow: auto;">
					<div class="card-header" style="padding-bottom: 10px;">
						<h4>
							<span style="font-size: 20px; color: #f96d00;">|</span><strong>&nbsp;상세조회</strong>
						</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">

							<table class="table table-hover text-center table-bordered"
								id="detailTbl">
								<thead>
									<tr class="bg-primary bg-gradient text-white">
										<th style="width: 33%;">교과목명</th>
										<th style="width: 22%;">구분</th>
										<th style="width: 12%;">학점</th>
										<th style="width: 23%;">담당교수</th>
										<th style="width: 10%;">인정여부</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 상세조회 끝 -->
		</div>
		<!-- row 끝 -->
		</div>
	</div>
</div>

<script>
    $(function(){
        let selectTr = null;

        $(document).ready(function() {
        	let tr = $(".historyTr:eq(0)"); 
            if(!tr){
                return false;
            }
            $(".historyTr:eq(0)").click();
        });

        $(document).on("click", ".historyTr", function(){
            if(selectTr){
                selectTr.css("background-color", "");
            }
            selectTr = $(this);
            $(this).css("background-color", "lightblue");

            let lecOpenYear = parseInt($(this).data("lecOpenYear"));
            let lecOpenSemester = parseInt($(this).data("lecOpenSemester"));
            let data = {
                "lecOpenYear" : lecOpenYear,
                "lecOpenSemester" : lecOpenSemester
            }
            console.log("수강이력 tr data:", data);

            $.ajax({
                type: "post",
                url: "/course/detail",
                data: data,
                success: function(res){
                    console.log("상세조회>>", res);
                    $("#detailTbl tbody tr").remove();
                    $.each(res, function(i, item){
                        let str = `<tr>
                                <td>\${item.subName }</td>
                                <td>\${item.subSort }/\${item.subType }</td>
                                <td>\${item.subCredit}</td>
                                <td>\${item.proNameKo}</td>
                                <td>\${item.couTake}</td>
                            </tr>`;
                            
                        $("#detailTbl tbody").append(str);
                    });
                }
            });
        });

        // 도넛 차트
        var ctx = document.getElementById('myChart').getContext('2d');
        const data = {
            labels: ['전필 ${totCredit.totMaj1}', '전선 ${totCredit.totMaj2}', '교필 ${totCredit.totLib1}', '교선 ${totCredit.totLib2}'],
            datasets: [{
                label: '총이수학점',
                data: [${totCredit.totMaj1}, ${totCredit.totMaj2}, ${totCredit.totLib1}, ${totCredit.totLib2}],
                backgroundColor: [
                    'rgb(226,139,123)',
                    'rgb(144,207,193)',
                    'rgb(229,196,118)',
                    'rgb(173,200,122)'
                ],
                hoverOffset: 4
            }]
        };
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: data,
            options: {
                animation: {
                    duration: 2000, // 애니메이션 지속 시간 (2초)
                    easing: 'easeOutQuart', // 이징 함수
                    animateRotate: true, // 차트 회전 애니메이션 적용 여부
                    animateScale: true // 차트 크기 변화 애니메이션 적용 여부
                },
                maintainAspectRatio: false,
                responsive: true,
                plugins: {
                    legend: {
                        position: 'left'
                    }
                }
            }
        });


    });             
</script>
