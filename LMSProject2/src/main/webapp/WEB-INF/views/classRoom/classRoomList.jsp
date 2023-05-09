<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

</style>

<!-- 페이지 타이틀 -->
<div class="page-titles">
    <ol class="breadcrumb">
    <li><h5 class="bc-title">클래스룸 목록</h5></li>
    <li class="breadcrumb-item"><a href="javascript:void(0)">
        <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
			<path fill-rule="evenodd" clip-rule="evenodd" d="M10.0122 1.82893L11.6874 5.17545C11.8515 5.50399 12.1684 5.73179 12.5359 5.78451L16.2832 6.32391C17.2091 6.45758 17.5775 7.57968 16.9075 8.22262L14.1977 10.8264C13.9314 11.0825 13.8101 11.4505 13.8731 11.812L14.5126 15.488C14.6701 16.3974 13.7023 17.0911 12.8747 16.6609L9.52545 14.9241C9.1971 14.7537 8.80385 14.7537 8.47455 14.9241L5.12525 16.6609C4.29771 17.0911 3.32986 16.3974 3.48831 15.488L4.12686 11.812C4.18986 11.4505 4.06864 11.0825 3.80233 10.8264L1.09254 8.22262C0.422489 7.57968 0.790922 6.45758 1.71678 6.32391L5.4641 5.78451C5.83158 5.73179 6.14942 5.50399 6.31359 5.17545L7.98776 1.82893C8.40201 1.00148 9.59799 1.00148 10.0122 1.82893Z" stroke="#888888" stroke-linecap="round" stroke-linejoin="round"></path>
		</svg>
        클래스룸 </a>
    </li>
    <li class="breadcrumb-item active"><a href="#">클래스룸 목록</a></li>
</ol>
</div>
<div class="container-fluid">
	<div class="row">
      <div class="card">
            <div class="card-header">
                <h4><span style=" font-size: 20px; color: #f96d00;">|</span><strong>&nbsp;클래스룸 목록</strong></h4>
            </div>
            <div class="card-body d-flex"> 
                <div class="col-3 ps-3">
                    <label for="lecOpenYear" class="form-label" style="font-size: 1.125rem;">학년도</label>
                    <select class="form-select form-select mb-2 fs-5" id="lecOpenYear">
                        <option selected>선택</option>
                        <c:forEach items="${myClassYearList }" var="myYear" varStatus="i">
	                        <option value=${myYear.lecOpenYear }>${myYear.lecOpenYear }년도</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-3 ps-5">
                    <label for="semester" class="form-label" style="font-size: 1.125rem;">학기</label>
                    <select class="form-select form-select mb-2 fs-5" id="semester">
                        <option selected>선택</option>
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                    </select>
                </div>
                <div class="col ps-5 d-flex align-items-center">
                    <button class="btn btn-primary btn-xs mt-4 fs-5" id="searchBtn">조회</button>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-responsive-md table-hover fs-4" id="classRoomList">
                    <c:if test="${sessionScope.userInfo.userType eq 'STU' }">
                        <thead>
                            <tr class="text-center" style="background-color: #fafafa;">
                                <th class="fs-4 fw-bold">#.</th>
                                <th class="fs-4 fw-bold">과목명</th>
                                <th class="fs-4 fw-bold">분반</th>
                                <th class="fs-4 fw-bold">담당교수</th>
                                <th class="fs-4 fw-bold">이동 버튼</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${classRoomList }" var="classRoom" varStatus="i">
                            <tr class="text-center" data-lec-code="${classRoom.lecCode}">
                                <td class="fw-bold">${i.count }</td>
                                <td>${classRoom.subName }</td>
                                <td>${classRoom.lecDivide }</td>
                                <td>${classRoom.proNameKo }</td>
                                <td><button class="btn btn-warning btn-icon-md intoClass" type="button" id="stuBtn"><i class="fa-solid fa-right-to-bracket"></i></button></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </c:if>
                    <c:if test="${sessionScope.userInfo.userType eq 'PRO' }">
                        <thead>
                            <tr class="text-center" style="background-color: #fafafa;">
                                <th class="fs-4 fw-bold">#.</th>
                                <th class="fs-4 fw-bold">과목명</th>
                                <th class="fs-4 fw-bold">분반</th>
                                <th class="fs-4 fw-bold">수강 인원</th>
                                <th class="fs-4 fw-bold">이동 버튼</th>
                                <th class="fs-4 fw-bold">성적 관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${classRoomList }" var="classRoom" varStatus="i">
                                <tr class="text-center" data-lec-code="${classRoom.lecCode}">
                                    <td class="fw-bold">${i.count }</td>
                                    <td>${classRoom.subName }</td>
                                    <td>${classRoom.lecDivide }</td>
                                    <td>${classRoom.subApplicant }</td>
                                    <td><button class="btn btn-warning btn-icon-md intoClass" type="button" id="proBtn"><i class="fa-solid fa-right-to-bracket"></i></button></td>
                                    <td><button class="btn btn-success btn-icon-md intoClass" type="button" id="scoreBtn"><i class="fa-solid fa-pen"></i></button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </c:if>
                    </table>
                </div>
            </div>
