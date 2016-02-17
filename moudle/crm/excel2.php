<?php
define('IN_ECS', true);


require (dirname(__file__) . '/includes/init.php');

error_reporting(null);
//require_once 'Classes/PHPExcel/Reader/Excel2007.php';
require_once 'phpexcel/PHPExcel/Reader/Excel5.php';
require_once 'phpexcel/PHPExcel/Reader/Excel2007.php';
include 'phpexcel/PHPExcel/IOFactory.php';
/*
* 本函数用于将数组读入excel表单
* $excelname,输出表单名
* $title,表头
* $data数据
* $times,一维数组还是二给数组，1为一维，2为二维
*/


set_time_limit(0);
function arrayToExcel($excelname, $title, $data, $times = 1,$arrtype=1)
{
    $row = 1;
    $objPHPExcel = new PHPExcel();
    $objPHPExcel->setActiveSheetIndex(0);
    $objPHPExcel->getActiveSheet()->setTitle($title);
    $objPHPExcel->getDefaultStyle()->getFont()->setName('Arial');
    $objPHPExcel->getDefaultStyle()->getFont()->setSize(10);
    //$letters_arr = array(1=>'A',2=>'B',3=>'C',4=>'D',5=>'E',6=>'F',7=>'G',8=>'H',9=>'I',10=>'J',11=>'K',12=>'L',13=>'M', 14=>'N',15=>'O',16=>'P',17=>'Q',18=>'R',19=>'S',20=>'T',21=>'U',22=>'V',23=>'W',24=>'X',25=>'Y',26=>'Z');
    $letters_arr = array(
        1 => A,
        2 => B,
        3 => C,
        4 => D,
        5 => E,
        6 => F,
        7 => G,
        8 => H,
        9 => I,
        10 => J,
        11 => K,
        12 => L,
        13 => M,
        14 => N,
        15 => O,
        16 => P,
        17 => Q,
        18 => R,
        19 => S,
        20 => T,
        21 => U,
        22 => V,
        23 => W,
        24 => X,
        25 => Y,
        26 => Z);
    //add data
    $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    if ($times == 2) {
        $row = 1;
        //	$objPHPExcel->getActiveSheet()->setCellValue('A1', $title);//为单元格赋值

        //$objPHPExcel->getActiveSheet()->getStyle('A1')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);//设置水平居中
        //设置A1单元格加粗，居中：
        $styleArray1 = array(
            'font' => array(
                'bold' => true,
                'color' => array('argb' => '00000000', ),
                
                ),
            'alignment' => array('horizontal' => PHPExcel_Style_Alignment::
                    HORIZONTAL_CENTER, ),
            'fill' => array (
                         'type'       => PHPExcel_Style_Fill::FILL_GRADIENT_LINEAR ,
                         'rotation'   => 90,
                         'startcolor' => array (
                               'argb' => 'FFA0A0A0'
                         ),
                         'endcolor'   => array (
                               'argb' => 'FFFFFFFF'
                         ))
            );

        // 将A1单元格设置为加粗，居中
        
        $objPHPExcel->getActiveSheet()->getStyle('A1')->applyFromArray($styleArray1);
        foreach ($data as $key => $val) {
            $lan = count($val);
            for($i=0;$i<$lan;$i++)
            {
                $k=$i+1;
                $objPHPExcel->getActiveSheet()->getStyle(''.$letters_arr[$k].'1')->applyFromArray($styleArray1);
                $objPHPExcel->getActiveSheet()->getStyle( ''.$letters_arr[$k].'1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
                $objPHPExcel->getActiveSheet()->getStyle( ''.$letters_arr[$k].'1')->getFill()->getStartColor()->setARGB('#4cdfff');
            }
            //$objPHPExcel->getActiveSheet()->mergeCells('A1:' . $letters_arr[$lan] . '1');
            $hight_temp = 12.75;
            $key2num = 1; //当前列
            foreach ($val as $key2 => $val2) {
                $width = 8.43 + 0.67 * (strlen($val2) - 10); //长度超过13的加宽
                $times = ceil($width / 45); //长度超过45的加行高
                $width = 20;
                $hight = 12.75;
                $hight = $times > 1 ? $hight * $times : $hight; //设置行高
                $hight_temp = max($hight, $hight_temp);
                $objPHPExcel->getActiveSheet()->getColumnDimension($letters_arr[$key2num])->
                    setWidth($width); //设置列宽
                //$objPHPExcel->getActiveSheet()->getColumnDimension($letters_arr[$key2num])->setAutoSize(true); //设置列宽自适应
                $objPHPExcel->getActiveSheet()->getRowDimension($row)->setRowHeight($hight_temp); //设置行高
                $objPHPExcel->getActiveSheet()->getStyle($letters_arr[$key2num] . $row)->
                    getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER); //设置垂直居中
                $objPHPExcel->getActiveSheet()->getStyle($letters_arr[$key2num] . $row)->
                    getAlignment()->setWrapText(true); //设置文字自动换行
                $objPHPExcel->getActiveSheet()->setCellValueExplicit($letters_arr[$key2num] . $row,
                    $val2); //为单元格赋值
                $key2num++;
            }
            $row++;
        }
    } elseif ($times == 1) {
        $key2num = 1; //当前行
        foreach ($data as $key => $val) {
            $width = 8.43 + 0.67 * (strlen($val) - 10); //长度超过13的加宽
            $times = ceil($width / 45); //长度超过45的加行高
            $width = $width < 45 ? $width : 45;
            $hight = 12.75;
            $hight = $times > 1 ? $hight * $times : $hight; //设置行高
            $objPHPExcel->getActiveSheet()->getStyle($letters_arr[$key2num] . $row)->
                getAlignment()->setVertical(PHPExcel_Style_Alignment::VERTICAL_CENTER); //设置垂直居中
            $objPHPExcel->getActiveSheet()->getColumnDimension($letters_arr[$key2num])->
                setWidth($width); //设置列宽
            $objPHPExcel->getActiveSheet()->getRowDimension($key2num - 1)->setRowHeight($hight); //设置行高
            $objPHPExcel->getActiveSheet()->getStyle($letters_arr[$key2num] . $row)->
                getAlignment()->setWrapText(true); //设置文字自动换行
            $objPHPExcel->getActiveSheet()->setCellValue($letters_arr[$key2num] . $row, $val); //为单元格赋值
            $key2num++;
        }
    } else {
        exit('参数有问题');
    }
    $title = iconv("utf-8", "gbk", $excelname);
    $file = $title . '.xls';
    //phpexcel 保存时可以选择路径 开始
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header("Content-Disposition: attachment;filename=$file");
    header('Pragma:public');
    header('Content-Type:application/x-msexecl;name=$file');
    header("Content-Disposition:inline;filename=$file");

    header('Cache-Control: max-age=0');
    if($arrtype==2)
    {
        $objWriter->save('phpexcel/tempfile/'.$file); 
    }
    else
    {
         $objWriter->save('php://output');
    }
    
   
    //phpexcel 保存时可以选择路径结束
    //$objWriter->save($file);//默认导出phpexcel 保存时不可以选择路径
}



