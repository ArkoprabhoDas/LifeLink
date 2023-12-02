<%@include file="user_menu.jsp" %>
<%@ include file="connect.jsp" %>
<link rel="stylesheet" href="./friends_card.css" />
<%
try{
String email = (String)session.getAttribute("email");
String nm=request.getParameter("fn");
PreparedStatement pst1=con.prepareStatement("select * from sm_user_info where name like '"+nm+"%' and email <> '"+email+"'");
ResultSet rs1=pst1.executeQuery();
//String sender123 = (String)session.getAttribute("email");
//out.println(sender123);
while(rs1.next())
{
int f=-1;
String email1=rs1.getString(1);
String name=rs1.getString(3);
String image=rs1.getString(6);
 PreparedStatement pst2=con.prepareStatement("select * from sm_friend where (receiver=? and sender = ?) or (receiver=? and sender=?)");
 pst2.setString(1,email1);
 pst2.setString(2,email);
 pst2.setString(3,email);
 pst2.setString(4,email1);
 ResultSet rs2=pst2.executeQuery();
 if(rs2.next())
   f=rs2.getInt(3);
%>
<br>
<center>
  <form action="req_friend.jsp" method="post">
    <div id="container">
      <div class="box-1">
        <img src="./image/<%=image%>" class="box-image" />
      </div>
      <input type=hidden name=email value="<%=email1%>" >
      <div class="box-2">
      <h1 class="info"><%=name%></h1>
      <%
      if(f==-1)
      {
      %>
      <button class="btn">
      Request for friend
      </button>
      <%
      }
      else if(f==0)
      {
      %>
      <button class="btn" disabled>
      Request pending
      </button>
      <%
      }
      else if(f==1)
      {
      %>
      <button class="btn" disabled >
      Already Friend
      </button>
      <%
      }
      %>
      </div>
      </div>
    </form>
    </center>
<br>
<%
 }
con.close();
}
catch(Exception e){
out.println(e);}
%>
