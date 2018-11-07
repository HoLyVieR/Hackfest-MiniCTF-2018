<html lang="en">
  <head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  <% // FLAG-4de984ea194fdfb0f9f331774d487657  %>
  <div class="container">
  <h3>Upload me !</h3>
  <form method="POST" action="upload.jsp" enctype="multipart/form-data">
    <div class="form-group">
      <label for="payload">File</label>
      <input type="file" name="payload" class="form-control" id="payload" />
    </div>
    <button type="submit" class="btn btn-primary">Submit !</button>
  </form>


  </body>
</html>
