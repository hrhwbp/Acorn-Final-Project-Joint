<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="index, follow">
    <title>RE:MIND || 나의 정보</title>
    
<%@ include file="importstop.jsp" %>

 
<!-- ===============================해당 페이지용 스타일================================================ -->
<style type="text/css">
/* ============아이콘 표시를 위한 import=============== */
@import url(//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css);
}
@import url(http://fonts.googleapis.com/css?family=Titillium+Web:300);
/* ============아이콘 표시를 위한 import 끝ㅇ============== */

.thumbnail-wrappper {
    width: 25%; 
}

.thumbnail {
    position: relative;
    padding-top: 100%;  /* 1:1 ratio */
    overflow: hidden;
}

.thumbnail .centered  {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    -webkit-transform: translate(50%,50%);
    -ms-transform: translate(50%,50%);
    transform: translate(50%,50%);
}

.thumbnail .centered img {
    position: absolute;
    top: 0;
    left: 0;   
    max-width: 100%;
    height: auto;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}

.thumbnail img.portrait {
  width: 100%;
  max-width: none;
  height: auto;
}
.thumbnail img.landscape {
  width: auto;
  max-width: none;
  height: 100%;
}

} 
</style>	

    <!-- ===============================해당 페이지용 스크립트================================================ -->

    
<script type="text/javascript">

$(document).ready(function() {
	/*===================  비밀번호 변경시 변경 완료 모달 =====================*/
	if(${param.suc == true}){
		$("#passwordOk").modal('show');
	};
	/*===================  비밀번호 변경시 변경 완료 모달 =====================*/
	
	/*===================  프로필 수정 비밀번호 검사  =====================*/
	$('#infoSubmit').click(function() {
		if($('#password').val() == $('#m_password').val()){
			
					
			$('#infofrm').submit()
		}else{
			$('#passwordErr').modal('show');
		}
	});
	/*===================  프로필 수정 비밀번호 검사  =====================*/
	
	
	/*===================  내 이벤트 date-picker 설정  =====================*/
	/* $(".date-picker").datepicker(); */
	$('#date-picker-2').datepicker({
	    dateFormat : "yy-mm-dd",
	    beforeShow: function() {
	        setTimeout(function(){
	            $('.ui-datepicker').css('z-index', 99999999999999);
	        }, 0);
	    },
	});
	
	$('#date-picker-3').datepicker({
	    dateFormat : "yy-mm-dd",
	    beforeShow: function() {
	        setTimeout(function(){
	            $('.ui-datepicker').css('z-index', 99999999999999);
	        }, 0);
	    },
	});
	/*===================  내 이벤트 date-picker 설정  =====================*/
});
	
	/*===================  이벤트 수정  =====================*/
	function eventUpdate(a_no,a_detail,a_date) {
		$('#hiddenA_no').attr('value',a_no);
		$('#updateDetail').attr('value',a_detail);
		$('#date-picker-3').attr('value',a_date);
		$('#updateAnni').modal('show');
	}
	/*===================  이벤트 수정  =====================*/
	
	/*===================  이벤트 삭제  =====================*/
	function eventDelete(a_no) {
		$("#eventDelOk").attr('onclick','eventDeleteOk()');
		$("#deleteA_no").attr('value',a_no);
		$("#eventDeleteOk").modal('show');
	}
	/*===================  이벤트 삭제  =====================*/
	
	/*===================  이벤트 삭제확인  =====================*/
	function eventDeleteOk() {
		$("#deleteAnniFrm").submit();
	}
	/*===================  이벤트 삭제확인  =====================*/
	
	/*===================  비밀번호  변경요청후  검사 및 전송  =====================*/
	
	function passwdFunc() {
		//#password
		var passwd = $('#password').val();
		var oldPass = $("#oldPasswd").val();
		var newPass = $("#newPasswd").val();
		var newPassCheck = $("#newPasswdCheck").val();
		
		if(passwd != oldPass){
			$('#passwordErr').modal('show');
			$("#oldPasswd").val('');
			$("#oldPasswd").focus();			
		}else if(newPass != newPassCheck){
			$('#passwordCheckErr').modal('show');
			$('#newPasswd').val('');$('#newPasswdCheck').val('');
			$('#newPasswd').focus();
		} else{
			$("#passwdFrm").attr("action","passChange");
			$("#passwdFrm").submit();
			
		}		
	}
	/*===================  비밀번호  변경요청후  검사 및 전송  =====================*/
