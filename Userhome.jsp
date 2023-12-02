<%@ include file="user_menu.jsp" %>
<%@ include file="view_upic.jsp" %>
<script src="./script.js"></script>
<br>
<%@ include file="user_post.html" %>
<link rel="stylesheet" href="./Userpost.css" />
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css"
    />
<br>
<%
int mid=0;
int like = 0;
int comment = 0;
try
{
PreparedStatement pst1=con.prepareStatement("select * from sm_post order by mid desc");
ResultSet rs1 = pst1.executeQuery();
while(rs1.next())
{
  mid=rs1.getInt(1);
  String owner_post=rs1.getString(2);
  String dt=rs1.getString(3);
  String msg=rs1.getString(4);
  String title=rs1.getString(5);
  int f=0;
  String owner=(String)session.getAttribute("email");
  if(owner_post.equals(owner))
  {
    f=1;
  }
  PreparedStatement pst2=con.prepareStatement("select * from sm_friend where flag=1 and (sender=? and receiver=?) or (sender=? and receiver=?)");
  pst2.setString(1,owner_post);
  pst2.setString(2,owner);
  pst2.setString(3,owner);
  pst2.setString(4,owner_post);
  ResultSet rs2=pst2.executeQuery();
  if(rs2.next())
  f=1;
  if(f==1)
  {
    PreparedStatement pst3=con.prepareStatement("select * from sm_user_info where email=?");
    pst3.setString(1,owner_post);
    ResultSet rs3=pst3.executeQuery();
    rs3.next();
    String name=rs3.getString(3);
    String upic=rs3.getString(6);
    mid = rs1.getInt(1);
    PreparedStatement pst4 = con.prepareStatement("select count(*) from SM_COMMENT where mid = ? group by mid");
    pst4.setInt(1,mid);
    ResultSet rs4 = pst4.executeQuery();
    if(rs4.next())
    comment = rs4.getInt(1);
    PreparedStatement pst5 = con.prepareStatement("select count(*) from SM_LIKE where mid = ? group by mid");
    pst5.setInt(1,mid);
    ResultSet rs5 = pst5.executeQuery();
    if(rs5.next())
    like = rs5.getInt(1);
%>

<br>

<center>
    <div class="container">
      <div class="card">
        <div class="card-header">
        </div>
        <div class="card-body">
          <h4><%=title%></h4>
          <p><%=msg%></p>
          <div class="user">
            <img
              src="./image/<%=upic%>"
              alt=""
            />
            <div class="user-info">
              <h5><%=name%></h5>
              <small><%=dt%></small>
            </div>
          </div>
        </div>
        <div class="post-footer">
          <ul>
          <form action="comment_index.jsp" method="post"> 
           <input type="hidden" name="mid" value="<%=mid%>">
            <button class="transparent" type="submit"><li><i class="fas fa-comment"></i><%=comment%></li></button>
          </form>
          <form action="like.jsp" method="post">
            <input type="hidden" name="mid" value="<%=mid%>">
            <button class="transparent"><li><i class="fas fa-heart"></i><%=like%></li></button>
          </form>
          </ul>
        </div>
      </div>
    </div>

<%
comment=0;
like=0;
  }
}
}
catch(Exception e)
{
  out.println(e);
}
con.close();
%>
