﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>{$article.title}</title> 
<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta charset="utf-8">
<link href="templates/css/news3_5.css" rel="stylesheet" type="text/css" />
<script src="js/audio.min.js" type="text/javascript"></script>
   
    <script>
      audiojs.events.ready(function() {
        audiojs.createAll();
      });
      
      
      
    </script>

    <script>
window.onload = function ()
{
var oWin = document.getElementById("win");
var oLay = document.getElementById("overlay");	
var oBtn = document.getElementById("popmenu");
var oClose = document.getElementById("close");
oBtn.onclick = function ()
{
oLay.style.display = "block";
oWin.style.display = "block"	
};
oLay.onclick = function ()
{
oLay.style.display = "none";
oWin.style.display = "none"	
}
};
</script>
<style>
#cate14 .mainmenu li a {
    background-color: rgba(4, 4, 4, 0.48);
    border-radius: 4px 4px 4px 4px;
    color: #FFFFFF;
    display: block;
    font-size: 16px;
    margin: 0 3px 3px 0;
    padding: 8px 10px;
    text-align: center;
    text-decoration: none;
}
 .themeStyle{ background-color:#3BA3FF !important; }  

</style>
</head> 
<body id="news">
<div id="mcover" onclick="document.getElementById('mcover').style.display='';"></div>
<!--<div id="ui-header"></div>-->
<div class="Listpage">

<div class="page-bizinfo">

<div class="header" style="position: relative;">
<h1 id="activity-name">{$article.title}</h1>
<span id="post-date">{$article.add_time}</span></div>
<div class="showpic"></div> 
<div class="text" id="content">{$article.article_note_1}</div>                    
<div id="insert3" ></div>
</div>
</div>


</div>	
        
<a class="footer" href="#" target="_self"><span class="top">返回顶部</span></a>



 
<div style="display:none"> </div>
</div>

</body>
</html>










