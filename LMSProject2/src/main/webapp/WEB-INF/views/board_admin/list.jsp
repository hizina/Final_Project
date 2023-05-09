<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 페이지 타이틀 -->
<c:if test="${cateCode eq 'n002' }">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li><h5 class="bc-title">게시판 관리</h5></li>
			<li class="breadcrumb-item"><a href="javascript:void(0)">
				<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
				게시판  </a>
			</li>
			<li class="breadcrumb-item active"><a href="#">일반공지</a></li>
		</ol>
		<a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample1" role="button" aria-controls="offcanvasExample1">+ Add Task</a>
	</div>
</c:if>
<c:if test="${cateCode eq 'n001' }">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li><h5 class="bc-title">게시판 관리</h5></li>
			<li class="breadcrumb-item"><a href="javascript:void(0)">
				<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
				게시판 </a>
			</li>
			<li class="breadcrumb-item active"><a href="#">학사공지</a></li>
		</ol>
		<a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample1" role="button" aria-controls="offcanvasExample1">+ Add Task</a>
	</div>
</c:if>
<c:if test="${cateCode eq 'r001' }">
	<div class="page-titles">
		<ol class="breadcrumb">
			<li><h5 class="bc-title">게시판 관리</h5></li>
			<li class="breadcrumb-item"><a href="javascript:void(0)">
				<svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M2.125 6.375L8.5 1.41667L14.875 6.375V14.1667C14.875 14.5424 14.7257 14.9027 14.4601 15.1684C14.1944 15.4341 13.8341 15.5833 13.4583 15.5833H3.54167C3.16594 15.5833 2.80561 15.4341 2.53993 15.1684C2.27426 14.9027 2.125 14.5424 2.125 14.1667V6.375Z" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
					<path d="M6.375 15.5833V8.5H10.625V15.5833" stroke="#2C2C2C" stroke-linecap="round" stroke-linejoin="round"/>
				</svg>
				게시판 </a>
			</li>
			<li class="breadcrumb-item active"><a href="#">채용정보</a></li>
		</ol>
		<a class="text-primary fs-13" data-bs-toggle="offcanvas" href="#offcanvasExample1" role="button" aria-controls="offcanvasExample1">+ Add Task</a>
	</div>
</c:if>

<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="container-fluid">
	  <div class="row">
		      <div class="card" id="accordion-one">
		         <div class="card-header flex-wrap" style="padding-bottom:10px;" >
		              <h4 id="cateName">
		              	 <span style="font-size: 20px; color: #f96d00;">|&nbsp;</span>
		              </h4>
		               <input type="hidden" id="cateCode" value="${cateCode }">
                     <c:if test="${sessionScope.userInfo.userType eq 'EMP' }">
		   			 	<button type="button" class="btn btn-primary" onclick="javascript:location.href='/board/admin/form/${cateCode}'">등록</button>
		   			 </c:if>
		         </div>
		         <div class="card-body">
			         <div class="tab-content" id="myTabContent">
			            <div class="tab-pane fade show active" id="Preview" role="tabpanel"
			               aria-labelledby="home-tab">
			               <div class="card-body pt-0">
			                  <div class="table-responsive">
			                     <table id="example" class="display table"
			                        style="min-width: 845px">
			                        <thead style="border-bottom: #175bc7;">
			                           <tr style="border-bottom: #175bc7;">
			                              <th>#</th>
			                              <th>제목</th>
			                              <th>작성자</th>
			                              <th>작성일</th>
			                              <th>조회수</th>
			                           </tr>
			                        </thead>
			                        <tbody  style="border-top: #175bc7;">
			                           <c:set value="${pagingVO.dataList }" var="boardList"/>
			                           <c:choose>
			                              <c:when test="${empty boardList}">
			                                 <tr>
			                                    <td colspan="5" style="text-align:center;">조회하신 게시글이 존재하지 않습니다.</td>                                 
			                                 </tr>
			                              </c:when>
			                              <c:otherwise>
			                                 <c:forEach items="${boardList }" var="board"> 
			                                    <tr>
			                                       <td>${board.rnum }</td>
			                                       <td><a href="/board/admin/detail/${board.boNo }">${board.boTitle }</a></td>
			                                       <td>${board.empNameKo }</td>
			                                       <td>${board.boWriteDate }</td>
			                                       <td>${board.boHit }</td>
			                                    </tr>
			                                 </c:forEach>
			                              </c:otherwise>
			                           </c:choose>
			                        </tbody>
			                     </table>
			                  </div>
			               </div>
			            </div>
			         </div>
		         </div>
		      </div>
		</div>
</div>	




  <script>
  $(function () {
	var cateCode = $('#cateCode').val();
	var cateName = $('#cateName');
	
	if(cateCode == 'n001'){
		cateName.append('학사공지');
	}
	if(cateCode == 'n002'){
		cateName.append("일반공지");
	}
	if(cateCode == 'r001'){
		cateName.append("채용정보");
	}
	if(cateCode == 's002'){
		cateName.append("학사일정");
	}
	if(cateCode == 'p001'){
		cateName.append("건의사항");
	}
	
})
  
  </script>
  