
{include file="w/head.html"}

{if $fall==1} 
        {include file="w/title_2.html"}
        <div class="content"><p><div  class="ui-searchbar-wrap ui-border-b focus">
    
    <div class="ui-searchbar">
        <i class="ui-icon-search"></i>
        <div class="ui-searchbar-text">搜索客户名称、手机号、备注</div>
        <div class="ui-searchbar-input"><input value="" type="tel" id="m_key" name="m_key" placeholder="搜索客户名称、手机号、备注" autocapitalize="off"></div>
        <i class="ui-icon-close" ></i>
    </div>
     
     <button class="ui-searchbar-cancel"  >搜索</button>
     
     
</div> 
</p>

<p><ul class="ui-list ui-border-tb">
    {foreach from=$kehu_list item=kehu_list}
    <li>
        <div class="ui-list-thumb ui-avatar-s">
           <span style="background-image:url(templates/w/home/linkman.png)"></span>
        </div>
        <div class="ui-list-info ui-border-t" name="{$kehu_list.kehu_sn}">
            <h4 class="ui-nowrap">{$kehu_list.kehu_name}{if $kehu_list.mobile!='0' && $kehu_list.mobile!=''}({$kehu_list.mobile}){else}{/if}</h4>
            <p class="ui-nowrap">{$kehu_list.bz}</p>
        </div>
        <a href="tel:{$kehu_list.mobile}"><div class="ui-btn"  >电话</div></a>
    </li>
    {foreachelse}
    <li>
        <div class="ui-list-thumb ui-avatar-s">
           <span style="background-image:url(templates/w/home/setting.png)"></span>
        </div>
        <div class="ui-list-info ui-border-t2">
            <h4 class="ui-nowrap">无记录</h4>
            
        </div>
    </li>
    {/foreach}
    <span class="clothShop"></span>
     
</ul></p>
<p ><ul class="ui-list ui-list-text ui-list-link ui-border-b" id="getmore" style="margin-top: -20px;{if $max_page==1}display: none;{/if}">
    <li class="ui-border-t2" id="more" >
        <h4 class="ui-nowrap" >更多…</h4>
    </li>
    
</ul></p>

<input  type="hidden" value="0" id="lbxs_open"/>
<input  type="hidden" value="d8864aff1b52fa689" id="g_e"/>
<input  type="hidden" value="414aafcce9e10bcc5" id="g_d"/>
<input  type="hidden" value="c3cb71ee4002b5311" id="g_xs"/>
<input  type="hidden" value="kehu_sn" id="bianjisetf1"/>

<input  type="hidden" value="{$p_Array.pager_PageID_next}" id="pager_PageID_next"/>
<input  type="hidden" value="{$p_Array.url}" id="url"/>
<input  type="hidden" value="{$max_page}" id="max_page"/>



{/if}

<script type="text/javascript">
$('.ui-searchbar').tap(function(){
    $('.ui-searchbar-wrap').addClass('focus');
    $('.ui-searchbar-input input').focus();
});
//$('.ui-searchbar-cancel').tap(function(){
//    $('.ui-searchbar-wrap').removeClass('focus');
//});

$('.ui-icon-close').tap(function(){
    $("#m_key").val("");
})
$('.ui-searchbar-cancel').tap(function(){
    location.href='?m_key='+$("#m_key").val();
    
})



$(".ui-border-t").each(function (){
           var  lbxs_open=$("#lbxs_open").val();
           var  g_e=$("#g_e").val();
           var  bianjisetf1=$("#bianjisetf1").val();
           
           $(this).click(function (){
            if(lbxs_open==0)
            {
                window.location='kehu.html?g='+g_e+'&'+bianjisetf1+'='+encodeURI(encodeURI($(this).attr("name")));
            }else
            {
                window.open('kehu.html?g='+g_e+'&'+bianjisetf1+'='+encodeURI(encodeURI($(this).attr("name"))));
            }         
           
        })
        })
        
        
    
            
             //$(".ui-loading-wrap").show();
             
             //ajaxRead();
            
    $('#more').bind('tap',function(){
         ajaxRead();
    })
    function ajaxRead()
    {
            
        var html="";
        var gourl=$("#url").val();
        var pager_PageID=$("#pager_PageID_next").val();
        
        var max_page=$("#max_page").val();
        var el;
  //alert(pager_PageID);
        $.ajax({
              type:'get',
              dataType:'json',
			  
              url:gourl+'&g=getnextpage&pager_PageID='+pager_PageID,
              data:{},
			  beforeSend:function(){
			     el=$.loading({
                    content:'加载中...',
                 });
			  },
              success:function(data){
                    if(data.sl>0)
                    {
                        $.each(data.items,function(i,item){
     
html+='<li>';
html+='<div class="ui-list-thumb ui-avatar-s">';
html+='<span style="background-image:url(templates/w/home/linkman.png)"></span>';
html+='</div>';
html+='<div class="ui-list-info ui-border-t" name="'+item.kehu_sn+'">';
html+='<h4 class="ui-nowrap">'+item.kehu_name;
if(item.mobile!='0' && item.mobile!='' )
{
html+='('+item.mobile+')';
}
html+='</h4>';
html+='<p class="ui-nowrap">'+item.bz+'</p>';
html+='</div>';
html+='<a href="tel:'+item.mobile+'"><div class="ui-btn"  >电话</div></a>';
html+='</li>';

                    });
            //alert(html);
                    if(max_page==0)
                    {
                         $(".clothShop").before($(html));
                    }else
                    {
                        
                    }
                    
                    if(data.page.pager_Number==pager_PageID)
                    {
                         $("#max_page").val(1);
                         $("#getmore").hide();
                    }
                    
                    
                   
                    //alert(data.page.pager_PageID_next);
                    $("#pager_PageID_next").val(data.page.pager_PageID_next);
                    }
                    
                    
                    $(".ui-border-t").each(function (){
                       var  lbxs_open=$("#lbxs_open").val();
                       var  g_e=$("#g_e").val();
                       var  bianjisetf1=$("#bianjisetf1").val();
                       
                       $(this).click(function (){
                        if(lbxs_open==0)
                        {
                            window.location='kehu.html?g='+g_e+'&'+bianjisetf1+'='+encodeURI(encodeURI($(this).attr("name")));
                        }else
                        {
                            window.open('kehu.html?g='+g_e+'&'+bianjisetf1+'='+encodeURI(encodeURI($(this).attr("name"))));
                        }         
                       
                    })
                    })
                    
                },
              complete:function(){
                el.loading("hide");
                console.log('mission acomplete.')}
              
        });
    }
    
    
   
    
</script> </div>
    </body>
</html>