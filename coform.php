<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['send'])){

   $name = $_POST['name'];  
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $req = $_POST['req'];
   $req = filter_var($req, FILTER_SANITIZE_STRING);
   $suggestions= $_POST['suggestions'];
   $suggestions = filter_var($suggestions, FILTER_SANITIZE_STRING);
   $procedure1 = $_POST['procedure1'];
   $procedure1 = filter_var($procedure1, FILTER_SANITIZE_STRING);

   $select_message = $conn->prepare("SELECT * FROM `custom_orders` WHERE name = ? AND req = ? AND suggestions = ? AND procedure1 = ?");
   $select_message->execute([$name, $req, $suggestions,$procedure1]);

   if($select_message->rowCount() > 0){
      $message[] = 'already submitted!';
   }else{

      $insert_message = $conn->prepare("INSERT INTO `custom_orders`(user_id, name, req, suggestions, procedure1) VALUES(?,?,?,?,?)");
      $insert_message->execute([$user_id, $name, $req, $suggestions, $procedure1]);

      $message[] = 'Recepie submitted successfully!';

   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Customised Order</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include 'components/user_header.php'; ?>
<!-- header section ends -->

<div class="heading">
   <h3>SUBMIT YOUR RECIPE</h3>
   <p><a href="home.php">Home</a> <span> / Customied order</span></p>
</div>

<!-- contact section starts  -->

<section class="contact">

   <div class="row">

      <div class="image">
         <img src="images/contact-img.svg" alt="">
      </div>

      <form action="" method="post">
         <h3>Recipe!</h3>
         <input type="text" name="name" maxlength="50" class="box" placeholder="Enter the  name of the recepie:" required>
         <input type="text" name="req" class="box" required placeholder="Required Materials: " maxlength="1000" ><br><br><br>
         <select id="ingrideints" class="box">
            <option value="ingrideints"> Select Ingridients</option><br><br>
            <option value="ingrideints"> SESAME OIL</option><br><br>
            <option value="ingrideints"> CHILLI POWDER</option><br><br>
            <option value="ingrideints"> NONE</option><br><br>

         </select><br><br>
         <input type ="text " class="box" name ="suggestions" requeired placeholder=" Suggestions:" maxlenmght="1000"> <br><br>
         <textarea name="procedure1" class="box" required placeholder="Recepie :" maxlength="500" cols="30" rows="10"></textarea>
         <input type="submit" value="Submit Recepie" name="send" class="btn">
      </form>

   </div>

</section>

<!-- contact section ends -->










<!-- footer section starts  -->
<?php include 'components/footer.php'; ?>
<!-- footer section ends -->








<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>