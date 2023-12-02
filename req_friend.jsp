<%@ include file="connect.jsp" %>
<%
String receiver = request.getParameter("email");
String sender = (String)session.getAttribute("email");
out.println(sender+"hello");
int f=0;
PreparedStatement pst = con.prepareStatement("insert into sm_friend values (?,?,?)");
pst.setString(1,sender);
pst.setString(2,receiver);
pst.setInt(3,f);
pst.executeUpdate();
con.close();
response.sendRedirect("friends.jsp");
%>