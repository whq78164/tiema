﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>谜语编辑</title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>


</head>
<style type="text/css">
<!--

.demo {
	width:98%;
margin-top:-15px;
  
}
.demo h2 {
	font-size:16px;
	height:44px;
	color:#3366cc;
	margin-top:0px;
}
.demo dl dt {
	font-size:14px;
	color:#ff6600;
	margin-top:0px;
	font-weight:800;
}
.demo dl dt, .demo dl dd {
	line-height:22px;
}
	.tabbtn {
	list-style-type:none;
	height:30px;
	background:url(images/tabbg.gif) repeat-x;
	border-left:solid 1px #ddd;
	border-right:solid 1px #ddd;
}
.tabbtn li {
	float:left;
	position:relative;
	margin:0 0 0 -1px;
}
.tabbtn li a {
	display:block;
	float:left;
	height:30px;
	line-height:30px;
	overflow:hidden;
	width:108px;
	text-align:center;
	font-size:12px;
	cursor:pointer;
}
.tabbtn li.current {
	border-left:solid 1px #d5d5d5;
	border-right:solid 1px #d5d5d5;
	border-top:solid 1px #c5c5c5;
}
.tabbtn li.current a {
	border-top:solid 2px #ff6600;
	height:27px;
	line-height:27px;
	background:#fff;
	color:#3366cc;
	font-weight:800;
}
/* tabcon */
.tabcon {
	border-width:0 1px 1px 1px;
	border-color:#ddd;
	border-style:solid;
	position:relative;/*必要元素*/
	

  
}
.tabcon .subbox {
	position:absolute;/*必要元素*/
	left:0;
	top:0;
}
.tabcon .sublist {
	padding:0px 0px;

}

  .table_img {   
          border: 1px solid #B1CDE3;   
            padding:0;    
           margin:0 auto;   
            border-collapse: collapse;   
       }   
         
    .table_img   td {   
            border: 1px solid #B1CDE3;   
           background: #fff;   
            font-size:12px;   
           padding: 3px 3px 3px 8px;   
          color: #4f6b72;   
        }   
