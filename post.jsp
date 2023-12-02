<%@ include file="connect.jsp" %>
<%
int mid = 0;
PreparedStatement pst = con.prepareStatement("select max(mid) from SM_POST");
ResultSet rs = pst.executeQuery();
if(rs.next())
mid = rs.getInt(1);
mid++;
String sender = (String)session.getAttribute("email");
java.util.Date dt = new java.util.Date();
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("dd MMM yyyy");
String date= formatter.format(dt); 
String dt1 = dt.toString();
String msg = request.getParameter("ps");
String title = request.getParameter("tl");
PreparedStatement pst1 = con.prepareStatement("insert into SM_POST values(?,?,?,?,?)");
pst1.setInt(1,mid);
pst1.setString(2,sender);
pst1.setString(3,date);
pst1.setString(4,msg);
pst1.setString(5,title);
pst1.executeUpdate();
con.close();
response.sendRedirect("Userhome.jsp");
%>