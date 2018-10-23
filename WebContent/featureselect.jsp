<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Select features</title>
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
		.btn-success {
		    color: #fff;
		    background-color: #5cb85c;
		    border-color: #4cae4c;
		}
		.btn {
		    display: inline-block;
		    padding: 6px 12px;
		    margin-bottom: 0;
		    font-size: 14px;
		    font-weight: 400;
		    line-height: 1.42857143;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    -ms-touch-action: manipulation;
		    touch-action: manipulation;
		    cursor: pointer;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    background-image: none;
		    border: 1px solid transparent;
		    border-radius: 4px;
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
		.container_buttons {
	    width: 600px;
	    margin: 0 auto;
	    background: #f5f5f5;
	    padding: 60px 60px 30px;
	    border-radius: 20px;
	    box-shadow: 1px 1px 1px rgba(0,0,0,0.09) inset;
		}
	</style>
</head>
<body style="height:100%;">
	<div class="top">
		<div class="logo">
			<img src="img/logo.png">
			<span>Biomedic</span>
		</div>
		<%-- <ul class="nvg">
			<li>nvg1</li>
			<li>nvg2</li>
			<li>nvg3</li>
			<li>nvg4</li>
		</ul>
		<s:debug></s:debug> --%>
	</div>
	<div class="container">
		<div class="step_box fa">
			<div id="fa_1" class="step_item">
		    	<div class="step_num">1</div>
					第一步
		    	<div class="step_right"></div>
		    </div>
		    <div id="fa_2" class="step_item step_set">
		    	<div class="step_left"></div>
		    	<div class="step_num">2</div>
		     		 第二步
		      	<div class="step_right"></div>
		    </div>
		    <div id="fa_3" class="step_item">
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
		<div class="main">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-6 column">
						<div class="row clearfix">
							
						</div>
					</div>
					<div class="col-md-6 column">
						<!-- <div>
							 <label for="inputMin" class="col-sm-2 control-label">最小值</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputMin" />
							</div>
						</div>
						<br>
						<div>
							 <label for="inputMax" class="col-sm-2 control-label">最大值</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputMax" />
							</div>
						</div>
						<div>
							<div class="col-sm-offset-2 col-sm-10">
								 <button type="button" class="upbtn" onclick="selectByhreshold()">确定选择</button>
							</div>
						</div> -->
					</div>
				</div>
				<div class="container_buttons">
					<form action="getFeatureKey" method="post">
						<div class="submitKey" >
							<p align="left">
								<label for="map"></label>
							</p>
			  			   	<input id="submit" type="submit" value="确定特征"  class="btn btn-default btn-success" style="display:none"/>	
			  			</div>
						<div class="row clearfix">
							<div class="checkBoxClass">
								<table width="100%">
									<s:checkboxlist name="map" list="map" id="map" listValue="key"></s:checkboxlist>
								</table>
							</div>
						</div>
					</form>
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
			<button class="btn btn-success upbtn" onclick="selectAllRadio();">全选特征</button>
			<button class="btn btn-success upbtn" onclick="inverseRadio();">反选特征</button>
			<button class="btn btn-success upbtn" onclick="submit_click()">提交</button>
		</div>
	</div>

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function selectAllRadio() {  
    var radios = document.getElementsByName("map");  
      
    for (var i=0; i < radios.length; i++) {  
        var radio = radios[i];  
        radio.checked = true;  
    }             
}
function inverseRadio() {  
    var radios = document.getElementsByName("map");  
      
    for (var i=0; i < radios.length; i++) {  
        var radio = radios[i];  
          
        if(radio.checked) {  
            radio.checked = false;  
        }else {  
            radio.checked = true;  
        }  
    }  
} 
function selectByhreshold(){
	var radios = document.getElementsByName("map");
	var min = $("#inputMin").val();
	var max = $("#inputMax").val();
	<c:forEach items="${map}" var="item" varStatus="status">
	if(parseFloat("${item.value}")>min && parseFloat("${item.value}")<max){
		radios[parseInt("${status.count}")-1].checked = true; //"${status.count}"是取c:forEach的下标，c:forEach的下标从1开始的，所以下标在数组中为c:forEach的下标的下标-1
    }
    else{
    	//alert("不在选择范围内的元素："+"${item.key}"+" : "+"${item.value}");
		radios[parseInt("${status.count}")-1].checked = false; //"${status.count}"是取c:forEach的下标，c:forEach的下标从1开始的，所以下标在数组中为c:forEach的下标的下标-1
    }
	</c:forEach>
}
function submit_click(){
	$('#myModal').modal({backdrop: 'static', keyboard: false});
	document.getElementById('submit').click();
}
</script>
</body>
</html>