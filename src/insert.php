<?php
include("config.php");

$mysqli = new mysqli(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE);
mysqli_query($mysqli,"set names utf8");
ini_set("upload_max_filesize", "8M");

if (($_SESSION['username'])=='admin'):{
?>

<!DOCTYPE html>
<html lang="zh"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="./_files/bootstrap.min.css">
    <link rel="stylesheet" href="./_files/main.css">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title>202203Scratch三级真题</title>
</head>
<body class="text-center">
<form class="form-getflag" method="post" enctype="multipart/form-data" action="insert.php">
    <div id="app">
        <h1>题目录入</h1>
        <br>
        <div class="card">
            <div class="card-body question-main">
                <div class="question-q">
                    <h2>题目：</h2>
                </div>
                <textarea style="width:500px;height:50px;" name="question" id="question"></textarea><br>
                <div class="input-group input-group-sm mb-3">
                    <div class="question-q">
                        <h2>题目图片：</h2>
                    </div>
                    <div>
                        <input type="file" multiple="multiple" accept="image/*" name="image">
                    </div>
                    <table border="2" width="500" align="center">
                        <tr>
                            <td ><label for="username">是否判断题</label></td>
                            <td>
                                <input type="radio" name="judge" id="judge" value="1">是
                                <input type="radio" name="judge" id="judge" value="2">否
                            </td>
                        </tr>
                        <tr>
                            <td ><label for="username">选项A</label></td>
                            <td>
                                <input type="text" name="qa" id="qa" placeholder="(判断题默认√可不填)">
                            </td>
                        </tr>
                        <tr>
                            <td ><label for="username">选项B</label></td>
                            <td>
                                <input type="text" name="qb" id="qb" placeholder="(判断题默认X可不填)">
                            </td>
                        </tr>
                        <tr>
                            <td ><label for="username">选项C</label></td>
                            <td>
                                <input type="text" name="qc" id="qc" placeholder="(判断题可不填)">
                            </td>
                        </tr>
                        <tr>
                            <td ><label for="username">选项D</label></td>
                            <td>
                                <input type="text" name="qd" id="qd" placeholder="(判断题可不填)">
                            </td>
                        </tr>
                    </table>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="ans">正确答案</span>
                            <tr>
                                <input type="radio" name="ans" aria-describedby="ans" value="1" class="button_position">
                                A正确&emsp;&emsp;&emsp;&emsp;
                            </tr>
                            <tr>
                                <input type="radio" name="ans" aria-describedby="ans" value="2" class="button_position">
                                B正确&emsp;&emsp;&emsp;&emsp;
                            </tr>
                            <tr>
                                <input type="radio" name="ans" aria-describedby="ans" value="3" class="button_position">
                                C正确&emsp;&emsp;&emsp;&emsp;
                            </tr>
                            <tr>
                                <input type="radio" name="ans" aria-describedby="ans" value="4" class="button_position">
                                D正确&emsp;&emsp;&emsp;&emsp;
                            </tr>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <input type="submit" class="btn btn-lg btn-primary" value="提交" name="submit">
    </div>
</form>
<?php
define("UPLOAD_PATH", "img");

if (isset($_POST['question'])&&isset($_POST['judge'])&&isset($_POST['ans'])){
    $id = $mysqli->query("select ID from challengesAll order by id DESC LIMIT 1")->fetch_row()[0]+1;

    if (isset($_FILES)) {
        $temp_file = $_FILES['image']['tmp_name'];
        $file_name = $_FILES['image']['name'];
        $ext = pathinfo($file_name,PATHINFO_EXTENSION);
        if(in_array($ext, ['jpg', 'png', 'gif'])) {
            $new_file_name = $id."-titleImg.".$ext;
            $img_path = UPLOAD_PATH . '/' . $new_file_name;

            if (move_uploaded_file($temp_file, $img_path)){
                if ($_POST['judge']==1){
                    $type = 2;
                    $query = "insert into challengesAll VALUES ('$id', '$type', '".$_POST['question']."', '$img_path', '√', 'X', NULL, NULL, '".$_POST['ans']."');";
                }else {
                    $type = 1;
                    $query = "insert into challengesAll VALUES ('$id', '$type', '".$_POST['question']."', '$img_path', '".$_POST['qa']."', '".$_POST['qb']."', '".$_POST['qc']."', '".$_POST['qd']."', '".$_POST['ans']."');";
                }

                if ($mysqli->query($query)===TRUE) {
                    echo "<script>alert(\"录入成功！\");</script>";
                }
            } else {
                if ($_FILES['image']['error']==1){
                    echo "图片过大！";
                }
                exit("图片上传失败！");
            }
        }else {
            exit('仅允许上传 jpg/png/gif');
        }
    }
}

}else: ?>
    <h1>只有admin可以录入题目</h1><br>
    <a href='index.php'>返回主页</a>
<?php  endif; ?>
</body></html>



