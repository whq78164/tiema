﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="css/menu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jq.mshop.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>

</head>

<style type="text/css">
<!--
.table tr td p{margin:0px 0 0 0;padding:0;text-indent:0em;line-height:150%;}
	 .alert{filter:alpha(opacity=20); /* IE */ -moz-opacity:0.2; /* Moz + FF */ opacity: 0.2; height:200%; width:100%; background:; left:0%; top:0%;margin-top:-0px;margin-left:-0px;position:absolute;z-index:99; text-align:center; padding:0px;}
	#leavemsg{left:20%; top:20%;margin-top:-0px;margin-left:-0px;position:absolute;z-index:99; text-align:center; padding:0px;
	width:500px;
	height:300px;
	border:0px solid #008800;}
-->
</style>
<body>

<div class="container">
  <div class="content">
  
 
 
   <div class="botable">
{if $fall==1}

   
 <table class="table" width="100%" border="0" style="margin-bottom: 7px;">

 <form>
 <tr>
 <th style="text-align: left;border-right-style:none"><input id="a_text" value="添加主题" type="button" onclick="location='wxfloor.php?act=add_wxfloor_list'" />&nbsp;<input id="down_hy" value="头像下载" type="hidden" /></th>
 <th style="text-align: right; border-left-style:none">
 <input  type="text"  id="key" name="key" />&nbsp;<input  type="text"  id="m_key" name="m_key"/>&nbsp;<input  value="搜索" type="submit" />&nbsp;&nbsp;</th>
 
 </tr>


 </form>
</table>
    


   <table class="table" width="100%" border="0">
   
   <tr>
   <th >主题代码</th>
   <th>主题名称</th>
   <th>内容</th>
   <th>类型</th>
     <th>排序</th>
   <th>最后更新时间</th>
 
   <th>操作</th>
   </tr>
<tbody  id="table_t">
   {foreach from=$wxfloor_list item=wxfloor_list}
  <tr>
  <td style="width:70px">{$wxfloor_list.wxfloor_sn}</td>
  <td style="width:140px">{$wxfloor_list.wxfloor_name}</td>
  <td  title="{$wxfloor_list.wxfloor_note_1}">{$wxfloor_list.wxfloor_note_1}</td>
  <td style="width:70px">{if $wxfloor_list.type==1}信用卡试用及提额宝典{/if}</td>
  <td style="width:150px">{$wxfloor_list.sort_no}</td>
 <td style="width:150px">{$wxfloor_list.last_update}</td>

  
  <td style="width:90px"> 
  {if $wxfloor_list.tzsy==1}
   <img  title="启用" name="{$wxfloor_list.wxfloor_sn}" id="tzsy_qy"  src="images/no.gif" />&nbsp;
  <img  title="修改" name="{$wxfloor_list.wxfloor_sn}" id="edit"  src="images/icon_edit.gif" />&nbsp;
  <img id="delete_wxfloor" name="{$wxfloor_list.wxfloor_sn}" title="删除" src="images/icon_drop.gif"/>
  {else if }
  <!--<img  title="发送预览" wxfloor_sn="{$wxfloor_list.wxfloor_sn}" wxfloor_name="{$wxfloor_list.wxfloor_name}"  class="send"  src="images/send.gif" />&nbsp;-->
  <img  title="禁用" name="{$wxfloor_list.wxfloor_sn}" id="tzsy_jy"  src="images/yes.gif" />&nbsp;
  <img  title="修改" name="{$wxfloor_list.wxfloor_sn}" id="edit"  src="images/icon_edit.gif" />&nbsp;
  <img id="delete_wxfloor" name="{$wxfloor_list.wxfloor_sn}" title="删除" src="images/icon_drop.gif"/>
  {/if}
  </td>
  
  </tr>
  {foreachelse}
  <tr>
  <td style="width:70px" colspan="20">无记录</td>
  </tr>
   {/foreach}
  
</tbody>
</table>


<table class="table" width="100%" border="0">
<tr><td style="text-align: right;">{include file="foot.tpl"}</td></tr> 
</table>


{/if}


</div>
   <!-- end .content --></div>
<!-- end .container --></div>



<!--弹出层 end-->
<div class="alert" style="display:none;">

</div>
<div id="leavemsg" style="display:none;">
<input type="hidden" id="leaveid"/><input type="hidden" id="leavename"/>
<table class="table" width="100%" border="0" style="margin-bottom: 7px;">
<tr><th colspan="3" style="text-align: center;" >发送预览信息</th></tr>
<tr></td></tr>
<tr style=""><th style="width:70px;" >详情</th><td colspan="">

<p style="float: left;width:100px">发送代码:<a id="send_sn"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p style="float: left;width:100px;">名称:<a id="send_name" style="color:green">&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>



</td>
</tr>
<tr style=""><th style="width:70px;" >选择关注组</th><td colspan=""><select  name="role" id="role" style="width:100px"> 
            <option value="">请选择</option>
        
            {foreach from=$group item=group}
            <option value="{$group.group_sn}">{$group.group_sn}_{$group.group_name}</option>
            {/foreach}
       </select></td>
