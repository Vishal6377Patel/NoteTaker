<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.*"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit Your Note</h1>
		<br>
		<%
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note)s.get(Note.class,noteId);
		%>
		<!-- this is edit form  -->
		<form action="UpdateServlet" method="post">
			<input value="<%= note.getId() %>" name="noteId" type="hidden" />
			<div class="form-group">
				<label for="title">Note title</label> <input required
					name="title"
					type="text" class="form-control" id="title" placeholder="Enter here"
					aria-describedby="emailHelp" value="<%= note.getTitle() %>">
			</div>
			
			<div class="form-group">
				<label for="content">Note content</label>
				<textarea required name="content" id="content" placeholder="Enter your content here" class="form-control" style="height:300px"><%= note.getContent() %></textarea>
			</div>
		
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your Note</button>
			</div>
		</form>
		
	</div>
</body>
</html>