<%@page import="com.friendly.eco.domain.Dcontents"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%

	Dcontents dcontents=(Dcontents)request.getAttribute("dcontents");

%>
<head>
<%@include file="../inc/header_link.jsp"%>
</head>
<style>
#search_icon {
	width: 20px;
	height: 20px;
}

#thumimg {
	width: 50px;
	height: 50px;
}
</style>
<body>
	<div class="wrapper">
		<%@include file="../inc/navbar_final.jsp"%>

		<div class="main">
			<!-- navbar Start -->
			<%@include file="../inc/navbar.jsp"%>
			<!-- navbar End -->

			<!-- main Start -->
			<main class="content">
			<section class="content" id="app1">
				<div class="container-fluid">
		
					<!-- Main row -->
					
						<div class="col">
							<h5 class="card-title mb-0">기부글 상세내용</h5>
							<input type="hidden" class="form-control" name="dcontents_idx" placeholder="제목을 입력하세요" value="<%=dcontents.getDcontents_idx()%>">
							
							<!--제목-->	
							<div class="form-group row">
								<div class="col">
									<label class="col-sm-2 col-form-label">제목</label>
									<input type="text" class="form-control" name="dcontents_title" placeholder="제목을 입력하세요" value="<%=dcontents.getDcontents_title()%>">
								</div>
							</div>		
							
							<!--작성자 : 나중에는 불러와서 자동 채우기-->
							<div class="form-group row">
								<div class="col">
									<label class="col-sm-2 col-form-label">작성자</label>
									<input type="text" class="form-control" name="dcontents_writer" placeholder="작성자 자동 세팅 예정">
								</div>
							</div>	
																
						<!--썸네일 이미지-->			
							<div class="form-group row">
								<div class="col">
									<label class="col-sm-2 col-form-label">썸네일 이미지</label>
									<input type="file" class="form-control" id="dcontents_file" name="dcontents_file" >
								</div>
							</div>
							
							<div class="form-group row">
								<div class="col">
									<label class="col-sm-2 col-form-label">미리보기</label>
									<div class="box-style" id="style-box">
										<img id="dcontents_thumimg" name="dcontents_thumimg" src="/resources/data/donation/<%=dcontents.getDcontents_thumimg()%>"/>
									</div>
								</div>
							</div>
																						
						<!--모집금액-->					
							<div class="form-group row">
								<div class="col">
									<label class="col-sm-2 col-form-label">모집금액</label>
									<input type="number" class="form-control" name="dcontents_amount" placeholder="ex) 100000" value="<%=dcontents.getDcontents_amount()%>">
								</div>
							</div>					
							<p></p>													
							<div class="form-group row">
								<div class="col input-group date">
									<label class="col-sm-2 col-form-label">시작일</label>
									<input type="text" class="form-control" name="dcontents_startday" id="dcontents_startday" style=width:550px placeholder="ex) 20230327" value="<%=dcontents.getDcontents_startday()%>">
								</div>
								<p></p>	
								<div class="col input-group date">
									<label class="col-sm-2 col-form-label">종료일</label>
									<input type="text" class="form-control" name="dcontents_endday" id="dcontents_endday" style=width:550px placeholder="ex) 20230427" value="<%=dcontents.getDcontents_endday()%>">
								</div>
							</div>	
							<p></p>						
							<!--상세내용-->
							<!--써머노트 적용하기-->
							<div class="form-group row">
								<div class="col">
									<label class="col-sm-3 col-form-label">소개글</label>
									<textarea id="summernote" name="dcontents_detail" id="dcontents_detail">
									<%=dcontents.getDcontents_detail()%>
									</textarea>
								</div>
							</div>
																						
							<div class="form-group row">
							
								<div class="col" align="left">
									<button type="button" class="btn btn-primary" id="bt_dpostscript">기부후기</button>
									<button type="button" class="btn btn-primary" id="bt_duse">기부내역</button>
								</div>
								
								<div class="col" align="right">
													
									<button type="button" class="btn btn-primary" id="bt_edit">수정</button>
																	
									<button type="button" class="btn btn-primary" id="bt_list">목록</button>								
								</div>
							</div>							
							
						</div>
					</div>
					<!-- /.row (main row) -->
				</div>
				
				<!-- /.container-fluid -->
			
			</section>
			<!-- /.content -->
		</div>
			<!-- main End -->

			<!-- footer Start -->
			<%@include file="../inc/footer.jsp"%>
			<!-- footer End -->
		</div>
	</div>

	<!-- footer_link Start -->
	<%@include file="../inc/footer_link.jsp"%>
	<!-- footer_link End -->
	<script type="text/javascript" src="/resources/js/Pager.js"></script>
	<script type="text/javascript">

	let pager = new Pager(); //인스턴스 생성
	pager.pageSize=20;
	let currentPage=1;//현재 보고 있는 페이지
	let app1;
	let key=0;


	const dcontents={
		template:`
	        <tr>
				<td>
				<input type="checkbox">
				</td>
	            <td>{{n}}</td>
	            <td>
	            <img  :src="'/resources/data/donation/'+json.dcontents_thumimg" id="thumimg">
	            </td>
	            <td v-on:click="getDetail(json.dcontents_idx)">{{json.dcontents_title}}</td>
	            <td>{{json.dcontents_writer}}</td>
	            <td>{{(json.dcontents_date).substring(0, 10)}}</td>
	            <td>{{json.dcontents_startday}}</td>
	            <td>{{json.dcontents_app}}</td>
	    	</tr>
		`,
		props:["obj", "num"], //props 오직 외부에서 전달되는 데이터 받기 위함
		data(){ //자바로 비유하면 인스턴스 변수영역 
			return{
				json:this.obj,
				n:this.num
			};
		},
		methods:{
			getDetail(idx){
				location.href="/donation/detail?dcontents_idx="+idx
				//수정해야함
			}
		}
	};
	app1=new Vue({
		el:"#app1",
		components:{
			dcontents
		},
		data:{
			count:5,
			dcontentsList:[], //전체배열
			currentList:[], //페이지당 보여질 배열
			num:0//페이지당 시작 번호를 뷰 컴포넌트에서 접근할 수 있도록...
		}
	});
	function pageLink(n){//원하는 페이지만 넘겨받기
		//서버에서 가져온 데이터를 대상으로 페이징 로직을 적용해보기
		pager.init(app1.dcontentsList, n);
		
		app1.num=pager.num;
		//넘겨받은 페이지 번호를 이용하여, 해당 페이지에 보여질 배열을 생성
		//currentList에 대입 (Vue의 변수인 currentList만 제어하면 디자인은 자동으로 변경)
		
		app1.currentList.splice(0, app1.currentList.length);//싹 비우고
		
		//채워넣기
		for(let i=pager.curPos; i<pager.curPos+pager.pageSize;i++){	
			//num이 1보다 작아지면 멈춤
			if(pager.num<1) break;
			pager.num--;
			
			//전체 배열에서, 일부 배열로 옮겨심기
			app1.currentList.push(app1.dcontentsList[i]);
			console.log("currentList는", app1.currentList);
		}
	}
	//서버에서 상품목록 가져오기
	function getList(){
		$.ajax({
			url:"/rest/appList",
			type:"get",
			success:function(result, status, xhr){
				//서버에서 가져온 json배열을 뷰의 템블릿이 바라보고 있는 productList에 대입하면 
				//디자인은 알아서 변경된다.(개발자는 데이터 제어에만 집중하면 된다, 디자인 신경 X)
				app1.dcontentsList=result;
				console.log(result);
				
				//pageLink(현재페이지); //페이징 처리 계산 수행
				pageLink(currentPage); //페이징 처리 계산 수행
				//프로그램 가동하자마자 현재 페이지는 ? currentPage
						
				//넘버링 출력(1~10, 11~20)
				
				for(let i=pager.firstPage;i<pager.lastPage;i++){
					if(i>pager.totalPage) break;//내가 가진 페이지수를 넘어서면 반복문 빠져나오기
					$("#paging-area").append("<a href='javascript:pageLink("+i+")' style='margin:3px'>"+i+"</a>")
				}
			}
		});
	}
	$(function(){
		getList();
		
		//삭제 이벤트 연결 
		$("#bt_delete").click(function(){
			location.href="/donation/registForm";
		});
		
		//승인 이벤트
		$("#bt_registApp").click(function(){
			location.href="/donation/registForm";
		});
		
		//승인 취소 
		$("#bt_cancleApp").click(function(){
			location.href="/donation/registForm";
		});
		
		
	});
	</script>
</body>


</html>