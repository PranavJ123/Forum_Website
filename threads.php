<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
    #ques{
      min-height:433px;
    }
    </style>

    <title>iDiscuss - Coding Forums</title>
  </head>
  <body>
  <?php 
  include '_dbconnect.php';
  ?>
  <?php
  include '_header.php';
  ?>
 
  <?php
  $id = $_GET['catid'];
  $sql="SELECT * FROM `categories` WHERE category_id=$id";
  $result=mysqli_query($conn,$sql);
  while($row = mysqli_fetch_assoc($result)){
  $catname = $row['category_name'];
  $catdesc = $row['category_description'];
  }
  ?>

  <?php
  $showAlert = false;
  $method = $_SERVER['REQUEST_METHOD'];
  if($method=='POST'){
    $showAlert = true;
    $th_title = $_POST['title'];
    $th_desc = $_POST['desc'];
    $sno = $_POST['sno']; 
   
    $th_title = str_replace("<","&lt;", $th_title );
    $th_title = str_replace("<","&lt;", $th_title ); 
    
    $th_desc = str_replace("<","&lt;", $th_desc);   
    $th_desc = str_replace("<","&lt;", $th_desc ); 
    $sql="INSERT INTO `threads` (`thread_title`, `thread_desc`, `thread_cat_id`, `thread_user_id`, `timestamp`) VALUES ('$th_title', '$th_desc', '$id', '$sno', current_timestamp())";
    $result=mysqli_query($conn,$sql);
    if($showAlert){
      echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
      <strong>Success!</strong> Your thread has been added.Please wait for community to respond.
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>';
    }
  }
  ?>
  <div class="container my-4">
  <div class="jumbotron">
  <h1 class="display-4">Welcome to <?php echo $catname;?> Forums.</h1>
  <p class="lead"><?php echo $catdesc;?> </p>
  <hr class="my-4">
  <p>No Spam / Advertising / Self-promote in the forums is not allowed. Do not post copyright-infringing material. Do not post “offensive” posts, links or images.Do not cross post questions.Do not PM users asking for help.Remain respectful of other members at all times.</p>
  <p class="lead">
    <a class="btn btn-success btn-lg" href="#" role="button">Learn more</a>
  </p>

</div>
</div>
<?php
 if(isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true ){
echo '<div class="container">
<h1 class = "py-2">Start a Discussion</h1>
<form action ="'.$_SERVER["REQUEST_URI"].'" method ="post" >
  <div class="form-group">
    <label for="exampleInputEmail1">Problem Title</label>
    <input type="text" class="form-control" id="title" name = "title" aria-describedby="emailHelp" placeholder="Enter your problem">
</div>
<input type="hidden" name="sno" value = "'. $_SESSION["sno"].'">
  <div class="form-group">
    <label for="exampleFormControlTextarea1" >Elaborate your concern</label>
    <textarea class="form-control" id="desc" name = "desc" rows="3"placeholder = "Type your problem"></textarea>
  </div>

  <button type="submit" class="btn btn-success my-2">Submit</button>
</form>
</div>';
 }
 else{
   echo '<div class="container">
   <h1 class = "py-2">Start a Discussion</h1>
   <p class="lead"><b>You are not logged in .Please login to start a discussion.</b></p>
   </div>';
 }
?>

  
  <div class="container mb-5" id ="ques">
  <h1>Browse Questions</h1>
  <?php
  $id = $_GET['catid'];
  $noResult = true;
  $sql="SELECT * FROM `threads` WHERE thread_cat_id=$id";
  $result=mysqli_query($conn,$sql);
  while($row = mysqli_fetch_assoc($result)){
    $noResult = false;
  $id = $row['thread_id'];
  $title = $row['thread_title'];
  $desc = $row['thread_desc'];
  $thread_time = $row['timestamp'];
  $thread_user_id = $row['thread_user_id'];
  $sql2 = "SELECT user_email FROM `users` WHERE sno = '$thread_user_id'";
  $result2 = mysqli_query($conn , $sql2);
  $row2 = mysqli_fetch_assoc($result2);
   echo '<div class="media my-3">
  <img class="mr-3" src="img/user default.jpg" width=54px alt="...">
  <div class="media-body">'.
    '<h5 class="mt-0"><a class="text-dark" href ="questions.php?threadid='. $id .'">'. $title .'</a></h5>
    '. $desc .' </div> '.' <p class="font-weight-bold my-0"> Asked By: '.  $row2['user_email'].' at '. $thread_time.'</p>'.
    '</div>';
  }
  if($noResult){
    echo '<div class="jumbotron jumbotron-fluid">
    <div class="container">
      <h1 class="display-4">No Threads Found</h1>
      <p class="lead">Be the first person to ask the question.</p>
    </div>
  </div>';
  }
  ?>
 
 

 
</div>
  <?php
  include '_footer.php';
  ?>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>