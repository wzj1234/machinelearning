<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	body {
	    margin: 0;
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
	a.media { 
		display: block; 
	}
	div.media { 
		font-size: small; margin: 25px; margin: auto
	}
	div.media div { 
		font-style: italic; color: #888; 
	}
	
</style>
</head>
<body style="height:100%">
	<div text-align:center>
		<nav>
			<ul id="menu_list">
				<li><a href="index.jsp">返回首页</a></li>
				<li class="current_page"><a href="mlselect.jsp">决策树（decition tree）</a></li>
				<li><a href="ml_svm.jsp">支持向量机（SVM）</a></li>
				<li><a href="ml_randomForest.jsp">随机森林</a></li>
			</ul>
		</nav>
		
		<a class="media" href="./python/decisiontree.pdf">结果文件</a>
		
	</div>
	<!-- /#wrapper -->
	<div class="fot_wrap">
		<div class="footer"> 
		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.media.js"></script>
	<script type="text/javascript">
	 $(function() {  
	 	$('a.media').media({width:1200,height:800});
	 }); 
	</script>
	
</body>
</html>