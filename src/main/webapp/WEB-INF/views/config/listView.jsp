<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user-header.jsp" %>

<div id="wrapper">
	<div class="notice-title">
		<h2 class="pageTitle pos-rel">
			<i class="fas fa-bullhorn"></i> 형상관리		
		</h2>
	</div>
	<div class="notice-content">
		<h5>Commit List</h5>
		<button type="button" class="btn btn-warning" id="commitSch" data-toggle="modal" data-target="#myModal">커밋관리</button>
		<div class="confContainer">
				
		</div>
		<div class="confFooter">
		</div>
	</div>
	
</div>
<!-- Modal window -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="z-index:1100;">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Git Commit Log</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body">
				<div style="display:block;">
					<label for="owner">관리자  :  </label>
					<input type="text" id="owner" class="form-control" style="display: initial;width: 70%;">
				</div>
				<div style="display:block; margin-top: 5px;">
					<label for="repos">저장소  :  </label>
					<input type="text" id="repos" class="form-control" style="display: initial;width: 70%;">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="CONF.gitCommitMsg(0);" data-dismiss="modal">확인</button>
				<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- git Calc Modal Window -->
<div class="modal fade" id="gitModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="z-index:1100;">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Git Commit Status</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
			</div>
			<div class="modal-body">
				<%@ include file="/WEB-INF/views/layout/calendar.jsp" %>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger pull-left" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$("#config").addClass("liActive");
	});
</script>
<%@ include file="/WEB-INF/views/layout/user-footer.jsp" %>