<?php

function cj_qrcode_list($Nu, $tb)
{
    $sql = "select id,
            openid,
            issubs,
            cj_sn,
            cj_name,
            cj_type,
            qrcid,
            tzsy,
            sort_no,
            add_time,
            last_update,
            last_update_2 
            from cj_qrcode_stat";
    //��עʱ��,id,����,ʡ�����ң�ͼƬ,�û��ǳ�,


    if (isset($_REQUEST['Action'])) {
        $filer = $_REQUEST['Action'];
    }

    if (isset($_REQUEST['m_key'])) {
        $filer1 = " and ( cj_sn like '%" . trim($_REQUEST['m_key']) .
            "%' or cj_name like '%" . trim($_REQUEST['m_key']) . "%' or openid like '%" . trim($_REQUEST['m_key']) . "%')";
    } else {
        $filer1 = '';
    }

    $action_list = array();
    $filer = " where 1=1 $filer1 ";
    $res2 = get_table_count($tb, $filer);
    $obj = get_page($res2, $Nu);


    //$sql="select id,order_info_sn,order_info_name,order_info_outer_name,order_info_note_1,order_info_note_2,order_info_note_3,order_info_note_4,order_info_note_5,order_info_name_eg,zz,tzsy,action_url,last_update,last_update_2,start_time,end_time,sort_no  from order_info ";
    $sql = $sql . $filer ."order by add_time desc". " " . $obj['limit_obj'] . ";";
    //$sql = $sql . $filer . " order  by -sort_no  desc " . $obj['limit_obj'] . ";";
    $res = $GLOBALS['db']->getAll($sql);

    return array('item' => $res, 'page' => $obj);

}


function page_count($obj, $page_no, $page_num)
{
    if (isset($obj)) {
        $obj = $obj;
    }
    if (isset($page_no)) {
        $page_no = $page_no;
    } else {
        $page_no = 1;
    }
    if (isset($page_num)) {
        $page_num = $page_num;
    } else {
        $page_num = 20;
    }

}












?>