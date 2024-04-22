<%@page import="java.sql.*"%>
<!--%@page import="java.sql.*" %>-->
<%@page import="src.connectionDB"%>

<%
String email=session.getAttribute("email").toString();
String securityQuestion=request.getParameter("securityQuestion");
String newAnswer=request.getParameter("newAnswer");
String password=request.getParameter("password");

int check=0;
try{
    Connection con=connectionDB.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select* from user email='"+email+"' and password='"+password+"'");
    while(rs.next()){
        check=1;
        st.executeUpdate("update user set securityQuestion='"+securityQuestion+"', answer='"+answer+"' where email='"+email+"'");
    }
    
    
}
catch(Exception e){
    
}

%>