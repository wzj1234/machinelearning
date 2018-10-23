<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	body {
	    margin: 0;
	}
	.btn{
	    background-color: #4CAF50; /* Green */
	    border: none;
	    color: white;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    border-radius: 5%;
	}
	.clearfix {
	    clear: both;
	}
	nav {
	    font-family: Helvetica;
	    text-align: right;
	    text-transform: uppercase;  
	    background-color: #222;
	}
	nav ul {
	    width: 90%;
	    max-width: fit-content;
	    margin: 0 auto;
	    list-style-type: none;
	}
	
	nav ul li {
	    display: inline-block;
	}
	
	nav ul li a {
	    color: #9d9d9d;
	    font-weight: bold;
	    text-decoration: none;
	    display: inline-block;
	    padding: 1em;
	    box-sizing: border-box;
	}
	
	nav ul li a:hover {
	    color: white;
	}
	
	.current_page {
	    background-color: black;
	}
	
	.current_page a {
	    color: white;
	}
	
	#menu_button_wrapper{
	    display: none;
	}
	
	.hidden {
	    display: none;
	}
	
	/* Responsive for smaller screens */
	
	@media (max-width: 760px) {
	    #menu_button_wrapper{
	        display: block;
	        padding: 1em;
	        color: #9d9d9d;
	        border-bottom: 1px solid #101010;
	        -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.1);
	        box-shadow: 0 1px 0 rgba(255,255,255,.1);
	        margin-bottom: .5em;
	    }
	    
	    #menu_button {
	        box-sizing: border-box;
	        float: right;
	        padding: .5em 1em;
	        border: 1px solid #333;
	        border-radius: 5px;
	        color: white;
	        -webkit-touch-callout: none;
	        -webkit-user-select: none;
	        -khtml-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	    }
	    
	    #menu_button:hover {
	        cursor: pointer;
	        background-color: #333;
	    }
	    
	    #hamburger {
	        float: right;
	        padding-top: .15em;
	    }
	    
	    #menu_button span{
	        display: block;
	        background-color: #fff;
	        width: 1.2em;
	        height: .15em;
	        border-radius: 1px;
	        margin-bottom: .2em;
	    }
	    
	    nav ul {
	        width: 100%;
	        margin: 0 auto;
	        padding: 0;
	        box-sizing: border-box;
	    }
	
	    nav ul li {
	        display: block;
	    }
	    
	    nav ul li a {
	        width: 100%;
	    }
	}
	.container_buttons {
	    width: 700px;
	    margin: 0 auto;
	    background: #f5f5f5;
	    padding: 60px 60px 30px;
	    border-radius: 20px;
	    box-shadow: 1px 1px 1px rgba(0,0,0,0.09) inset;
	}
	/*by wzj start*/

	.title--label{ margin-left:50px;color:gray;width:55px;height:24px;}
	.label{margin:20px 20px 0 0;display:inline-block;color:black}
	.radio{display:none}
	.radioInput{background-color:#fff;border:1px solid rgba(0,0,0,0.15);border-radius:100%;display:inline-block;height:16px;margin-right:10px;margin-top:-1px;vertical-align:middle;width:16px;line-height:1}
	.radio:checked  + .radioInput:after{background-color:#57ad68;border-radius:100%;content:"";display:inline-block;height:12px;margin:2px;width:12px}
	.checkbox.radioInput,.radio:checked + .checkbox.radioInput:after{border-radius:0}
	 /*by wzj end*/
</style>
</head>
<body style="height:100%">
	<div style="display:block">
		<nav>
			<ul id="menu_list">
				<li><a href="index.jsp">返回首页</a></li>
				<li><a href="mlselect.jsp">决策树（decition tree）</a></li>
				<li class="current_page"><a href="ml_svm.jsp">支持向量机（SVM）</a></li>
				<li><a href="ml_randomForest.jsp">随机森林</a></li>
			</ul>
		</nav>
		<div class="container_buttons">
			<form action="svm!execute" method="post">
				<div id="1">
					<label class="title--label">C:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<button type="button" style="width:26px">-</button>
					<input type="text" id="C" name="C" style="width:60px" value="1.0" onblur="if (value ==''){value='1.0'}">
					<button type="button">+</button>
				</div>
				<div id="2">
					<label class="title--label">kernel:&nbsp;</label>
					<label class="label">
						<input type="radio" class="radio" name="kernel" value="rbf" checked>
						<span class="radioInput"></span>rbf
					</label>
					<label class="label">
						<input type="radio" class="radio" name="kernel" value="poly">
						<span class="radioInput"></span>poly
					</label>
					<label class="label">
						<input type="radio" class="radio" name="kernel" value="linear">
						<span class="radioInput"></span>linear
					</label>
					<label class="label">
						<input type="radio" class="radio" name="kernel" value="sigmoid">
						<span class="radioInput"></span>sigmoid
					</label>
					<label class="label">
						<input type="radio" class="radio" name="kernel" value="precomputed">
						<span class="radioInput"></span>sqrt
					</label>
				</div>
				<br>
				<div id="3">
					<label class="title--label">degree:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<button type="button" style="width:26px">-</button>
					<input type="text" id="degree" name="degree" style="width:60px" value="3" onblur="isInteger(id)">
					<button type="button">+</button>
				</div>
				<br>
				<div id="4">
					<label class="title--label">gamma:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<button type="button" style="width:26px">-</button>
					<input type="text" id="gamma" name="gamma" style="width:60px" value="auto" onblur="isNum(id)">
					<button type="button">+</button>
				</div>
				<br>
				<div id="5">
					<label class="title--label">coef0:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<button type="button" style="width:26px">-</button>
					<input type="text" id="coef0" name="coef0" style="width:60px" value="0.0" onblur="if (value ==''){value='0.0'}">
					<button type="button">+</button>
				</div>
				<div id="6">
					<label class="title--label">probability:&nbsp;&nbsp;&nbsp;</label>
					<label class="label">
						<input type="radio" class="radio" name="probability" value="False" checked>
						<span class="radioInput"></span>False
					</label>
					<label class="label">
						<input type="radio" class="radio" name="probability" value="True">
						<span class="radioInput"></span>True
					</label>
				</div>
				<div id="7">
					<label class="title--label">shrinking:&nbsp;&nbsp;&nbsp;</label>
					<label class="label">
						<input type="radio" class="radio" name="shrinking" value="True" checked>
						<span class="radioInput"></span>True
					</label>
					<label class="label">
						<input type="radio" class="radio" name="shrinking" value="False">
						<span class="radioInput"></span>False
					</label>
				</div>
				<br>
				<div id="8">
					<label class="title--label">tol:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<button type="button" style="width:26px">-</button>
					<input type="text" id="tol" name="tol" style="width:60px" value="0.001" onblur="if (value ==''){value='0.001'}">
					<button type="button">+</button>
				</div>
				<br>
				<div id="9">
					<label class="title--label">max_iter:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<button type="button" style="width:26px">-</button>
					<input type="text" id="max_iter" name="max_iter" style="width:60px" value="-1" onblur="isInteger(id)">
					<button type="button">+</button>
				</div>
				<div>
				    <label class="title--label">数据预处理方式:&nbsp;</label>
				    <label class="label">
				    	<input class="radio" type="checkbox" name="pretreatment" value="standardization">
				        <span class="checkbox radioInput"></span>标准化
				    </label>
				    <label class="label">
				        <input class="radio" type="checkbox" name="pretreatment" value="normalization">
				        <span class="checkbox radioInput"></span>归一化
				    </label>
				</div>
				<br>
				<div style="text-align:center">
					<label class="title--label">
						<button class="btn" type="submit" >进行模型构建</button>
					</label>
				</div>
			</form>
		</div>
	</div>
	<!-- /#wrapper -->
	<div class="fot_wrap">
		<div class="footer"> 
		</div>
	</div>
<script>
	function isInteger3(id){
		var value = document.getElementById(id).value;
		if((value | 0) != value && value != "None"){
			alert("该参数应该为整数或者None");
			document.getElementById(id).value="None";
			document.getElementById(id).focus();
		}
	}
	function isNum(id){
		var value = document.getElementById(id).value;
		if(isNaN(value) && value != "auto"){
			alert("该参数应该为数字或者auto");
			document.getElementById(id).value="auto";
			document.getElementById(id).focus();
		}
	}
	function isInteger9(id){
		var value = document.getElementById(id).value;
		if((value | 0) != value){
			alert("该参数应该为整数");
			document.getElementById(id).value="-1";
			document.getElementById(id).focus();
		}
	}
</script>
</body>
</html>