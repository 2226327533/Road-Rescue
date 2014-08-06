//Ajax 验证用户名、车辆编号、车牌号等。

//获取XmlHttpRequest
function createXMLHttpRequest(){
	var xmlhttp;
	if(window.ActiveXObject){
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");		
		
	}else if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	return xmlhttp;
}

//检查车辆编号。
function checkid(){
	if(document.all.numcode.value==""){		
		document.getElementById('tip').innerHTML = '请输入编号！';
		return;		
	}
	var numcode=document.all.numcode.value;
	var xmlhttp=createXMLHttpRequest();
	xmlhttp.onreadystatechange=function (){CheckCarIdProcess(xmlhttp)};
	xmlhttp.open("get","../car/checkcar.htm?carid="+numcode+"&time="+new Date().getTime());//防止快取
	xmlhttp.send(null);
}

//检查车牌号。
function checknum(){
	if(document.all.carnum.value==""){		
		document.getElementById('tips').innerHTML = '请输入车牌号！';
		return;		
	}
	var carnum=document.all.carnum.value;
	var xmlhttp=createXMLHttpRequest();
	xmlhttp.onreadystatechange=function (){CheckCarNumProcess(xmlhttp)};
	xmlhttp.open("get","../car/checkcarnum.htm?carnum="+carnum+"&time="+new Date().getTime());//防止快取
	xmlhttp.send(null);
}

//检查司机编号。
function checkdriver(){
	if(document.all.numcode.value==""){		
		document.getElementById('tip').innerHTML = '请输入编号！';
		return;		
	}
	var numcode=document.all.numcode.value;
	var xmlhttp=createXMLHttpRequest();
	xmlhttp.onreadystatechange=function (){CheckDriverProcess(xmlhttp)};
	xmlhttp.open("get","../driver/checkdriver.htm?driverid="+numcode+"&time="+new Date().getTime());//防止快取
	xmlhttp.send(null);
	
}

function CheckCarIdProcess(xmlhttp){
	var numcode=document.all.numcode.value;
	if(xmlhttp.readyState==4){
		if(xmlhttp.status==200){
			if(xmlhttp.responseText.indexOf("true")!=-1){		
				document.getElementById('tip').innerHTML = numcode+' 已经存在了。';
				return;	
			}else{		
				document.getElementById('tip').innerHTML = numcode+' 可以注册。';	
				return;	
			}	
		}
	}
}

function CheckCarNumProcess(xmlhttp){
	var carnum=document.all.carnum.value;
	if(xmlhttp.readyState==4){
		if(xmlhttp.status==200){
			if(xmlhttp.responseText.indexOf("true")!=-1){		
				document.getElementById('tips').innerHTML = carnum+' 已经存在了。';
				return;	
			}else{		
				document.getElementById('tips').innerHTML = carnum+' 可以注册。';	
				return;	
			}	
		}
	}
}

function CheckDriverProcess(xmlhttp){
	var numcode=document.all.numcode.value;
	if(xmlhttp.readyState==4){
		if(xmlhttp.status==200){
			if(xmlhttp.responseText.indexOf("true")!=-1){		
				document.getElementById('tip').innerHTML = numcode+' 已经被注册。';
				return;	
			}else{		
				document.getElementById('tip').innerHTML = numcode+' 可以注册。';	
				return;	
			}	
		}
	}
}