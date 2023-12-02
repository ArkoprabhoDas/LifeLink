<%@include file="user_menu.jsp"%>
<link rel="stylesheet" href="./friends_card_req.css" />
<link rel="stylesheet" href="./friends.css" />
<br>
<br>
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<form action="fsearch.jsp" method=post>
<div class="wrapper">
  <div class="searchBar">
    <input id="searchQueryInput" type="text" name="fn" placeholder="Search" value="" />
    <button id="searchQuerySubmit" type="submit" name="searchQuerySubmit">
    <svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="#666666" d="M9.5,3A6.5,6.5 0 0,1 16,9.5C16,11.11 15.41,12.59 14.44,13.73L14.71,14H15.5L20.5,19L19,20.5L14,15.5V14.71L13.73,14.44C12.59,15.41 11.11,16 9.5,16A6.5,6.5 0 0,1 3,9.5A6.5,6.5 0 0,1 9.5,3M9.5,5C7,5 5,7 5,9.5C5,12 7,14 9.5,14C12,14 14,12 14,9.5C14,7 12,5 9.5,5Z" />
      </svg>
    </button>
  </div>
</div>
</form>
<%@ include file="connect.jsp"%>
<%
PreparedStatement pst = con.prepareStatement("select * from sm_friend where receiver=? and flag=0");
pst.setString(1,(String)session.getAttribute("email"));
ResultSet rs=pst.executeQuery();
while(rs.next())
{
  String senderid=rs.getString(1);
  PreparedStatement pst1 = con.prepareStatement("select * from sm_user_info where email=?");
  pst1.setString(1,senderid);
  ResultSet rs1=pst1.executeQuery();
  if(rs1.next())
  {
    String name=rs1.getString(3);
    String image=rs1.getString(6);
    %>
    <br><br>

    <center>
      <form action="req_acc_rej.jsp" method="post">
        <div id="container">
          <div class="box-1">
            <img src="./image/<%=image%>" class="box-image" />
          </div>
          <div class="box-2">
            <h1 class="info"><%=name%></h1>
            <input type=hidden name=senderid value=<%=senderid%>>
            <input type=submit class="btn" name=b1 value="Accept">
            <input type=submit class="btn" name=b1 value="Reject">
          </div>
        </div>
      </form>
    </center>
<%
  }
}
%>

<font class="fr" >Friends</font>
<br>
<br>
<%
String owner=(String)session.getAttribute("email");
PreparedStatement pst2=con.prepareStatement("select * from sm_friend where flag=1 and (sender=? or receiver=?)");
pst2.setString(1,owner);
pst2.setString(2,owner);
ResultSet rs2=pst2.executeQuery();
String fid="";
while(rs2.next())
{
   String sender=rs2.getString(1);
   String receiver=rs2.getString(2);
   if(sender.equals(owner))
     fid=receiver;
   else
     fid=sender;
    PreparedStatement pst3=con.prepareStatement("select * from sm_user_info where email=?");
        pst3.setString(1,fid);
         ResultSet rs3=pst3.executeQuery();
         if(rs3.next())
          {
             String name=rs3.getString(3);
             String image=rs3.getString(6);
         %>
           <br><br>
           
    <center>
        <div id="container">
          <div class="box-1">
            <img src="./image/<%=image%>" class="box-image" />
          </div>
          <div class="box-2">
            <h1 class="info1"><%=name%></h1>
          </div>
        </div>
    </center>
<%
         }
   
       }
    con.close();
%>
