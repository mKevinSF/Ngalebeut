<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

if(isset($_POST['order_btn'])){

   $name = mysqli_real_escape_string($conn, $_POST['nama']);
   $number = $_POST['nomorhp'];
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   $method = mysqli_real_escape_string($conn, $_POST['method']);
   $address = mysqli_real_escape_string($conn, 'Jl.'. $_POST['alamat'].', '. $_POST['provinsi'].', '. $_POST['negara'].', '. $_POST['kabkot'].', '. $_POST['kecamatan'] . ' - '.$_POST['kodepos']);
   $placed_on = date('d-M-Y');

   $cart_total = 0;
   $cart_products[] = '';

   $cart_query = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
   if(mysqli_num_rows($cart_query) > 0){
      while($cart_item = mysqli_fetch_assoc($cart_query)){
         $cart_products[] = $cart_item['name'].' ('.$cart_item['quantity'].') ';
         $sub_total = ($cart_item['price'] * $cart_item['quantity']);
         $cart_total += $sub_total;
      }
   }

   $total_products = implode(', ',$cart_products);

   $order_query = mysqli_query($conn, "SELECT * FROM `orders` WHERE name = '$name' AND number = '$number' AND email = '$email' AND method = '$method' AND address = '$address' AND total_products = '$total_products' AND total_price = '$cart_total'") or die('query failed');

   if($cart_total == 0){
      $message[] = 'Keranjangmu kosong!';
   }else{
      if(mysqli_num_rows($order_query) > 0){
         $message[] = 'Pesananmu sudah dipesan'; 
      }else{
         mysqli_query($conn, "INSERT INTO `orders`(user_id, name, number, email, method, address, total_products, total_price, placed_on) VALUES('$user_id', '$name', '$number', '$email', '$method', '$address', '$total_products', '$cart_total', '$placed_on')") or die('query failed');
         $message[] = 'order placed successfully!';
         mysqli_query($conn, "DELETE FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
      }
   }
   
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<div class="heading">
   <h3>Checkout</h3>
</div>

<section class="display-order">

   <?php  
      $grand_total = 0;
      $select_cart = mysqli_query($conn, "SELECT * FROM `cart` WHERE user_id = '$user_id'") or die('query failed');
      if(mysqli_num_rows($select_cart) > 0){
         while($fetch_cart = mysqli_fetch_assoc($select_cart)){
            $total_price = ($fetch_cart['price'] * $fetch_cart['quantity']);
            $grand_total += $total_price;
   ?>
   <p> <?php echo $fetch_cart['name']; ?> <span>(<?php echo 'Rp. '.$fetch_cart['price'].'/-'.' x '. $fetch_cart['quantity']; ?>)</span> </p>
   <?php
      }
   }else{
      echo '<p class="empty">Keranjang mu kosong!</p>';
   }
   ?>
   <div class="grand-total"> Total : <span>Rp. <?php echo $grand_total; ?>/-</span> </div>

</section>

<section class="checkout">

   <form action="" method="post">
      <h3>place your order</h3>
      <div class="flex">
         <div class="inputBox">
            <span>Nama penerima :</span>
            <input type="text" name="nama" required placeholder="Masukkan nama anda">
         </div>
         <div class="inputBox">
            <span>Nomor telepon :</span>
            <input type="number" name="nomorhp" required placeholder="Masukkan nomor telepon penerima">
         </div>
         <div class="inputBox">
            <span>Email:</span>
            <input type="email" name="email" required placeholder="Masukkan email penerima">
         </div>
         <div class="inputBox">
            <span>Metode pembayaran :</span>
            <select name="method">
               <option value="cash on delivery">Cash on Delivery</option>
               <option value="credit card">Credit Card</option>
               <option value="paypal">Paypal</option>
            </select>
         </div>
         <div class="inputBox">
            <span>Alamat penerima :</span>
            <input type="text" name="alamat" required placeholder="Masukkan alamat penerima">
         </div>
         <div class="inputBox">
            <span>Provinsi :</span>
            <input type="text" name="provinsi" required placeholder="Masukkan provinsi penerima">
         </div>
         <div class="inputBox">
            <span>Negara :</span>
            <input type="text" name="negara" required placeholder="Masukkan negara penerima">
         </div>
         <div class="inputBox">
            <span>Kabupaten / kota :</span>
            <input type="text" name="kabkot" required placeholder="Masukkan kabupaten / kota penerima">
         </div>
         <div class="inputBox">
            <span>Kecamatan / kelurahan :</span>
            <input type="text" name="kecamatan" required placeholder="Masukkan kecamatan / kelurahan">
         </div>
         <div class="inputBox">
            <span>Kode pos :</span>
            <input type="number" min="0" name="kodepos" required placeholder="Masukkan kode pos penerima">
         </div>
      </div>
      <input type="submit" value="Pesan sekarang" class="btn" name="order_btn">
   </form>

</section>









<?php include 'footer.php'; ?>

<!-- custom js file link  -->
<script src="js/script.js"></script>

</body>
</html>