</script>
    
</head>
<%@include file="top.jsp"%>
<body>
<!-- =======================================각종 모달======================================= -->
<!-- 프로필 수정 모달 -->	
	<div class="modal fade" id="updateInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="margin: 150px auto;">
	    <div class="modal-content">
	     <form action="updateInfo" id="infofrm" method="post" enctype="multipart/form-data">
	      <div class="modal-header">
	      
	     
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
				<div style="color: buttontext; border: 0; cursor: pointer; height: 170px; padding: 0; width: 100%;">
					<a  onclick="$('#file').click();">
					<img id="image" src="http://wbp.synology.me/profileimg/${myinfo.m_image}" alt="Responsive image" class="img-circle img-responsive" style="height: 100%; width: 100%">
					</a>
	      			<input type="file" id="file"  name="fileUp" class="sr-only">
	      			<input type="hidden" name="hiddenName" value="${myinfo.m_image}" > 

				</div>
				</div>
			</div>
	     </div>
	      	<div class="modal-body">
			
				<input type="hidden" name="m_no" value="${myinfo.m_no}">
				<div class="row">
					<div class="col-md-12">
						<label for="Email1">E-mail</label>
						<input type="email" class="form-control" id="Email1" name="m_email" value="${myinfo.m_email}" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="name">이름</label>
						<input type="text" class="form-control" name="m_name" id="name" value="${myinfo.m_name }" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="inputOldPassword" class="">현재 비밀번호</label> 
						<input type="password" name="m_password" id="m_password" class="form-control" placeholder="Password" required>
						<input type="hidden" id="password" value="${myinfo.m_password}">				
					</div>
				</div>
				<div class="row form-group">
						<div class="col-md-2">
							
						</div>
						<div class="col-md-4 top_pd text-right">
							<c:set var="date" value="${myinfo.m_bdate}"/>
							<label class="">년도</label>
							<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value="${toDay}" var = "viewYear" pattern="yyyy" />
							<select class="form-control" name="year">
								<c:forEach var="i" begin="0" end ="100" step="1">
								<c:if test="${fn:substring(date,0,4) == (viewYear -i)}">
								<option selected="selected">${viewYear -i }</option>
								</c:if>
								<c:if test="${fn:substring(date,0,4) != (viewYear -i)}">
								<option>${viewYear -i }</option>
								</c:if>
								</c:forEach>

							</select>
						</div>

						<div class="col-md-3 top_pd text-right">
							<label class="">월</label> 
							<select class="form-control" name="month">
								<c:forEach var="i" begin="1" end ="12" step="1">
								<c:if test="${fn:substring(date,5,7) == i}">
								<option selected="selected">${i}</option>								
								</c:if>
								<c:if test="${fn:substring(date,5,7) != i}">
								<option>${i}</option>
								</c:if>
								</c:forEach>
							</select>
						</div>

						<div class="col-md-3 top_pd text-right">
							<label class="" for="ss">일</label> 
							<select id="ss" name="day"
								class="form-control" >
								<c:forEach var="i" begin="1" end ="31" step="1">
								<c:if test="${fn:substring(date,8,10) == i}">
								<option selected="selected">${i}</option>
								</c:if>
								<c:if test="${fn:substring(date,8,10) != i}">
								<option>${i}</option>
								</c:if>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class=" col-md-12">
						<textarea class="form-control" rows="3" placeholder="자신의 소개말을 입력해주세요." name="m_introduce">${myinfo.m_introduce }</textarea>
						</div>
					</div> 
		
	      	</div>
	    	<div class="modal-footer">	    	
	    	<button class="btn btn-primary" id="infoSubmit" type="button">Save changes</button>	    	
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			</form>
	    </div>	    
	  </div>	  	
	</div>
	<!-- 프로필 수정 모달  끝-->
	<!-- 비밀번호 모달 팝업 -->
	<div class="modal fade " id="passwordErr" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 350px auto;">
	    <div class="modal-content">
	      <div class="row text-center" style="color:red; font-weight: bold;">
	      	현재 비밀번호를 다시 입력해주세요.
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 비밀번호 모달 팝업 끝-->

	<!-- 비밀번호 모달 팝업 -->
	<div class="modal fade " id="passwordCheckErr" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 350px auto;">
	    <div class="modal-content">
	      <div class="row text-center" style="color:red; font-weight: bold;">
	      	새로운 비밀번호가 서로 맞지않습니다.
	      </div>
	    </div>
	  </div>
	</div>

	<div class="modal" id="passwordOk" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 350px auto;">
	    <div class="modal-content">
	      <div class="modal-body text-center">
	      	<b style="color: green;">비밀번호가 변경되었습니다!</b>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 비밀번호 모달 팝업 끝-->
	
	<!-- 기념일 추가 모달  insertAnni-->

	<div class="modal fade bs-example-modal-sm" id="insertAnni" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 250px auto;">
	    <div class="modal-content">
	     <form action="insertAnni" id="insertAnnifrm" method="post">
	      	<div class="modal-body">
			
				<input type="hidden" name="a_mno" value="${myinfo.m_no }">
				<div class="row">
					<div class="col-md-12">
						<label for="a_detail">이벤트 이름</label>
						<input type="text" class="form-control" id="a_detail" name="a_detail" required>
					</div>
				</div>
				
			    <div class="row">
			    <div class="col-md-12">
				    <div class="control-group">
	        		<label for="date-picker-2" class="control-label">날짜</label>
	        		<div class="controls">
	          		<div class="input-group">
	                <input id="date-picker-2" type="text" name="a_date" class="date-picker form-control" readonly="readonly" required/>
	                <label for="date-picker-2" class="input-group-addon btn">
	                	<span class="glyphicon glyphicon-calendar"></span>
	                </label>
		            </div>
		       		 </div>
		   		 </div>
			     	</div>
			    </div>
			</div>
	    	<div class="modal-footer">	    	
	    	<button class="btn btn-primary" id="eventSubmit" type="submit">Save Change</button>	    	
			</div>
			</form>
	    </div>	    
	  </div>	  	
	</div> 
	<!-- 기념일 추가 모달  insertAnni끝-->
	<!-- 기념일 수정 모달 -->
		<div class="modal fade bs-example-modal-sm" id="updateAnni" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm" style="margin: 250px auto;">
	    <div class="modal-content">
	     <form action="updateAnni" id="updateAnnifrm" method="post">
	      	<div class="modal-body">
			
				<input type="hidden" name="a_mno" value="${myinfo.m_no }">
				<input type="hidden" id="hiddenA_no" name="a_no" value="">
				<div class="row">
					<div class="col-md-12">
						<label for="a_detail">이벤트 이름</label>
						<input type="text" class="form-control" value="" id="updateDetail" name="a_detail" required>
					</div>
				</div>
				
			    <div class="row">
			    <div class="col-md-12">
				    <div class="control-group">
	        		<label for="date-picker-3" class="control-label">날짜</label>
	        		<div class="controls">
	          		<div class="input-group">
	                <input id="date-picker-3" type="text" name="a_date" class="date-picker form-control" readonly="readonly" required/>
	                <label for="date-picker-3" class="input-group-addon btn">
	                	<span class="glyphicon glyphicon-calendar"></span>
	                </label>
		            </div>
		       		 </div>
		   		 </div>
			     	</div>
			    </div>
			</div>
	    	<div class="modal-footer">	    	
	    	<button class="btn btn-primary" type="submit">Save</button>	    	
			</div>
			</form>
	    </div>	    
	  </div>	  	
	</div> 
	
    <!--  -->        
	<!-- 삭제확인 모달 -->
	<div class="modal fade" id="eventDeleteOk" tabindex="-1" role="dialog" aria-labelledby="">
	  <div class="modal-dialog modal-sm" style="margin: 350px auto;">
	    <div class="modal-content">
	      <div class="row text-center">
	      	<p style="padding-top: 2%"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true" style="color: red;  font-size: 25px;"></span></p>
	      	<h5>
	      	<b>정말 삭제 하시겠습니까?</b>
	      	</h5>
	      </div>
	    </div>
	    
	     <div class="modal-footer">
	     	<div class="row text-center">
			<button type="button" class="btn btn-danger" id="eventDelOk" onclick="boardDeleteOk()">Delete</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	     	</div>
	      </div>
	    	<form action="deleteAnni" method="post" id="deleteAnniFrm">
	    		<input type="hidden" id="deleteA_no" name="a_no" value="">
	    	</form>
	  </div>
	</div>    
	<!-- 삭제확인 모달 끝 -->    

    
    <!-- MAIN CONTENT -->
        <div class="pg-opt">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h2>User account</h2>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li><a href="action">Home</a></li>                       
                        <li class="active">User account</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <section class="slice bg-white">
        <div class="wp-section user-account">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="user-profile-img">
                            	<c:choose>
									<c:when test="${mno == myinfo.m_no }">
									<a style="color: buttontext; border: 0; cursor: pointer; height: 100%; padding: 0; width: 100%;" data-toggle="modal" data-target="#updateInfo">		
										<img src="http://wbp.synology.me/profileimg/${myinfo.m_image }" class="img-responsive" style="height: 100%; width: 100%">
									</a>
									</c:when>
									<c:otherwise>
										<img src="http://wbp.synology.me/profileimg/${myinfo.m_image }" class="img-responsive" style="height: 100%; width: 100%">
									</c:otherwise>
								</c:choose>
                        </div>
                        <ul class="categories mt-20 tabs-framed">
                            <li><a href="#tab-1" data-toggle="tab">내 계정 정보</a></li>
                            <li><a href="#tab-4" data-toggle="tab">비밀번호 변경</a></li>
                            <li><a href="#tab-2" data-toggle="tab">내 기념일 관리</a></li>
                            <!-- <li><a href="#tab-3" data-toggle="tab">Wishlist</a></li> -->
                        </ul>
                    </div>
                    <div class="col-md-9">                     
                        <div class="tabs-framed">
                            <ul class="tabs clearfix">
                                <li class="active"><a href="#tab-1" data-toggle="tab">내 정보보기</a></li>
                                <li><a href="#tab-2" data-toggle="tab">내 기념일 관리</a></li>
                                <!-- <li><a href="#tab-3" data-toggle="tab">Whishlist</a></li> -->
                                <li><a href="#tab-4" data-toggle="tab">비밀번호 변경</a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="tab-1">
                                    <div class="tab-body">
                                    <dl class="dl-horizontal style-2">
                                            <h3 class="title title-lg">Personal information</h3>
                                            <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>
                                            
                                           <dt>Name</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_name}</span> 
                                    </dd>
                                    <hr>
                                    <dt>Email</dt>
                                    <dd>
                                    	
                                       <span class="pull-left">${myinfo.m_email}</span>
                                    </dd>
                                    <hr>
                                    <dt>BirthDay</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_bdate}</span>
                                    </dd>
                                    <hr>
                                    <dt>Introduce</dt>
                                    <dd>
                                       <span class="pull-left">${myinfo.m_introduce}</span>
                                    </dd>
                                    <hr>
                                    <dd>
                                       <a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right" data-toggle="modal" data-target="#updateInfo"><span>프로필 수정</span></a>                                       
                                    </dd>
                                 </dl>
                              </div>
                           </div>

                               <!-- ==========================================================내 이벤트 추가 수정탭=================================================================== -->

									<div class="tab-pane fade" id="tab-2">
										<div class="tab-body" style="padding-bottom: 0;">
											<h3 class="title title-lg">나의 이벤트</h3>
											<p class="mb-20">내 이벤트를 추가/수정하여 친구들에게 알려주세요!</p>

											<table
												class="table table-orders table-bordered table-striped table-responsive no-margin">
												<tbody>
													<tr>
														<th>이벤트 명</th>
														<th>날짜</th>
														<th><div  class="pull-right">수정 | 삭제</div></th>														
													</tr>
													<c:forEach var="anni" items="${showAnni}">
													<c:if test="${anni.a_mno == mno}">
													<tr>
														<td><a href="#">${anni.a_detail }</a></td>
														<td>${anni.a_date }</td>
														<td><div  class="pull-right"><a href="#" onclick="eventUpdate(${anni.a_no},'${anni.a_detail}','${anni.a_date}')"><i class="fa fa-pencil-square-o fa-2x " aria-hidden="true"></i></a>&nbsp;|&nbsp;<a href="javascript:eventDelete(${anni.a_no})"><i class="fa fa-trash-o fa-2x" aria-hidden="true"></i></a></div></td>														
													</tr>
													</c:if>
													</c:forEach>
													<%--<c:otherwise>
													<tr>
														<td colspan="3">등록하신 기념일이 없군요. 추가하기를 누르신후 추가해주세요!</td>
													</tr>
													</c:otherwise> --%>
													<tr>
														<td colspan="3">
															<a href="#" class="btn btn-xs btn-base btn-icon fa-edit pull-right" data-toggle="modal" data-target="#insertAnni"><span>기념일 추가</span></a>
														
														</td>
													</tr>
												</tbody>
											</table>
											<br>
											
										</div>
									</div>
                               <!-- ==========================================================내 이벤트 추가 수정탭 끝=================================================================== -->
                               
                               
                               <!-- ==========================================================비밀번호 변경 탭=================================================================== -->
									<div class="tab-pane fade" id="tab-4">
										<div class="tab-body" style="padding-bottom: 0;">
                                           <form action="javascript:passwdFunc()" method="post" id="passwdFrm">
											<dl class="dl-horizontal style-2">
                                            <h3 class="title title-lg">비밀번호 변경</h3>
                                            <p class="mb-20">비밀번호를 변경하실 때에는 현재 비밀번호를 입력하시고 아래에 새로운 비밀번호를 넣어주세요.</p>
                                            
                                           <dt>현재 비밀번호</dt>
		                                    <dd>
		                                    	<div class="col-md-4">
			                                       <input type="password" class="form-control col-md-6" id="oldPasswd" required> 
		                                    	</div>
		                                    </dd>
		                                    <hr>
		                                    <dt>새로운 비밀번호</dt>
		                                    <dd>
		                                       <div class="col-md-4">
			                                       <input type="password" class="form-control col-md-6" id="newPasswd" required> 
		                                    	</div>
		                                    </dd>
		                                    <br>
		                                    <dt>비밀번호 확인</dt>
		                                    <dd>
		                                       <div class="col-md-4">
			                                       <input type="password" class="form-control col-md-6" id="newPasswdCheck" name="m_password" required>
			                                       <input type="hidden" name="m_no" value="${myinfo.m_no}"> 
		                                    	</div>
		                                    </dd>
		                              		<hr>
		                              		<dd>
											<button class="btn btn-xs btn-base btn-icon fa-edit pull-right" type="submit"><span>수정 완료</span></button>
	                                    	</dd>
	                                    	<br>
		                                 </dl>
	                                    </form>
										
											
										</div>
									</div>                               
                               <!-- ==========================================================비밀번호 변경 탭 끝=================================================================== -->
                               
									
									
									

                                <!-- <div class="tab-pane fade" id="tab-3">
                                    <div class="tab-body">
                                        <h3 class="title title-lg">My wishlist</h3>
                                        <p class="mb-20">Lorem Ipsum is simply dummy text of the printing and typesetting industry</p>

                                        <div class="row">
                                            Product list
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            Product list
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            Product list
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-1.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Nikon Coolpix L320</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-2.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Samsung Galaxy S4</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-md-4">
                                                <div class="wp-block product">
                                                    <figure>
                                                        <img alt="" src="resources/images/prv/product-3.jpg" class="img-responsive img-center">
                                                    </figure>
                                                    <h2 class="product-title"><a href="">Asus Ultra Notebook</a></h2>
                                                    <p>
                                                    Lorem ipsum dolor sit amet consectetur adipisg elitm Ut tincidunt purus iaculis
                                                    </p>
                                                    <div class="wp-block-footer">
                                                        <span class="price pull-left">RON 233.33</span>
                                                        <a href="#" class="btn btn-sm btn-base btn-icon btn-cart pull-right">
                                                            <span>Add to cart</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div> -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
