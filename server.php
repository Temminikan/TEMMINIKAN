<style type="text/css">
    #comment_box{
        margin-top: 10px;
        padding: 5px;
        border: 1px solid #cbcbcb;
    }
    #comment_box > p:nth-child(1){
        color: blue;
    }
</style>


<?php
include("db.php");
if (isset($_POST['done'])) {
    $name = mysql_escape_string($_POST['username']);
    $comment = mysql_escape_string($_POST['comment']);

    //insert into database//

    mysql_query("INSERT INTO  comments{name,comment} VALUES('{$name}', '{$comment}')");
                    
    exit();
}
if (isset($_POST['display'])) {
    $result = mysql_query("SELECT * FROM comments");

    while ($row = mysql_fetch_array($result)) {
        ?>
<div id="comment_box">
    <p><?php echo $row['name'] ?></p>
    <p><?php echo $row['comment']?></p>
</div>
        <?php

    }
    exit();
}
?>
