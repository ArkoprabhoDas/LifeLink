<%@ include file="connect.jsp" %>
<%
try{
int mid = Integer.parseInt(request.getParameter("mid"));
String msg = request.getParameter("comment");
String owner = (String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("insert into SM_COMMENT values(?,?,?)");
pst.setInt(1,mid);
pst.setString(2,owner);
pst.setString(3,msg);
pst.executeUpdate();
con.close();
response.sendRedirect("Userhome.jsp");
}
catch(Exception e)
{
  out.println(e);
}
%>