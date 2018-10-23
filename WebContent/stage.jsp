<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>biodata</title>
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
		*{
			margin: 0 auto;
			font-size: 15px;
		}
		li{
			list-style-type: none;
			float: left;
		}
		.top{
			height:80px;
			background: #D0C7BA;
		}
		.logo{
			float: left;
			margin-top: 10px;
			margin-left: 50px;
			margin-right: 80px;
		}
		.logo img{
			width: 60px;
			height: 60px;
			margin-right: 20px;
		}
		.nvg{
			float: left;

		}
		.nvg li{
			width: 130px;
			height: 60px;
			line-height: 60px;
			text-align: center;
		}
		.container{
			margin-top: 30px;
			text-align:center;
		}
		.main{
			overflow: hidden;
			width: 1000px;
			overflow-x: auto;
		}
		.step_box{
			background:#f1f7e4;
			height:55px;
			overflow:hidden;
			border-top:1px solid #FFF;
			float:;
		}
		.step_item{
			float:left;
			height:55px;
			line-height:55px;
			padding:0 25px 0 45px;
			cursor:pointer;
			position:relative;
			font-size:14px;
			font-weight:bold;
		}
		.step_num{
			width:19px;
			height:19px;
			line-height:19px;
			position:absolute;
			text-align:center;
			top:18px;left:20px;
			font-size:16px;
			font-weight:bold;
			background:url(img/num.png);
			color:#156600;
		}
		.step_set{
			background:#27a806;
			color:#FFF;
		}
		.step_set .step_left{
			width:8px;
			height:55px;
			background:url(img/bak.jpg) left top no-repeat;
			position:absolute;
			left:0;
			top:0;}
		.step_set .step_right{
			width:8px;
			height:55px;
			background:url(img/bak.jpg) left bottom no-repeat; 
			position:absolute;
			right:-8px;top:0;
		}

		.choose{
			width: 550px;
			padding-top: 45px;
		}
		.choose button{
			width:100px;
			height: 40px;
			margin: 20px 0;
		}
		.btn.upbtn{
			margin-right: 50px;
		}
		.txtcent{
			text-align: center;
		}
		.upfilewrap{
			width:400px;
			float: right;
		}
		.mt30{
			margin-top: 60px;
		}
		.fot_wrap {
		    width: 100%;
		    height: 100px;
		    background: #d0c5ba;
		    margin: 0 auto 0;
		    position:fixed;
		    bottom:0;
		    overflow: hidden;
		    text-align:center;
		}
		.footer {
		    width: 1000px;
		    height: 76px;
		    padding: 12px 0;
		    overflow: hidden;
		    margin: 0 auto;
		}
	</style>
</head>
<body style="height:100%;">
	<div class="top">
		<div class="logo">
			<img src="img/logo.png">
			<span>Biomedic</span>
		</div>
		<!-- <ul class="nvg">
			<li>nvg1</li>
			<li>nvg2</li>
			<li>nvg3</li>
			<li>nvg4</li>
		</ul> -->
	</div>

	<div class="container">
		<div class="step_box fa">
			<div id="fa_1" class="step_item">
		    	<div class="step_num">1</div>
					第一步
		    	<div class="step_right"></div>
		    </div>
		    <div id="fa_2" class="step_item">
		    	<div class="step_left"></div>
		    	<div class="step_num">2</div>
		     		 第二步
		      	<div class="step_right"></div>
		    </div>
		    <div id="fa_3" class="step_item step_set">
		      	<div class="step_left"></div>
		      	<div class="step_num">3</div>
		      		第三步
		      	<div class="step_right"></div>
		    </div>
		    <div id="fa_4" class="step_item">
		      	<div class="step_left"></div>
		      	<div class="step_num">4</div>
		     		第四步
		      	<div class="step_right"></div>
		    </div>
		</div>
		<div class="jumbotron">
			<p style="font-size:13px">
				此处导入特征文件，总共有两列，第一列为样本名，第二列为标签，如（Stage I、Stage II）。
			</p>
		</div>
		<div class="main">
			<h3 class="text-center ">
				第三步：选择数据
			</h3>
			<div class="">
				<div class="choose">
					<div class="form-group">
						<label for="upfile">选择数据文件：</label>
					    <div class="input-group upfilewrap">
					        <input name="upfile" id="upfile" type="text" class="form-control">
					        <span id="scan" style="position: relative"  onclick="file.click()" class="btn btn-primary input-group-addon">浏览</span>
					        <input type="file" id="file" name="file" style="display:none" onchange="changevalue()">
					    </div>
					</div>
			
					<div class="txtcent mt30">
						<button id="upbtn" class="btn btn-success upbtn" onclick="ajaxFileUpload()">导入数据</button>
						<button id="next" class="btn nextbtn" disabled="true" onclick="next_click()">选择模型</button>
					</div>
				</div>
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
		</div>
	</div>

	<!-- /#wrapper -->
	<div class="fot_wrap">
		<div class="footer"> 
			Designed By 桑浩凯 &copy; 2016 - 2017 All Right Reserved. 
		</div>
	</div>
   <!-- jQuery -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- 上传文件界面需要导入的 -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
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
                url:'stagefileUploadAction.action',//用于文件上传的服务器端请求地址
                secureuri:false,//一般设置为false
                fileElementId:'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
                dataType: 'json',//返回值类型 一般设置为json
                success: function (data, status)  //服务器成功响应处理函数
                {
                    //alert(data.message);//从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量
                    document.getElementById("next").disabled=false;
                    $('#closeButton').click();
                    document.getElementById("upbtn").disabled=true;
                    //window.location.href="mlselect.jsp";
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
                	$('#closeButton').click();
                    alert(e);
                }
            }
        )
        return false;
    }

	function next_click(){
		window.location.href="mlselect.jsp";
	}
	
	function changevalue(){
		var path=document.getElementById("file").value;
		path=path.substring(path.lastIndexOf("\\")+1,path.length);
		document.getElementById("upfile").value=path;
	}

</script>
</body>
</html>