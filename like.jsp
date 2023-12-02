<%@ include file="connect.jsp" %>
<%
try{
int mid = Integer.parseInt(request.getParameter("mid"));
String owner = (String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("insert into SM_LIKE values(?,?)");
pst.setInt(1,mid);
pst.setString(2,owner);
pst.executeUpdate();
con.close();
response.sendRedirect("Userhome.jsp");
}
catch(Exception e)
{
  response.sendRedirect("Userhome.jsp");
}
%>