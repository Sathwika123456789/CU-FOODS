<?php

include '../components/connect.php';

session_start();

$admin_id = $_SESSION['admin_id'];

if(!isset($admin_id)){
   header('location:admin_login.php');
}

if(isset($_GET['delete'])){
   $delete_id = $_GET['delete'];
   $delete_custom_orders = $conn->prepare("DELETE FROM `custom_orders` WHERE user_id = ?");
   $delete_custom_orders->execute([$delete_id]);
   header('location:cuorder.php');
}
if(isset($_POST['update_payment'])){

   $order_id = $_POST['order_id'];
   $payment_status = $_POST['payment_status'];
   $update_status = $conn->prepare("UPDATE `custom_orders` SET payment_status = ? WHERE user_id = ?");
   $update_status->execute([$payment_status, $order_id]);
   $message[] = 'payment status updated!';

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Customised Orders</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../components/admin_header.php' ?>

<!-- messages section starts  -->

<section class="messages">

   <h1 class="heading">Customised Orders</h1>

   <div class="box-container">

   <?php
      $select_custom_orders = $conn->prepare("SELECT * FROM `custom_orders`");
      $select_custom_orders->execute();
      if($select_custom_orders->rowCount() > 0){
         while($fetch_custom_orders = $select_custom_orders->fetch(PDO::FETCH_ASSOC)){
   ?>
   <div class="box">
      <p> Name of the Recipe  : <span><?= $fetch_custom_orders['name']; ?></span> </p>
      <p> Required Materials : <span><?= $fetch_custom_orders['req']; ?></span> </p>
      <p> Suggestions : <span><?= $fetch_custom_orders['suggestions']; ?></span> </p>
      <p> Procedure : <span><?= $fetch_custom_orders['procedure1']; ?></span> </p>
      <form action="" method="POST">
         <input type="hidden" name="order_id" value="<?= $fetch_custom_orders['user_id']; ?>">
         <select name="payment_status" class="drop-down">
            <option value="" selected disabled><?= $fetch_custom_orders['payment_status']; ?></option>
            <option value="pending">pending</option>
            <option value="completed">completed</option>
         </select>
         <div class="flex-btn">
            <input type="submit" value="update" class="btn" name="update_payment">
            <a href="cuorder.php?delete=<?= $fetch_custom_orders['user_id']; ?>" class="delete-btn" onclick="return confirm('delete this Customised order?');">delete</a>
         </div>
      </form>
   </div>
   <?php
         }
      }else{
         echo '<p class="empty">you have no Orders</p>';
      }
   ?>

   </div>

</section>

<!-- messages section ends -->









<!-- custom js file link  -->
<script src="../js/admin_script.js"></script>

</body>
</html>