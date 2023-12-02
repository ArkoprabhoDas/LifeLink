<%@ include file="user_menu.jsp" %>
<hr>
<%@include file="connect.jsp" %>
<%
String owner=(String)session.getAttribute("email");
PreparedStatement pst2=con.prepareStatement("select * from sm_friend where flag=1 and (sender=? or receiver=?)");
pst2.setString(1,owner);
pst2.setString(2,owner);
ResultSet rs2=pst2.executeQuery();

%>
<form action=msg_post.jsp method=post>
Choose <select name=rid>
       <option>Select</option>
<%
String fid="";
while(rs2.next())
{
   String sender=rs2.getString(1);
   String receiver=rs2.getString(2);
   if(sender.equals(owner))
     fid=receiver;
   else
     fid=sender;
%>
<option value=<%=fid%>><%=fid%></option>
<%
  }
%>
</select><br><br>

<textarea name=msg rows=4 cols=16></textarea><br><br>
<input type=submit value=post>
</form>

<%
PreparedStatement pst3=con.prepareStatement("select * from sm_message where rname=? order by mid desc");
pst3.setString(1,owner);
ResultSet rs=pst3.executeQuery();
while(rs.next()){
String sid=rs.getString(2);
String dt=rs.getString(4);
String msg=rs.getString(6);
%>
<%=sid%>:<%=dt%><br>
<%=msg%>
<br><br>
<%
   }
  con.close();
%>




