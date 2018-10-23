<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Select features</title>
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

</script>
</head>
<body>
<s:debug></s:debug>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<div class="row clearfix">
						<p align="left">
							<label for="map">选择合适的特征</label>
						</p>
						<div class="col-md-4 column">
							 <button class="quanxuanh btn btn-default btn-success"  type="button" onclick="selectAllRadio();">全选特征</button>
						</div>
						<div class="col-md-4 column">
							 <button class="fanxuanh btn btn-default btn-success"  type="button" onclick="inverseRadio();">反选特征</button>
						</div>
						<div class="col-md-4 column">
						</div>
					</div>
				</div>
				<div class="col-md-6 column">
					<div>
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
							 <button type="button" class="btn btn-default" onclick="selectByhreshold()">确定选择</button>
						</div>
					</div>
				</div>
			</div>
			<form action="getFeatureKey" method="post">
				<div class="submitKey" >
	  			   <input type="submit" value="确定特征"  class="btn btn-default btn-success" />	
	  			</div>
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="checkBoxClass">
							<table width="100%">
								<s:checkboxlist name="map" list="map" id="map" listValue="key"></s:checkboxlist>
							</table>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>