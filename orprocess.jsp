<%@ page language="java" import="java.sql.*"%>
<%! int ono=0;%>
<html>
<body>
<% 
   String pname=request.getParameter("D1");
   String pcode=request.getParameter("T4");
   int pprice=Integer.parseInt(request.getParameter("T1"));
   int Quan=Integer.parseInt(request.getParameter("T2"));
   int amount=Integer.parseInt(request.getParameter("T3"));
  String cscode=(String)session.getAttribute("ccode");
  int ccc=Integer.parseInt(cscode);
 Connection cc=null;
try
{
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
}
catch(ClassNotFoundException e){}
try
{
   cc=DriverManager.getConnection("jdbc:odbc:espace","sa","");
   Statement ss=cc.createStatement();
   ResultSet rs=ss.executeQuery("select orderno from orderprocess");
   while(rs.next())
   {
      	out.println(rs.getInt(1));
     
   }
    ono=ono+1;
        out.println(ono);
   PreparedStatement ps=cc.prepareStatement("insert into orderprocess(cno,Prcode,ProName,Price,Quantity,Amount,orderno) values(?,?,?,?,?,?,?)");
   ps.setInt(1,ccc);
   ps.setString(2,pcode);
   ps.setString(3,pname);
   ps.setInt(4,pprice);
   ps.setInt(5,Quan);
   ps.setInt(6,amount);
   ps.setInt(7,ono);
//   ps.setString(8,"2/3/04");
   int kk=ps.executeUpdate();
   if(kk>0)
   {
     response.sendRedirect("http://localhost:7000/examples/krishna/orderentered.jsp");            
   }
   else
   {
     response.sendRedirect("http://localhost:7000/examples/krishna/orderfailed.jsp");            
   }
}
 catch(SQLException e){}
 %>
</body>
</html>
