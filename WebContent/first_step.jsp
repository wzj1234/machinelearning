<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--  <script type="text/javascript" src="js/jquery.js"></script> -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<title>biodata</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function ajaxFileUpload()
    {
		$('#myModal').modal({backdrop: 'static', keyboard: false});
		$.ajaxFileUpload
        (
            {
                url:'fileUploadAction.action',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
                    //alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量
                    window.location.href="tmp.jsp";
                    if(typeof(data.error) != 'undefined')
                    {
                        if(data.error != '')
                        {
                            alert(data.error);
                        }else
                        {
                            alert(data.message);
                            
                        }
                    }
                },
                error: function (data, status, e)//服务器响应失败处理函数
                {
                    alert(e);
                },
                complete:function() {
            		$('#closeButton').click();
            	}
            }
        )
        return false;
    }

	function changevalue(){
		var path=document.getElementById("file").value;
		path=path.substring(path.lastIndexOf("\\")+1,path.length);
		document.getElementById("upfile").value=path;
	}

</script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<h3 class="text-center">
				使用机器学习对生物数据进行预测的绝佳工具！
		</h3>
		<div class="col-md-12 column">
			<img alt="140x140" src="img/machine.jpg" class="img-thumbnail" />
		</div>
		
		
		<div class="col-md-6 column">
			  <label for="exampleInputPassword1">选择数据文件</label>
			<div class="form-group">
			    <div class="input-group">
			        <input name="upfile" id="upfile" type="text" class="form-control">
			        <span id="scan" style="position: relative"  onclick="file.click()" class="btn btn-primary input-group-addon">浏览</span>
			        <input type="file" id="file" name="file" style="display:none" onchange="changevalue()">
			    </div>
			</div>
			
		
			<button type="button" class="btn btn-default btn-block btn-success" onclick="ajaxFileUpload()">导入数据</button>
			<!-- 模态框 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
			                <h4 class="modal-title" id="myModalLabel">当前状态</h4>
			            </div>
						<div class="modal-body">
							文件正在上传中，请稍候...
						</div>
			                <button id="closeButton" type="button" class="btn btn-info" data-dismiss="modal"  style="display:none">关闭</button>
					</div><!-- /.modal-content -->
				</div><!-- /.dialog -->
			</div><!-- modal -->
		</div>
		<div class="col-md-6 column">
		</div>
	</div>
</div>

</body>

</html>