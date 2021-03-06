<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/user-header.jsp" %>
<style>
	.notice-content {
		border: 1px solid gray;
    	border-radius: 5px;
	}
	#form {
		margin : 0 auto;
		width: 90%;
		margin-top: 20px;
    	margin-bottom: 20px;
	}
</style>

<div id="wrapper">
	<div class="notice-title">
		<h2 class="pageTitle pos-rel">
			<i class="fas fa-bullhorn"></i> 공지하기
		</h2>
	</div>
	
	<div class="notice-content">
		<form name="form" id="form" role="form" method="post">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="reg_id">작성자</label> <input type="text" class="form-control" name="writer" id="writer" value="${WRITER}" readonly>
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="summernote"></textarea>
			</div>
			
			<div class="mb-3" id="DragForm" style="height:33px">
				<a href="javascript:void(0);" id="dfOpen" style="display:block;"><span></span></a>
				<a href="javasciprt:void(0);" id="dfClose" style="display: none;"><span></span></a>
			</div>
			
			<div class="mb-3" id="DragBox">
				<div id="fileUpload" style="width: 1020px;" class="dragAndDropDiv">Drag & Drop Files Here or Browse Files</div>
        		<input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/>
			</div>

			<button type="button" class="btn btn-sm btn-primary" id="wilWrite" onclick="FUCN.noticeWriter();">작성</button>
			<button type="button" class="btn btn-sm btn-warning" onclick="location.href='/hkGroup/board';">목록</button>
		</form>
	</div>
</div>


<script>
	$('#summernote').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
	
	$(function() {
		// 메뉴 선택 css
		$("#notice").addClass("liActive");
		$("#DragBox").hide();
		
		$("#dfOpen").click(function(){
			$("#DragBox").show();
			$("#dfOpen").css("display", "none");
			$("#dfClose").css("display", "block");
		});
		
		$("#dfClose").click(function(){
			$("#DragBox").hide();
			$("#dfClose").css("display", "none");
			$("#dfOpen").css("display", "block");
		});
	});
	
	 $(document).ready(function(){
         var objDragAndDrop = $(".dragAndDropDiv");
         
         $(document).on("dragenter",".dragAndDropDiv",function(e){
             e.stopPropagation();
             e.preventDefault();
             $(this).css('border', '2px solid #0B85A1');
         });
         $(document).on("dragover",".dragAndDropDiv",function(e){
             e.stopPropagation();
             e.preventDefault();
         });
         $(document).on("drop",".dragAndDropDiv",function(e){
             
             $(this).css('border', '2px dotted #0B85A1');
             e.preventDefault();
             var files = e.originalEvent.dataTransfer.files;
         
             handleFileUpload(files,objDragAndDrop);
         });
         
         $(document).on('dragenter', function (e){
             e.stopPropagation();
             e.preventDefault();
         });
         $(document).on('dragover', function (e){
           e.stopPropagation();
           e.preventDefault();
           objDragAndDrop.css('border', '2px dotted #0B85A1');
         });
         $(document).on('drop', function (e){
             e.stopPropagation();
             e.preventDefault();
         });

         $('input[type=file]').on('change', function(e) {
             var files = e.originalEvent.target.files;
             handleFileUpload(files,objDragAndDrop);
         });
         
         function handleFileUpload(files,obj)
         {
        	$("#wilWrite").attr("disabled", true);
            for (var i = 0; i < files.length; i++) 
            {
                 var fd = new FormData();
                 fd.append('file', files[i]);
          
                 var status = new createStatusbar(obj); //Using this we can set progress.
                 status.setFileNameSize(files[i].name,files[i].size);
                 sendFileToServer(fd,status);
          
            }
         }
         
         var rowCount=0;
         function createStatusbar(obj){
             rowCount++;
             var row="odd";
             if(rowCount %2 ==0) row ="even";
             this.statusbar = $("<div class='statusbar "+row+"'></div>");
             this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
             this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
             this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
             this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
             this.delFile = $("<div class='abort'>삭제</div>").appendTo(this.statusbar);
             
             obj.after(this.statusbar);
             
             this.setFileNameSize = function(name,size){
                 var sizeStr="";
                 var sizeKB = size/1024;
                 if(parseInt(sizeKB) > 1024){
                     var sizeMB = sizeKB/1024;
                     sizeStr = sizeMB.toFixed(2)+" MB";
                 }else{
                     sizeStr = sizeKB.toFixed(2)+" KB";
                 }
          
                 this.filename.html(name);
                 this.size.html(sizeStr);
             }
             
             this.setProgress = function(progress){       
                 var progressBarWidth =progress*this.progressBar.width()/ 100;  
                 this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
                 if(parseInt(progress) >= 100)
                 {
                     this.abort.hide();
                 }
             }
             
             this.setAbort = function(jqxhr){
                 var sb = this.statusbar;
                 var fn = this.filename;
                 this.abort.click(function()
                 {
                     jqxhr.abort();
                     sb.hide();
                 });
                 
                 this.delFile.click(function(){
                	 console.log(fn.text());
                	 // 파일명 가져오기
                	 var orgFileName = fn.text();
                	 var data = {
                			 ORGFN : orgFileName,
                	 }
                	 
                	 $.ajax({
                		url : '/hkGroup/fsDel',
                		type : 'post',
                		dataType : 'json',
                		data: data,
                		success: function(rs){
                			 jqxhr.abort();
                        	 sb.hide();
                		}
                	 });
                 });
             }
         }
         
         function sendFileToServer(formData,status)
         {
             var uploadURL = "/fileUpload/post"; //Upload URL
             var extraData ={}; //Extra Data.
             var jqXHR=$.ajax({
                     xhr: function() {
                     var xhrobj = $.ajaxSettings.xhr();
                     if (xhrobj.upload) {
                             xhrobj.upload.addEventListener('progress', function(event) {
                                 var percent = 0;
                                 var position = event.loaded || event.position;
                                 var total = event.total;
                                 if (event.lengthComputable) {
                                     percent = Math.ceil(position / total * 100);
                                 }
                                 //Set progress
                                 status.setProgress(percent);
                             }, false);
                         }
                     return xhrobj;
                 },
                 url: uploadURL,
                 type: "POST",
                 contentType:false,
                 processData: false,
                 cache: false,
                 data: formData,
                 success: function(sc){
                	 
                     status.setProgress(100);
                     
          			 $("#wilWrite").attr("disabled", false);
                     //$("#status1").append("File upload Done<br>");           
                 }
             }); 
          
             status.setAbort(jqXHR);
         }
         
         function dragBoxShow(){
        	 DragBox.show();
         }
     });

</script>
<%@ include file="/WEB-INF/views/layout/user-footer.jsp" %>