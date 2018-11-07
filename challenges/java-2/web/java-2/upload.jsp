<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = "/usr/local/tomcat/webapps/java-2/uploads/";

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      factory.setRepository(new File("/tmp/"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
               String documentName = UUID.randomUUID().toString().substring(0, 8) + "_";

               // Write the file
               if( fileName.lastIndexOf("\\") > fileName.lastIndexOf("/") ) {
                  documentName += fileName.substring(fileName.lastIndexOf("\\"));
               } else if (fileName.lastIndexOf("/") >= 0) {
                  documentName += fileName.substring(fileName.lastIndexOf("/"));
               } else {
                  documentName += fileName;
                }

               file = new File(filePath + documentName);
               fi.write(file);

               response.sendRedirect("/java-2/uploads/" + documentName);
            }
         }
      } catch(Exception ex) {
         %><%= ex.toString() %><%
      }
   }
%>
Upload failed !