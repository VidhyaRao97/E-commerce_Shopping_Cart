<%@page import="java.sql.*"%>
<%@page import="src.connectionDB"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Cancel";
try{
    Connection con=connectionDB.getCon();
    Statement st=con.createStatement();
    st.executeUpdate("update cart set status='"+ status+"' where product_id='"+id+"' and email='"+email+"'and address is not NULL");
    response.sendRedirect("ordersReceived.jsp?msg=cancel");
}
catch(Exception e){
    System.out.println(e);
    response.sendRedirect("ordersReceived.jsp?msg=wrong");

}

%>