<%@include file="connect.jsp"%>
<%
String b1=request.getParameter("b1");
if(b1.equals("Accept"))
{
  PreparedStatement pst=con.prepareStatement("update sm_friend set flag=1 where sender=? and receiver=?");
  pst.setString(1,request.getParameter("senderid"));
  pst.setString(2,(String)session.getAttribute("email"));
  pst.executeUpdate();
}
if(b1.equals("Reject"))
{
  PreparedStatement pst1=con.prepareStatement("delete from sm_friend where sender=? and receiver=?");
  pst1.setString(1,request.getParameter("senderid"));
  pst1.setString(1,(String)session.getAttribute("email"));
  pst1.executeUpdate();
}
con.close();
response.sendRedirect("friends.jsp");
%>