function uploadFile($file,$filetempname,$import,$fname) 
{
    //自己设置的上传文件存放路径
    $filePath = 'phpexcel/temp/';
    $str = "";   
    //下面的路径按照你PHPExcel的路径来修改
    //require_once 'phpexcel/PHPExcel.php';
//    require_once 'phpexcel/PHPExcel/IOFactory.php';
//    require_once 'phpexcel/PHPExcel/Reader/Excel5.php';

    //注意设置时区
    $time=date("y-m-d-H-i-s");//去当前上传的时间 
    //获取上传文件的扩展名
    $extend=strrchr ($file,'.');
    //上传后的文件名
    $name=$time.$extend;
    $uploadfile=$filePath.$name;//上传后的文件名地址 
    
    //echo $filetempname;exit;
    //move_uploaded_file() 函数将上传的文件移动到新位置。若成功，则返回 true，否则返回 false。
    $result=move_uploaded_file($filetempname,$uploadfile);//假如上传到当前目录下
    //echo $result;
    if($result) //如果上传文件成功，就执行导入excel操作
    {
        //include "conn.php";
        
        //判断是否格式正确
        $file_types = explode ( ".", $_FILES ['inputExcel']['name'] );     
        $file_type = $file_types [count ( $file_types ) - 1];
 
        if(strtolower ( $file_type ) == "xls")
        {
            $objReader = PHPExcel_IOFactory::createReader('Excel5');//use excel2007 for 2007 format 
        }
        elseif(strtolower ( $file_type ) == "xlsx")
        {
            $objReader = PHPExcel_IOFactory::createReader('Excel2007');//use excel2007 for 2007 format 
        }
        else
        {
            $msg= "上传格式错误";
            return $msg;
        }
        
        $objPHPExcel = $objReader->load($uploadfile); 
        $sheet = $objPHPExcel->getSheet(0); 
        $highestRow = $sheet->getHighestRow();           //取得总行数 
        $highestColumn = $sheet->getHighestColumn(); //取得总列数
        
        /* 第一种方法

        //循环读取excel文件,读取一条,插入一条
        for($j=1;$j<=$highestRow;$j++)                        //从第一行开始读取数据
        { 
            for($k='A';$k<=$highestColumn;$k++)            //从A列读取数据
            { 
                //
                这种方法简单，但有不妥，以'\\'合并为数组，再分割\\为字段值插入到数据库
                实测在excel中，如果某单元格的值包含了\\导入的数据会为空        
                //
                $str .=$objPHPExcel->getActiveSheet()->getCell("$k$j")->getValue().'\\';//读取单元格
            } 
            //echo $str; die();
            //explode:函数把字符串分割为数组。
            $strs = explode("\\",$str);
            $sql = "INSERT INTO te(`1`, `2`, `3`, `4`, `5`) VALUES (
            '',
            '',
            '',
            '',
            '')";
            //die($sql);
            if(!mysql_query($sql))
            {
                return false;
                echo 'sql语句有误';
            }
            $str = "";
        }  
        unlink($uploadfile); //删除上传的excel文件
        $msg = "导入成功！";
        */

        /* 第二种方法*/
        $objWorksheet = $objPHPExcel->getActiveSheet();
        //echo $objWorksheet;
        $highestRow = $objWorksheet->getHighestRow(); 
        //echo 'highestRow='.$highestRow;
//        echo "<br>";
        $highestColumn = $objWorksheet->getHighestColumn();
        $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);//总列数
        //echo 'highestColumnIndex='.$highestColumnIndex;
//        echo "<br>";
        $headtitle=array(); 
        
        $import_sl = explode(',',$import);
        
        
        for ($row = 2;$row <= $highestRow;$row++) 
        {
            $st='';
            $fl='';
            $stone='';
            $strs=array();
            //注意highestColumnIndex的列数索引从0开始
            
            //for ($col = 0;$col < $highestColumnIndex;$col++)
            for ($col = 0;$col < count($import_sl);$col++)
            {
                $strs[$col] =$objWorksheet->getCellByColumnAndRow($col, $row)->getValue();
                $st.="'".$strs[$col]."',";
                
                
                if($col==0)
                {
                    $stone="'".$strs[$col]."'";
                    $fl=$strs[$col];
                }
            }    
            
            $st=substr($st, 0, -1);
            
             //需要判断是否为空和是否重复 
            $get="select * from ".$fname." where ".$import_sl[0]."=".$stone."";
            $get = $GLOBALS['db']->getOne($get);
            if($get)
            {
                $msg2.="<span style='color:red;'>第 ".$row." 行导入失败(数据已存在), ".$fl."</span><br>";
            }else
            {
                $sql="insert into ".$fname."(".$import.") values (".$st.")";
                
                $msg3.="<span style='color:green;'>第 ".$row." 行导入成功, ".$fl."</span><br>";
                //echo $sql;
                $res = $GLOBALS['db']->query($sql);
                //print_r($strs);
            }
           
        }
        $msg=$msg3."<br>".$msg2;
    }
    else
    {
       $msg = "导入失败！";
    } 
    return $msg;
}

