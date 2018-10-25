<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
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
	<script type="text/javascript">
	</script>
	<div style="display:block">
		<nav>
			<ul id="menu_list">
				<li><a href="index.jsp">返回首页</a></li>
				<li><a href="mlselect.jsp">决策树（decition tree）</a></li>
				<li class="current_page"><a href="ml_svm.jsp">支持向量机（SVM）</a></li>
				<li><a href="ml_randomForest.jsp">随机森林</a></li>
			</ul>
		</nav>
		支持向量机模型构建完成<br>

		<table style="width:100%;border:1px white solid">  
			<tr bgcolor="#4F81BD"style="color: #fff;">
				<th style="text-align: center"></th>
				<th style="text-align: center">
					precision
				</th>
				<th style="text-align: center">
					recall
				</th>
				<th style="text-align: center">
					f1-score
				</th>
				<th style="text-align: center">
					support
				</th>
			</tr>
			<c:forEach items="${consequences}" var="t" varStatus="status">
				<tr bgcolor="${status.index%2 == 0?'#D0D8E8':'#E9EDF4'}">     
					<td align="center">
						Stage ${status.index + 1}
					</td>
					<td align="center">
						${t.precision}
					</td>
					<td align="center">
						${t.recall}
					</td>
					<td align="center">
						${t.fscore}
					</td>
					<td align="center">
						${t.support}
					</td> 				
				</tr>
	    	</c:forEach> 
    	</table>
	</div>
	<!-- /#wrapper -->
	<div class="fot_wrap">
		<div class="footer"> 
		</div>
	</div>

</body>
</html>