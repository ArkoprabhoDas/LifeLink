<%@include file="connect.jsp" %>
<%
PreparedStatement pst = con.prepareStatement("update sm_user_info set password=?, name=?, dob=?, phno=? where email=?");
pst.setString(1,request.getParameter("passwd"));
pst.setString(2,request.getParameter("uname"));
pst.setString(3,request.getParameter("dt"));
pst.setString(4,request.getParameter("tn"));
pst.setString(5,request.getParameter("email"));
int t = pst.executeUpdate();
if (t>0)
{
  response.sendRedirect("profile.jsp");
}
con.close();
%>