</div>
</div>
</div>

<script>
    $(document).on("click", "#searchBtn", function(){
        let lecOpenYear = parseInt($("#lecOpenYear").val());
        let semester = parseInt($("#semester").val());

        if(!lecOpenYear){
            alert("학년도를 선택해주세요.");
            return false;
        }
        if(!semester){
            alert("학기를 선택해주세요.");
            return false;
        }

        
        let searchData = {
            "lecOpenYear" : lecOpenYear,
            "lecOpenSemester" : semester 
        }
        console.log("검색학년도/학기 : ", searchData);

        $.ajax({
            type: "post",
            url: "/class/search",
            data: searchData,
            success: function(res){
                console.log("확인", res);
                $("#classRoomList tbody tr").remove();
                <c:if test="${sessionScope.userInfo.userType eq 'STU' }">
                    $.each(res, function(i, item){
                        let str = `
                            <tr class="text-center" data-lec-code="\${item.lecCode}">
                                <td class="fw-bold">\${i+1}</td>
                                <td>\${item.subName}</td>
                                <td>\${item.lecDivide}</td>
                                <td>\${item.proNameKo}</td>
                                <td><button class="btn btn-warning btn-icon-md intoClass" type="button" id="stuBtn"><i class="fa-solid fa-right-to-bracket"></i></button></td>
                            </tr>
                        `;
                        $("#classRoomList tbody").append(str);
                    });
                </c:if>
                <c:if test="${sessionScope.userInfo.userType eq 'PRO' }">
                    $.each(res, function(i, item){
                        let str = `
                            <tr class="text-center" data-lec-code="\${item.lecCode}">
                                <td class="fw-bold">\${i+1}</td>
                                <td>\${item.subName}</td>
                                <td>\${item.lecDivide}</td>
                                <td>\${item.subApplicant}</td>
                                <td><button class="btn btn-warning btn-icon-md intoClass" type="button" id="proBtn"><i class="fa-solid fa-right-to-bracket"></i></button></td>
                                <td><button class="btn btn-success btn-icon-md intoClass" type="button" id="scoreBtn"><i class="fa-solid fa-pen"></i></button></td>
                            </tr>
                        `;
                        $("#classRoomList tbody").append(str);
                    });
                </c:if>
            }
        });
    });
   
    
    $(document).on("click", "#stuBtn", function(){
	    var lecCode = $(this).closest('tr').data('lec-code');
	    console.log("lecCode>>", lecCode);
	    location.href = "/class/stuClassRoom/" + lecCode;
    });
    
    $(document).on("click", "#proBtn", function(){
    	var lecCode = $(this).closest('tr').data('lec-code');
	    console.log("lecCode>>", lecCode);
		location.href = "/class/proClassRoom/" + lecCode;
    });
    
    $(document).on("click", "#scoreBtn", function(){
    	var lecCode = $(this).closest('tr').data('lec-code');
	    console.log("lecCode>>", lecCode);
		location.href = "/score/list?lecCode=" + lecCode;
    });

    $(document).ready(function(){
        $("#lecOpenYear").val('${currentInfo.year}').change();
        $("#semester").val('${currentInfo.semester}').change();
    })
</script>