if (empty($_REQUEST['m'])) {
    $_REQUEST['m'] = 'default';
} else {
    $_REQUEST['m'] = trim($_REQUEST['m']);
}




if ($_REQUEST['m'] == 'fjsx1mx') {
    $sql = "select sx_sn,sx_name,p_id,note,action_url,img_1  from fjsx1mx order by id desc";

    $res = $GLOBALS['db']->getAll($sql);
    
    $zdm = explode(',','代码,名称,上级小类代码,备注,跳转url,图片1'); 
    
    
    $arr = array($zdm);
    for ($i = 0; $i < count($res); $i++) {
        array_push($arr, $res[$i]);
    }

    arrayToExcel('小类项目', '小类项目', $arr, 2,1);

}
if ($_REQUEST['m'] == 'feedback') {
    $sql = "select feedback_sn,feedback_name,note,fb_type,menber_sn,menber_id,lianxi,kefuhuifu  from feedback order by id desc";

    $res = $GLOBALS['db']->getAll($sql);
    
    $zdm = explode(',','反馈代码,反馈名字,描述,类型,反馈人,反馈人id,联系人,客服回复'); 
    
    
    $arr = array($zdm);
    for ($i = 0; $i < count($res); $i++) {
        array_push($arr, $res[$i]);
    }

    arrayToExcel('问题反馈', '问题反馈', $arr, 2,1);

}
if ($_REQUEST['m'] == 'shangpinliushuimx') {
    $sql = "select liushui_sn,code,is_use,scan_cs  from shangpinliushuimx order by id desc";

    $res = $GLOBALS['db']->getAll($sql);
    
    $zdm = explode(',','流水号代码,条码,是否已使用(0未使用,1使用),扫描次数'); 
    
    
    $arr = array($zdm);
    for ($i = 0; $i < count($res); $i++) {
        array_push($arr, $res[$i]);
    }

    arrayToExcel('流水号明细', '流水号明细', $arr, 2,1);

}

