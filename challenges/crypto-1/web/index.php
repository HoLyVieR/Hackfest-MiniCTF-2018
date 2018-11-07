<?php
require('config.php');

if (isset($_GET['item']) && isset($_GET['qte']) && isset($_GET['message']) && !isset($_GET['signature'])) {
	switch ($_GET['item']) {
		case 'flag':
			$message = "You can't get the flag this way !";
			break;

		case 'message':
			$signature = hash_hmac("sha256",  $_GET['qte'] . $_GET['item'] . $_GET['message'], $key);
			header("Location: index.php?qte={$_GET['qte']}&item={$_GET['item']}&message={$_GET['message']}&signature=$signature");
			exit();
	}
}

if (isset($_GET['item']) && isset($_GET['qte']) && isset($_GET['message']) && isset($_GET['signature'])) {
	$signature = hash_hmac("sha256",  $_GET['qte'] . $_GET['item'] . $_GET['message'], $key);

	if ($signature === $_GET['signature']) {
		switch ($_GET['item']) {
			case 'message':
				$message = 'Message : Hello World !';
				break;

			case 'flag':
				$message = $flag;
				break;
		}
	} else {
		$message = 'Signature check failed !';
	}
}

?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>

  <div class="container">
  <h3>Store</h3>
  <form method="GET" action="index.php">
    <div class="form-group">
      <label for="item">Item</label>
      <select name="item" id="item">
      	<option value="message">A Message</option>
      	<option value="flag">Flag</option>
      </select>
    </div>

    <div class="form-group">
      <label for="qte">Quantity</label>
      <input type="text" name="qte" id="qte" />
    </div>

    <div class="form-group">
      <label for="message">Message</label>
      <input type="text" name="message" id="message" />
    </div>

    <button type="submit" class="btn btn-primary">Buy</button>
  </form>

  <?php if (isset($message)) { ?>
  	<div class="alert alert-error"><?php echo htmlentities($message); ?></div>
  <?php  } ?>

  </body>
</html>