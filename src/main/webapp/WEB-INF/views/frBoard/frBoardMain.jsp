<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user-header.jsp" %>

<div id="wrapper">
	<div class="notice-title">
		<h2 class="pageTitle pos-rel">
			<i class="fas fa-bullhorn"></i> 자유게시판		
		</h2>
		<div id="notice-write">
				<button type="button" class="btn" id="noWrite" onclick="location.href='/frBoard/frbWrite';">글 작성</button>
		</div>
	</div>
	<div class="notice-content">
		<table id="frBoardTb" class="table table-bordered">
			<thead>
				<tr class="tr-title">
					<th style="width:5%;">No</th>
					<th style="width:10%;">작성자</th>
					<th style="width:58%;">제목</th>
					<th style="width:7%;">조회수</th>
					<th style="width:20%;">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="frBoardVO" varStatus="status">
					<tr id="memStatus">
						<td>${status.count }</td>
						<td>${frBoardVO.frwriter }</td>
						<td>
							<span onclick="location.href='/frBoard/frBoardView?frno=${frBoardVO.frno }';" style="cursor:pointer;">
								<b>${frBoardVO.frtitle }</b>
							</span>
						</td>
						<td>${frBoardVO.frviewcnt }</td>
						<td>
							<fmt:formatDate value="${frBoardVO.regdate }" pattern="yyyy년 MM월 dd일 EE요일" />
						</td>						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>


<script>
	$(document).ready(function() {
		$("#frBoard").addClass("liActive");
	});
	
	$(function() {
		// 메뉴 선택 css
		var lang_kor = {
			"paginate" : {
				"first" : "첫 페이지",
				"last" : "마지막 페이지",
				"next" : ">",
				"previous" : "<"
			},
			"info" : "_START_ - _END_ (총 _TOTAL_ 개)",
			"infoEmpty" : "0개",
			"emptyTable" : "작성된 글이 없습니다.",
			"search" : "검색",
			"zeroRecords" : "검색결과가 없습니다.",
		}
		
		$("#frBoardTb").DataTable({
			"ordering" : false,
			"searching" : true,
			"lengthChange" : false,
			language : lang_kor
		});
	});
</script>
<%@ include file="/WEB-INF/views/layout/user-footer.jsp" %>