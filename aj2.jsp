<%@ include file="connect.jsp" %>
<%
PreparedStatement pst=con.prepareStatement("select * from SM_USER_INFO where name=?");
pst.setString(1,request.getParameter("name"));
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