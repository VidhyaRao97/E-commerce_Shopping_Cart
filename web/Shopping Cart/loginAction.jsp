<%@page import="java.sql.*"%>
<%@page import="src.connectionDB"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    if("admin@mail.com".equals(email)&& "admin".equals(password)){
        session.setAttribute("email", email);
        response.sendRedirect("admin/adminHome.jsp");
    }
    else{
        int z=0;
        try{
            Connection con=connectionDB.getCon();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from user where email='"+email+"'and password='"+password+"'");
            while(rs.next()){
                z=1;
                session.setAttribute("email", email);
                response.sendRedirect("home.jsp");
            }
            if(z==0)
                response.sendRedirect("login.jsp1?msg=notexist");
        }
        catch(Exception e){
            System.out.println(e);
            response.sendRedirect("login.jsp1?msg=invalid");
            
        }
    }
%>