if ($_REQUEST['m'] == 'dr_color') {
    
    if($_POST['leadExcel'] == "true")
    {
        $filename = $_FILES['inputExcel']['name'];
        $tmp_name = $_FILES['inputExcel']['tmp_name'];
        $msg = uploadFile($filename,$tmp_name,'','color');
        //echo $msg;
    }
    
    $smarty->assign('error_msg', $msg);
    $smarty->display('f/excel/excel_color.html');
    

}
if ($_REQUEST['m'] == 'dr_fjsx1mx') {
    
    if($_POST['leadExcel'] == "true")
    {
        $filename = $_FILES['inputExcel']['name'];
        $tmp_name = $_FILES['inputExcel']['tmp_name'];
        $msg = uploadFile($filename,$tmp_name,'sx_sn,sx_name','fjsx1mx');
        //echo $msg;
    }
    
    $smarty->assign('error_msg', $msg);
    $smarty->display('f/excel/excel_fjsx1mx.html');
    

}
if ($_REQUEST['m'] == 'dr_feedback') {
    
    if($_POST['leadExcel'] == "true")
    {
        $filename = $_FILES['inputExcel']['name'];
        $tmp_name = $_FILES['inputExcel']['tmp_name'];
        $msg = uploadFile($filename,$tmp_name,'feedback_sn,feedback_name,note,fb_type,menber_sn,menber_id,lianxi,kefuhuifu','feedback');
        //echo $msg;
    }
    
    $smarty->assign('error_msg', $msg);
    $smarty->display('f/excel/excel_feedback.html');
    

}
if ($_REQUEST['m'] == 'dr_shangpinliushuimx') {
    
    if($_POST['leadExcel'] == "true")
    {
        $filename = $_FILES['inputExcel']['name'];
        $tmp_name = $_FILES['inputExcel']['tmp_name'];
        $msg = uploadFile($filename,$tmp_name,'liushui_sn,code,is_use,scan_cs','shangpinliushuimx');
        //echo $msg;
    }
    
    $smarty->assign('error_msg', $msg);
    $smarty->display('f/excel/excel_shangpinliushuimx.html');
    

}




?>