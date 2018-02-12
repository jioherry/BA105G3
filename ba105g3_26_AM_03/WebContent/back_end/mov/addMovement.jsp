<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.movement.model.*"%>
<!DOCTYPE html>
<%
	MovementVO movementVO = (MovementVO) request.getAttribute("movementVO");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<style type="text/css">
	
</style>
</head>
<body>
<!-- navbar用include的 -->
<jsp:include page="/back_end/back_index.jsp" />
<!-- container -->
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-12">
			<div class="page-header">
				<h1>新增動作</h1>
			</div>
		</div>
	</div>

	<div class="row" id="up">
		<div class="textsize">
			<form method="post" action="mov.do" enctype="multipart/form-data" class="form-horizontal">
				<input type="hidden" name="action" value="insert">
				<table class="table table-hover">
					<thead>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">動作類別：</label>
								<div class="col-sm-9">
									<input type="text" name="mov_cat_id" size="50" value="<%=(movementVO==null)? "1000000001" : movementVO.getMov_cat_id()%>" class="from-control"/>
								</div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">動作名稱：</label>
								<div class="col-sm-9">
									<input type="text" name="mov_name" size="50" value="<%=(movementVO==null)? "" : movementVO.getMov_name()%>" class="form-control" id="myname"/>
								</div>
							</td>　
						</tr>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">動作簡介：</label>
								<div class="col-sm-9">
									<textarea name="mov_info" rows="4" cols="50" placeholder="<%=(movementVO==null)? "" : movementVO.getMov_name()%>" class="from-control" id="infoe"></textarea>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">動作圖片：</label>
								<div class="col-sm-9">
									<input type="file" class="touch" name="mov_img" size="50" value="<%=(movementVO==null)? "" : movementVO.getMov_img()%>"/>
									<img class="preview" src="<%=request.getContextPath()%>/DBimgReader_Mov.do?mov_id=${ movementVO.mov_id }" id="o1">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">動作等級：</label>
								<div class="col-sm-9">
									<input type="text" name="mov_level" size="50" value="<%=(movementVO==null)? "easy" : movementVO.getMov_level()%>" class="form-control"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">時間長度：</label>
								<div class="col-sm-9">
									<input type="text" name="mov_time_length" size="50" value="<%=(movementVO==null)? 10 : movementVO.getMov_time_length()%>" class="form-control"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<label for="aa" class="col-sm-3 control-label">動作影音：</label>
								<div class="col-sm-9">
									<input type="file" class="touchvideo" name="mov_video" size="50" value="<%=(movementVO==null)? "" : movementVO.getMov_video()%>"/>
									<video class="preview_video" width="300" height="300" id="mov_video" controls loop>
										<source type="video/mp4" src="<%=request.getContextPath()%>/DBvideoReader.do?mov_id=${ movementVO.mov_id }" id="o2">
									</video>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding-top: 20px;">
								<div class="col-sm-3 control-label">
									<input class="btn btn-success" type="submit" value="完成">
								</div>
								<div class="col-sm-3 control-label">
									<button class="btn btn-info" type="button" id="magicBtn1" onclick="myFunction()"></button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</form>

		</div>
	</div>

</div>
<script type="text/javascript">
// 圖片預覽 開始 ---------------------------------------------------------------
$(document).ready( function() {
	$(".touch").change( function() {
		// 用 jQuery 選擇該 input 由哪一個觸發，再去選擇他的兄弟元素
		var previewplace = $(this).siblings().attr('id');
		preview(this, previewplace); // 呼叫 preview function，帶入參數
	});

//		$(".touch").change(function() {
//			$(this).next().attr("src", $(this).val()); // jquery簡短寫法，只適用IE瀏覽
//		});

	/* 預覽圖 input 輸入 input[type=file] 的 this */
	function preview(input, previewplace) {
		// 若有選取檔案
		if (input.files && input.files[0]) {
			// 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
			var reader = new FileReader();
			// 事先定義好，當讀取成功後會觸發的事情
			reader.onload = function (e) {
				console.log(e);
	            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
	            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
	            // 我們用它當作圖片路徑就對了。
				//input.attr('src', e.target.result);
	            var showphoto = '#'+ previewplace; // '#'+ previewplace -> '#o1'(id="o1")
	            $(showphoto).attr('src', e.target.result); // 將圖片位址塞入 src 內
			}
			// 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
			reader.readAsDataURL(input.files[0]);
		}
	}
});
// 圖片預覽 結束 ---------------------------------------------------------------

// 影片預覽 開始 ---------------------------------------------------------------
$(document).ready( function() {
	$(".touchvideo").change( function() {
		// 用 jQuery 選擇該 input 由哪一個觸發，再去選擇他的兄弟元素
		var previewplace = $(this).siblings().attr('id');
		preview(this, previewplace); // 呼叫 preview function，帶入參數
	});

//		$(".touch").change(function() {
//			$(this).next().attr("src", $(this).val()); // jquery簡短寫法，只適用IE瀏覽
//		});

	/* 預覽圖 input 輸入 input[type=file] 的 this */
	function preview(input, previewplace) {
		// 若有選取檔案
		if (input.files && input.files[0]) {
			// 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
			var reader = new FileReader();
			// 事先定義好，當讀取成功後會觸發的事情
			reader.onload = function (e) {
				console.log(e);
	            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
	            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
	            // 我們用它當作圖片路徑就對了。
				//input.attr('src', e.target.result);
	            var showphoto = '#'+ previewplace; // '#'+ previewplace -> '#o1'(id="o1")
	            $(showphoto).attr('src', e.target.result); // 將圖片位址塞入 src 內
			}
			// 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
			reader.readAsDataURL(input.files[0]);
		}
	}
});
// 影片預覽 結束 ---------------------------------------------------------------

function myFunction() {
	document.getElementById("myname").value = "深蹲體操";
    document.getElementById("infoe").value = "我是新來的健身動作喔";
}
</script>
</body>
</html>
