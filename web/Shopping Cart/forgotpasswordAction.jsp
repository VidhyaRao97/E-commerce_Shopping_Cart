<%@page import="java.sql.*"%>
<%@page import="src.connectionDB"%>
<%
String email=request.getParameter("email");
String mobilenumber=request.getParameter("mobilenumber");
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");

int check=0;
try{
    Connection con=connectionDB.getCon();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select*from user where email='"+email+"' and mobilenumber='"+mobilenumber+"'and securityQuestion='"+ securityQuestion+"' and answer='"+ answer +"'");
    while(rs.next()){
        check=1;
        st.executeUpdate("update user set password='"+newPassword+"'where email='"+email+"'");
        response.sendRedirect("forgotPassword.jsp?msg=done");
    }
    if(check==0){
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }
}
catch(Exception e){
    System.out.println(e);
    
}

%>
