<%@ include file="user_menu.jsp" %>
<%@ include file="connect.jsp" %>
<%
   String rid=request.getParameter("rid");
  String ms=request.getParameter("msg");
  String sid=(String)session.getAttribute("email");
   int mid=0;
   PreparedStatement pst=con.prepareStatement("select max(mid) from sm_message");
   ResultSet rs=pst.executeQuery();
   if(rs.next())
     mid=rs.getInt(1);
   mid++;
   String dt=new java.util.Date().toString();
   int flag=0;
   PreparedStatement pst1=con.prepareStatement("insert into sm_message values(?,?,?,?,?,?)");
   pst1.setInt(1,mid);
   pst1.setString(2,sid);
   pst1.setString(3,rid);
   pst1.setString(4,dt);
   pst1.setInt(5,flag);
   pst1.setString(6,ms);
   pst1.executeUpdate();
   out.println("<br><br>Message sent successfully");
   con.close();
%>