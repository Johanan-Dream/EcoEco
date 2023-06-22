<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.friendly.eco.util.DateManager"%>
<%@page import="com.friendly.eco.domain.Dcontents"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	Dcontents dcontents = (Dcontents)request.getAttribute("dcontents");
	long dDay=(long)request.getAttribute("dDay");
	int amount=dcontents.getDcontents_amount();
	//int mem_idx=dcontents.getMem().getMem_idx();
	
	
%>
<!DOCTYPE html>
<html lang="en">
<style>
#thumimg{
	width:500px;
	height:350px;
}
</style>
<head>
	<!-- header Start -->
	<%@ include file="../inc/header_link.jsp" %>
	<!-- header End -->
    
</head>

<body>
    <!-- Spinner Start -->
    <%@ include file="../inc/spinner.jsp" %>
    <!-- Spinner End -->


    <!-- Topbar Start -->
    <%@ include file="../inc/topbar.jsp" %>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <%@ include file="../inc/navbar.jsp" %>
    <!-- Navbar End -->


	<!-- Main Start -->
	<div class="container-xxl ">
        <div class="container">
        
            <div class="row g-5 align-items-end">
                <div class="col-lg-6">
                    <img class="img-fluid rounded" src="../resources/data/donation/<%=dcontents.getDcontents_thumimg()%>" id="thumimg">
                </div>
                <div class="col-lg-6 wow fadeIn" data-wow-delay="0.5s">
                    <p class="section-title bg-white text-start text-primary pe-3">Donation</p>
                    <h1 class="mb-4"><%=dcontents.getDcontents_title()%></h1>
                    <div class="row g-5 pt-2 mb-2">
                        <div class="col-sm-6">
                        	<h6 class="mb-3"><i class="fa fa-check text-primary me-3"></i>현재 금액</h6>
                        </div>
                        <div class="col-sm-6">
                            <h3>모집된 금액 출력 예정(달성률)</h3>
                            <span>(목표금액:<%=dcontents.getDcontents_amount()%>)</span>
                        </div>
                    </div>
                    <div class="row g-5 pt-2 mb-2">
                        <div class="col-sm-6">
                        	<h6 class="mb-3"><i class="fa fa-check text-primary me-3"></i>모금기간</h6>
                        </div>
                        <div class="col-sm-6">
                            <span><%=dcontents.getDcontents_startday()%> ~ <%=dcontents.getDcontents_endday()%>(<%=dDay%>일 남음)</span>
                        </div>
                    </div>
                    <div class="row g-5 pt-2 mb-2">
                        <div class="col-sm-6">
                        	<h6 class="mb-3"><i class="fa fa-check text-primary me-3"></i>모금단체</h6>
                        </div>
                        <div class="col-sm-6">
                            <span><%=dcontents.getDcontents_writer()%></span>
                        </div>
                    </div>
<%--                     <div class="row g-5 pt-2 mb-2">
                        <div class="col-sm-6">
                        	<h6 class="mb-3"><i class="fa fa-check text-primary me-3"></i>작성자</h6>
                        </div>
                        <div class="col-sm-6">
                            <span><%=dcontents.getDcontents_writer() %></span>
                        </div>
                    </div> --%>
                    <div align="center">
                    <button class="btn btn-secondary rounded-pill py-3 px-5" href="" id="bt_donate">기부하기</button>
                	</div>
                </div>
       		</div>

		<!--분리-->
		<p>
			<div class="col-lg-12" >
                  <div class="product__details__tab" id="tabs">
                      <ul class="nav nav-tabs" role="tablist" style="background:white;">
                          <li class="nav-item">
                              <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">기부안내</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">기부내역</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">기부후기</a>
                          </li>
                      </ul>
                      
                      <div class="tab-content">
                          <div class="tab-pane active" id="tabs-1" role="tabpanel">
                          	<p>
                              <h6>기부안내</h6>
                              <p><%=dcontents.getDcontents_detail()%></p>
                          </div>
                          
                          <div class="tab-pane" id="tabs-2" role="tabpanel">
                              <p>
                              <h6>기부내역</h6>
                              <p></p>
                          </div>
                          
                          <div class="tab-pane" id="tabs-3" role="tabpanel">
                              <p>
                              <h6>기부후기</h6>
                              <p></p>
                          </div>
                      </div>
                  </div>
              </div>
		</div>
    </div>
	<!-- Main End -->


    <!-- Footer Start -->
    <%@ include file="../inc/footer.jsp" %>
    <!-- Footer End -->


    <!-- Copyright Start -->
    <%@ include file="../inc/capyright.jsp" %>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <%@ include file="../inc/back_to_top.jsp" %>

	<!-- Footer link Start -->
    <%@ include file="../inc/footer_link.jsp" %>
	<!-- Footer link Start -->
<!-- Latest compiled and minified CSS -->

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


function donate(){
	//결제페이지 띄우기
	var popup = window.open('', '결제창', 'width=600px,height=600px,scrollbars=yes');
	
	
	//남은금액 안에서 

	//예치금(가라로 등록)
	
	//포인트(가라로 등록)
	
	//총금액 
	
	
	
}




$(function(){
	
	//등록 이벤트 연결 
	$("#bt_donate").click(function(){
		donate();
	});
	
	$("#tabs").tabs();
	

	
});

</script>
</body>



</html>