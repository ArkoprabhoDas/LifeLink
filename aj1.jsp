<%@ include file="connect.jsp" %>
<%
PreparedStatement pst=con.prepareStatement("select * from SM_USER_INFO where email=?");
pst.setString(1,request.getParameter("email"));
ResultSet rs=pst.executeQuery();
if(rs.next())
{
%>
1
<%
}
else
{
%>
2
<%
}
con.close();
%>