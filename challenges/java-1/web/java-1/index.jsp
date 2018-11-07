<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>

  	<%
		// FLAG-27b0398705517a9e0a4caba46b3c36be
  		if (request.getParameter("payload") != null) {
  			byte[] payload = java.util.Base64.getDecoder().decode(request.getParameter("payload"));
  			ObjectInputStream ois = new ObjectInputStream(new ByteArrayInputStream(payload));
  	%>
  		<div class="well"><%= ois.readObject().toString() %></div>
  	<%
  		}
  	%>

  <div class="container">
  <h3>Deserialize me !</h3>
  <form method="GET">
    <div class="form-group">
      <label for="payload">Payload (Base64)</label>
      <textarea name="payload" class="form-control" id="payload"></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Submit !</button>
  </form>


  </body>
</html>
