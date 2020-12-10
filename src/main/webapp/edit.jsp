<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.factoryProvider.*, org.hibernate.*, com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">

		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit page</h1>
		
		<%
		
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		
		Session s = factoryProvider.getFactory().openSession();
		
		Note note =(Note) s.get(Note.class, noteId);
		
		%>
		
				<!-- Form -->

		<form action="UpdateServlet" method="post">
		
		<input value="<%=note.getId()%>" name="noteId" type="hidden""/>
		
			<div class="form-group">
				<label for="title">Note Title</label>
				 
				<input
				name="title"
				required="required" type="text" 
				class="form-control" 
				id="title"
				aria-describedby="noteHelp" 
				placeholder="Enter title here"
				value="<%= note.getTitle() %>"
				/> 
	
			</div>
			<div class="form-group">
			
				<label for="content">Note Content</label> 

				<textarea
				name="content" 
				required="required"
				id="content" 
				placeholder="Enter content here"
				class="form-control"
				style="height: 300px"
				><%= note.getContent() %>
				</textarea>
			</div>

			<div class="container text-center">
			
			<button type="submit" class="btn btn-success">Save</button>
			
			</div>
			
		</form>
		
	</div>

</body>
</html>