<?php
  // FLAG-d011aa1584f01fbd73d10940c2f037ad
  if (isset($_GET['path'])) {
    $ch = curl_init(); 
    curl_setopt($ch, CURLOPT_URL, $_GET['path'] . '.txt');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
    $content = curl_exec($ch); 
  }
?>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>
    <div class="container">
      <h3>ASCII Art Viewer #2</h3>
      <form method="GET">
        <div class="form-group">
          <label for="path">ASCII Art</label>
          <select name="path" class="form-control" id="path">
            <option value="file:///var/www/html/uploads/cats">Cat</option>
            <option value="file:///var/www/html/uploads/dog">Dog</option>
            <option value="file:///var/www/html/uploads/zebra">Zebra</option>
          </select>
        </div>

        <button type="submit" class="btn btn-primary">View</button>
      </form>

      <?php if (isset($content)) { ?>
      <br />
      <pre><?php echo $content; ?></pre>
      <?php } ?>
    </div>
  </body>
</html>
