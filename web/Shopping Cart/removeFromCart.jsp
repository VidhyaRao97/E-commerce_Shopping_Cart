<%@page import="java.sql.*" %>%>
<%@page import="src.connectionDB"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");

try{
  Connection con=connectionDB.getCon();
  Statement st=con.createStatement();
  st.executeUpdate("delete from cart where email='"+ email+"' and product_id='"+product_id+"' and address is NULL");
  response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){  
}
%>