-->
</style>
<body  style=" margin-top: 0px;margin-left: 5px;  padding-top: 0px;"> 
<!--
<div id="dataLoad" style="display:block">
   <table width="100%" height="100%" border="0" align="center" >
    <tr height="50%"><td align="center">&nbsp;</td></tr>
    `
    <tr><td align="center">数据载入中，请稍后......</td></tr>
    <tr height="50%"><td align="center">&nbsp;</td></tr>
   </table>
  </div>
-->
{if $fall==edit}
<div class="demo">	
	

	 <form name="myform" method="post" action="wxriddle.php?act=post" enctype="multipart/form-data">
 

   
	<div class="tabcon" id="leftcon"  >
    
    <div  id="m1"><table class="table" width="100%" border="0">
   <th colspan="2">编辑谜语</th>
  <tr><td>代码:</td><td><input disabled="true"  type="text" value="{$wxriddle_mx.wxriddle_sn}" /><input name="wxriddle_sn" id="wxriddle_sn"  type="hidden" value="{$wxriddle_mx.wxriddle_sn}" /><a style="color:red;">*</a></td></tr>
  <tr><td>名称:</td><td><input name="wxriddle_name"  id="wxriddle_name" type="text" value="{$wxriddle_mx.wxriddle_name}" /><a style="color:red;">*</a></td></tr>
 
 
  <tr><td>排序:</td><td><input name="sort_no"  id="sort_no" type="text"  value="{$wxriddle_mx.sort_no}"/></td></tr>
  
  
   
    <tr><td>类型:</td><td>
       <select  name="wxriddle_lx" id="wxriddle_lx" style="width: 100px;"> 
            <option value="0">请选择</option>
		    {foreach from=$res_wxfloor item=res_wxfloor}
	        <option value="{$res_wxfloor.wxfloor_sn}">{$res_wxfloor.wxfloor_name}</option>
		  {/foreach}
       </select>
       &nbsp;&nbsp;&nbsp;
 
  </td> </tr>
 <tr><td>谜面:</td><td><input  style="width:300px" name="title"  id="title" type="text" value="{$wxriddle_mx.title}" /></td></tr>

 
  <tr><td>谜底:</td><td><input  style="width:300px" name="wxriddle_note_2"  id="wxriddle_note_2" type="text" value="{$wxriddle_mx.wxriddle_note_2}" /></td></tr>	
 
  
</table>
    
    
    
    </div>
	
    <div align="center" style="padding: 10px;"><input  type="submit"  id="btn_queren2" value="确认" />&nbsp;<input  type="button" onclick="location='wxriddle.php'" value="返回" /></div>
	</div>
    
    
    
	</form>


	
</div><!--tabbox end-->







{/if}
	
{if $fall==post}



<table class="table" width="100%" border="0">
 <tr><td colspan="1"><b>编辑谜语</b></td></tr>
 <tr><td>修改成功<a href="wxriddle.php">返回</a></td></tr>
</table>
{/if}
{if $fall==add_wxriddle_list}
<div class="demo">	
<form name="myform" method="post" action="wxriddle.php?act=post_add" enctype="multipart/form-data">   
   <div class="tabcon" id="leftcon"  >
    <div  id="m1">
	<table class="table" width="100%" border="0" >
 <th colspan="2">添加谜语</th>
 <tr><td>代码:</td><td><input name="wxriddle_sn" id="wxriddle_sn"  type="text" /><a style="color:red;">*</a></td></tr>
  <tr><td>名称:</td><td><input name="wxriddle_name"  id="wxriddle_name" type="text" value="{$wxriddle_mx.wxriddle_name}" /><a style="color:red;">*</a></td></tr>
 
<tr><td>排序:</td><td><input name="sort_no"  id="sort_no" type="text"  value="{$wxriddle_mx.sort_no}"/></td></tr>
 <tr><td>标题:</td><td><input  style="width:300px" name="title"  id="title" type="text" value="{$wxriddle_mx.title}" /></td></tr>
 
 <tr><td>类型:</td><td>
      <select  name="wxriddle_lx" id="wxriddle_lx" style="width: 100px;"> 
            <option value="0">请选择</option>
		    {foreach from=$res_wxfloor item=res_wxfloor}
	        <option value="{$res_wxfloor.wxfloor_sn}">{$res_wxfloor.wxfloor_name}</option>
		  {/foreach}
       </select>
       &nbsp;&nbsp;&nbsp;
 
  </td> </tr>
 <tr><td>谜面:</td><td><input  style="width:300px" name="title"  id="title" type="text" value="{$wxriddle_mx.title}" /></td></tr>

 
  <tr><td>谜底:</td><td><input  style="width:300px" name="wxriddle_note_2"  id="wxriddle_note_2" type="text" value="{$wxriddle_mx.wxriddle_note_2}" /></td></tr>

  
</table>
    
    
    
    </div>
	
    <div align="center" style="padding: 10px;"><input  type="submit"  id="btn_queren2" value="确认" />&nbsp;<input  type="button" onclick="location='wxriddle.php'" value="返回" /></div>
	</div>
    
    
    
	</form>


	
</div><!--tabbox end-->





{/if}



{if $fall==fs}
	
	



<table class="table" width="100%" border="0">
 <tr><td colspan="1"><b>代码已存在</b></td></tr>
 <tr><td>代码已存在<a href="wxriddle.php">返回</a></td></tr>
</table>
	
    



{/if}

</body>  
</html>
{literal}
<script type="text/javascript">
        
        $("#wxriddle_sn").focus();
       $("#btn_queren2").click(function(){
           if(jQuery.trim($("#wxriddle_sn").attr('value'))=='')
        {
            
            $("#wxriddle_sn").focus();
            
            return false;
        }
        else if(jQuery.trim($("#wxriddle_name").attr('value'))=='')
        {
            $("#wxriddle_name").focus();
            return false;
        }
        else
        {
            
            if(confirm("确认修改")){
                
            }
            else
            {
                return false;
            }
        }
       })
   

    
    var i=2;
   $("#add_images").click(function (){
        
        
        $("#m2").append('&nbsp;图片'+i+':<input type="file" name="pic'+i+'"/>  &nbsp;<br />');
        i++;

        //alert(1);
   })

      $("img[id='img_mx']").each(function (){
            
           $(this).dblclick(function (){
           //alert($(this).attr("name"));
           //$("#hide_img").wxriddleToggle(200);
           
           
        })
        })
          $("img[id='delete_z_sn']").each(function (){
            
           $(this).click(function (){
        
           if(confirm("是否删除图片"+$(this).attr("title"))){
             
              htmlobj=$.ajax({url:"wxriddle.php?act=delete&img_code="+encodeURI(encodeURI($(this).attr("title"))),async:false});
              alert(htmlobj.responseText);
             window.location.reload();
            }else return false;
            
          //alert($(this).attr("title"));
           //$("#hide_img").wxriddleToggle(200);
           
           
        })
        })
        
            $("img[id='img_jy']").each(function (){
            
           $(this).click(function (){
        
           if(confirm("禁用"+$(this).attr("title")+"图片？")){
             
              htmlobj=$.ajax({url:"wxriddle.php?act=img_xs&img_code="+encodeURI(encodeURI($(this).attr("title")))+"&alt="+$(this).attr("alt"),async:false});
              alert(htmlobj.responseText);
             window.location.reload();
            }else return false;
            
          //alert($(this).attr("title"));
           //$("#hide_img").wxriddleToggle(200);
           
           
        })
        })
         $("img[id='img_xs']").each(function (){
            
           $(this).click(function (){
        
           if(confirm("显示"+$(this).attr("title")+"图片？")){
             
              htmlobj=$.ajax({url:"wxriddle.php?act=img_xs&img_code="+encodeURI(encodeURI($(this).attr("title")))+"&alt="+$(this).attr("alt"),async:false});
              alert(htmlobj.responseText);
             window.location.reload();
            }else return false;
            
          //alert($(this).attr("title"));
           //$("#hide_img").wxriddleToggle(200);
           
           
        })
        })
        
        $("#type").val({$wxriddle_mx.type});
       $("#wxriddle_lx").val("{$wxriddle_mx.wxriddle_lx}");
       $("#wxriddle_msg").val({$wxriddle_mx.wxriddle_msg});
            
      
        if({$wxriddle_mx.is_tuig}==1)
        {
           
            $("#is_tuig").attr("checked",true);
        }
        else
        {
            $("#is_tuig").attr("checked",false);
        }
        
</script>
{/literal}