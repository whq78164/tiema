﻿<?php
define('IN_ECS', true);


require (dirname(__file__) . '/includes/init.php');
include ('page.php');


if (empty($_REQUEST['act'])) {
    $_REQUEST['act'] = 'default';
} else {
    $_REQUEST['act'] = trim($_REQUEST['act']);
}

if ($_REQUEST['act'] == 'default') {
///修改1,查询语句
    //$sql="select id,vipcard_sn,vipcard_name from vipcard";
    
   // $vipcard_list = get_vipcard_list($Num,"vipcard",$sql);
    
    //$smarty->assign('vipcard_list', $vipcard_list['items']);
    
    $smarty->assign('title', $aaa);
    $smarty->assign('p_Array', $vipcard_list['page']);
    $smarty->display('password.html');


}

if ($_REQUEST['act'] == 'edit_ps') {

     if(isset($_REQUEST['old_password'])){ $old=urlencode($_REQUEST['old_password']); }
     if(isset($_REQUEST['new_password'])){ $new=urlencode($_REQUEST['new_password']); }
     //echo $old;echo $new;
     $sql="select user_name from admin_user where password ='".md5($old)."' and user_name='". getlogin_name()."'";
     //echo $_COOKIE['n1'];
     $u_na = $GLOBALS['db']->getRow($sql);
     if(empty($u_na))
     {
        echo "2";
     }
     else
     {
        
        $sql_u="update admin_user set password='".md5($new)."' where user_name='". getlogin_name()."';";
        $u_na2 = $GLOBALS['db']->query($sql_u);
        echo "1";
     }
}


?>