</tr>
<tr style="height:100px;"><td colspan="2" style="text-align: center;color:red;"  id="errmes"></td></tr>
<tr ><td style="text-align: right;" colspan="3"><input  type="button" id="msgssend" value="开始发送"/><input  type="button" value="取消" id="msgquxiao" /></td></tr>




</body>
</html>
<script type="text/javascript">
<!--
$(document).ready(function ()
{       
     $("#text_sn").focus();
       $("#queding").click(function(){
           if(jQuery.trim($("#text_sn").attr('value'))=='' )
        {
            
            $("#text_sn").focus();
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
       
       
        
        
        $("img[id='edit']").each(function (){
            
           $(this).click(function (){
        
           window.location='wxfloor.php?act=edit&wxfloor_sn='+encodeURI(encodeURI($(this).attr("name")));
           
           
        })
        })
        
        
         $("img[id='delete_wxfloor']").each(function (){
            
            $(this).click(function (){
        
            
              if(confirm("删除"+$(this).attr("name")+"")){
               htmlobj=$.ajax({url:"wxfloor.php?act=delete_wxfloor&wxfloor_sn="+encodeURI(encodeURI($(this).attr("name"))),async:false});
              //alert(htmlobj.responseText);
             window.location.reload();
            }else return false;
            
            })
        })
        
      
        
        
        $("img[id='tzsy_jy']").each(function (){
            
           $(this).click(function (){
        
           if(confirm("禁用"+$(this).attr("name")+"")){
             
              htmlobj=$.ajax({url:"wxfloor.php?act=wxfloor_xs&wxfloor_code="+encodeURI(encodeURI($(this).attr("name")))+"&alt=1",async:false});
              //alert(htmlobj.responseText);
             window.location.reload();
            }else return false;
            
          //alert($(this).attr("title"));
           //$("#hide_img").slideToggle(200);
           
           
        })
        })
        $("img[id='tzsy_qy']").each(function (){
            
           $(this).click(function (){
        
           if(confirm("启用"+$(this).attr("name")+"")){
             
              htmlobj=$.ajax({url:"wxfloor.php?act=wxfloor_xs&wxfloor_code="+encodeURI(encodeURI($(this).attr("name")))+"&alt=0",async:false});
              //alert(htmlobj.responseText);
             window.location.reload();
            }else return false;
            
          //alert($(this).attr("title"));
           //$("#hide_img").slideToggle(200);
           
           
        })
        })
        
        
        
         $(".send").each(function(){
            
             $(this).click(function(){
                $(".alert").fadeIn();
                 $("#leavemsg").fadeIn();
                
                $("#send_sn").text($(this).attr("wxfloor_sn"));
                
                $("#send_name").text($(this).attr("wxfloor_name"));
            
             })
            
        
      })
      
       $("#msgquxiao").click(function(){
             $(".alert").fadeOut();
             $("#leavemsg").fadeOut();
        })
        
        
           $("#msgssend").click(function(){
                
                if($("#role").val()=='')
                {
                    $("#errmes").text("发送失败,请选择发送组");
                    return false;
                }
                
                var role=$("#role").val();
                var sn=$("#send_sn").text();
                
                htmlobj2=$.ajax({
                        //type:"POST",
                        dataType: "json", 
                       
                        url:"wx_send_msg.php?m=add_preview",
                        data:{'p_id':sn,'role':role},
                        //async:false,
                        beforeSend:function(XMLHttpRequest){
                        
                           
                            },
                            success:function(data,textStatus){
                           //alert(data);
                            //i++;
                            
                                $("#errmes").text(data.nick_name+"    "+data.errmsg);
                            },
                            complete:function(XMLHttpRequest,textStatus){
                  
                         
                          
                            },
                            error:function(XMLHttpRequest,textStatus,errorThrown){
                         
                            }
                        
                        
                        
                        });
            
                
               
                
                 run();             //加载页面时启动定时器  
                 var interval;                         
                 function run() {  
                      interval = setInterval(chat, "1000");  
                        
                 }  
                 function chat() { 

                        htmlobj=$.ajax({
                        //type:"POST",
                        dataType: "json", 
                       
                        url:"wx_send_msg.php?m=wx_send_preview",
                        data:{'p_id':sn},
                        //async:false,
                        beforeSend:function(XMLHttpRequest){
                        
                           
                            },
                            success:function(data,textStatus){
                           //alert(data);
                            //i++;
                                if(data.errcode==999999)
                                {   
                                    
                                    clearTimeout(interval);
                                    i=0;
                                    
                                }
                                $("#errmes").text(data.nick_name+"    "+data.errmsg);
                            },
                            complete:function(XMLHttpRequest,textStatus){
                  
                         
                          
                            },
                            error:function(XMLHttpRequest,textStatus,errorThrown){
                         
                            }
                        
                        
                        
                        });


                 } 
                
                
               

        })
        
        
        
})
-->
</script>