<div>
<%@ include file="footer.jsp" %>
</div>

<!-- Essentials -->
<script src="resources/js/modernizr.custom.js"></script>
<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="resources/js/jquery.easing.js"></script>
<script src="resources/js/jquery.metadata.js"></script>
<script src="resources/js/jquery.hoverup.js"></script>
<script src="resources/js/jquery.hoverdir.js"></script>
<script src="resources/js/jquery.stellar.js"></script>

<!-- Boomerang mobile nav - Optional  -->
<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.js"></script>
<script src="resources/assets/responsive-mobile-nav/js/jquery.dlmenu.autofill.js"></script>

<!-- Forms -->
<script src="resources/assets/ui-kit/js/jquery.powerful-placeholder.min.js"></script> 
<script src="resources/assets/ui-kit/js/cusel.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.form.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.validate.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.maskedinput.min.js"></script>
<script src="resources/assets/sky-forms/js/jquery.modal.js"></script>

<!-- Assets -->
<script src="resources/assets/hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
<script src="resources/assets/page-scroller/jquery.ui.totop.min.js"></script>
<script src="resources/assets/mixitup/jquery.mixitup.js"></script>
<script src="resources/assets/mixitup/jquery.mixitup.init.js"></script>
<script src="resources/assets/fancybox/jquery.fancybox.pack.js?v=2.1.5"></script>
<script src="resources/assets/waypoints/waypoints.min.js"></script>
<script src="resources/assets/milestone-counter/jquery.countTo.js"></script>
<script src="resources/assets/easy-pie-chart/js/jquery.easypiechart.js"></script>
<script src="resources/assets/social-buttons/js/rrssb.min.js"></script>
<script src="resources/assets/nouislider/js/jquery.nouislider.min.js"></script>
<script src="resources/assets/owl-carousel/owl.carousel.js"></script>
<script src="resources/assets/bootstrap/js/tooltip.js"></script>
<script src="resources/assets/bootstrap/js/popover.js"></script>

<!-- Sripts for individual pages, depending on what plug-ins are used -->

<!-- Boomerang App JS -->
<script src="resources/js/wp.app.js"></script>
<!--[if lt IE 9]>
    <script src="resources/js/html5shiv.js"></script>
    <script src="resources/js/respond.min.js"></script>
<![endif]-->

<!-- Temp -- You can remove this once you started to work on your project -->
<script src="resources/js/jquery.cookie.js"></script>
<script src="resources/js/wp.switcher.js"></script>
<script type="text/javascript" src="resources/js/wp.ga.js"></script>
<script>
/* 프로필 수정 이미지 미리보기 */
var upload = document.getElementById('file'),
 	image = document.getElementById('image');
upload.onchange = function (e) {
  e.preventDefault();
  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    image.src = event.target.result;
  };
  reader.readAsDataURL(file);
};
</script>

</body>
</html>