<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
<script type="text/javascript" src="echarts-2.2.7/build/dist/echarts.js"></script> 
<script type="text/JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">

	require.config({
	    paths: {
	        echarts: 'echarts-2.2.7/build/dist'
	    }
	});
	require(
	    [
	        'echarts',
	        'echarts/chart/bar',
	        'echarts/chart/line'
	    ],
	    function (ec) {
	        var myChart = ec.init(document.getElementById('main')); 
	        var arrayxAxis = new Array();
			var arrayPrecision = new Array();
			var arrayRecall = new Array();
			var arrayFscore = new Array();
			var arraySupport = new Array();
			var loc = 0;
			<c:forEach items="${consequences}" var="t" varStatus="status">
				loc = ${status.index};
				arrayxAxis[loc] = "${t.title}";		
				arrayPrecision[loc] = ${t.precision};
				arrayRecall[loc] = ${t.recall};
				arrayFscore[loc] = ${t.fscore};
				arraySupport[loc] = ${t.support};
    		</c:forEach>
    		
	        var option = {
        		title: {
                    text: '决策树模型指标展示图',      //主标题
                    itemGap: 15,
                    textStyle:{
                        color:'#019858',        //颜色
                        type: 'solid',
                        fontStyle:'normal',     //风格
                        fontWeight:'bolder',    //粗细
                        fontFamily:'Microsoft yahei',   //字体
                        fontSize:22,     //大小
                        align:'center'   //水平对齐
                    }
                },
	            tooltip: {
	                show: true
	            },
	            legend: {
	                data:['precision', 'recall', 'f1-score', 'support'],
	                textStyle:{  
                        type: 'solid',
                        fontSize:'16'
                    }
	            },
	            xAxis : [
	                {
	                    type : 'category',
	                    data : arrayxAxis,
	                    axisLabel:{  
	                        textStyle:{  
	                            color:"black",
		                        type: 'solid',
                                fontSize:'18'
	                        }  
	                    },
	    				axisLine : {
		                    show: true,
		                    lineStyle: {
		                        color: 'black',
		                        type: 'solid',
		                        width: 2
		                    }
		                }
	                }
	            ],
	            yAxis : [
	                {
	                    type : 'value',
	                    name: 'rate',
	                    nameTextStyle:{
	                    	color:"#02DF82",
	                    	fontSize:20
	                    },
	                    scale: true,
	                    max: 1,
	                    min: 0,
	                    axisLabel:{  
	                        textStyle:{  
	                            color:"black",
		                        type: 'solid',
                                fontSize:'16'
	                        }  
	                    },
	    				axisLine : {
		                    show: true,
		                    lineStyle: {
		                        color: 'black',
		                        type: 'solid',
		                        width: 2
		                    }
		                }
	                },
	                {
	                    type: 'value',
	                    name: 'support',
	                    nameTextStyle:{
	                    	color:"#02DF82",
	                    	fontSize:20
	                    },
	                    splitLine:{show: false},
	                    min: 0,
	                    splitNumber:5,
	                    axisLabel:{  
	                        textStyle:{  
	                            color:"black",
		                        type: 'solid',
                                fontSize:'16'
	                        }  
	                    },
	    				axisLine : {
		                    show: true,
		                    lineStyle: {
		                        color: 'black',
		                        type: 'solid',
		                        width: 2
		                    }
		                }
	                }
	            ],
	            series : [
	                {
	                    name:'precision',
	                    type:'bar',
	                    data:arrayPrecision,
	                    itemStyle: {
		        			normal: {
		        				color: '#C48888'
		        			}
		        		}
	                },
	                {
	                    name:'recall',
	                    type:'bar',
	                    data:arrayRecall,
	                    itemStyle: {
		        			normal: {
		        				color: '#99CCFF'
		        			}
		        		}
	                },
	                {
	                    name:'f1-score',
	                    type:'bar',
	                    data:arrayFscore,
	                    itemStyle: {
		        			normal: {
		        				color: '#9999CC'
		        			}
		        		}
	                },
	                {
	                	name:'support',
	                    type:'line',
	                    yAxisIndex:1,
	                    data:arraySupport,
	                    itemStyle: {
		        			normal: {
		        				color: '#FFD306'
		        			}
		        		}
	                }
	            ]
	        };
	        myChart.setOption(option); 
	    }
	);
</script>
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
	
	<table style="width:100%;border:1px white solid">  
			<thead>
				<tr>
					<th colspan="5" style="text-align: center; color: #019858;">
						<h2>决策树模型指标展示表</h2>
					</th>
				</tr>
			</thead> 
			<tbody>
				<tr bgcolor="#019858" style="color: #fff;">
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
					<tr bgcolor="${status.index%2 == 0?'#C1FFE4':'#E8FFF5'}">     
						<th align="center" style="color: #019858;">
							${t.title}
						</th>
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
	    	</tbody>
    	</table>
	</div>
	<br>
	<br>
	<div id="main" style="height:400px"></div>
	
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.media.js"></script>
	<script type="text/javascript">
	 $(function() {  
	 	$('a.media').media({width:1200,height:800});
	 }); 
	</script>
	
</body>
</html>