<%-- 
    Document   : Register.jsp
    Created on : 13 Jul, 2024, 11:07:00 AM
    Author     : Admin
--%>



<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
        <title>JSP Page</title>
    </head>
    <body>
        <% String s1 = request.getParameter("name");
            String s2 = request.getParameter("pass");
            String s3 = request.getParameter("re-pass");
            String s4 = request.getParameter("email");
            String s5 = request.getParameter("country");
            if(s2.equals(s3))
            {
                //database connectivity code
                try
                {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
                PreparedStatement pst=conn.prepareStatement("insert into registration_53 values(?,?,?,?)");
                pst.setString(1,s1);
                pst.setString(2,s2);
                pst.setString(3,s4);
                pst.setString(4,s5);
                
                int rows = pst.executeUpdate();
                if(rows==1){
                    out.println("Registeration successful..");
                }
                else
                {
                     out.println("Registeration Failed..! Try again");
                %>
                <jsp:include page="Register.html"></jsp:include>
                <%
                }
                }
                catch(Exception e)
                        {
                            out.println("Exception:"+e);
                        }
            }
            else
            {
                out.println("password mismatch re enter all details again");
            
            %>
            <jsp:include page="Register.html"></jsp:include>
            <%
              }  
                %>
    </body>
</html>
