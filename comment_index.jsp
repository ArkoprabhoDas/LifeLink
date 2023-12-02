<%@ include file="connect.jsp" %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
  <link rel="stylesheet" href="./comment_style.css">
<!-- partial:index.partial.html -->
<ul class="comment-section">
<%
int mid=0;
int count = 0;
String class1 = "";
String name = "";
String uimage = "";
mid=Integer.parseInt(request.getParameter("mid"));
PreparedStatement pst = con.prepareStatement("select * from SM_COMMENT where mid = ?");
pst.setInt(1,mid);
ResultSet rs = pst.executeQuery();
while(rs.next())
{
if(count % 2 == 0)
class1 = "comment user-comment";
else
class1 = "comment author-comment";
count += 1;
String email = rs.getString(2);
String msg = rs.getString(3);
PreparedStatement pst1 = con.prepareStatement("select * from SM_USER_INFO where email = ?");
pst1.setString(1,email);
ResultSet rs1 = pst1.executeQuery();
if(rs1.next())
{
name = rs1.getString(3);
uimage = rs1.getString(6);
}
%>
    <li class="<%=class1%>">
        <div class="info">
            <a href="#"><%=name%></a>
        </div>
        <a class="avatar" href="#">
            <img src="./image/<%=uimage%>" width="35" alt="Profile Avatar" title="Anie Silverston" />
        </a>
        <p><%=msg%></p>
    </li>
<%
}
PreparedStatement pst2 = con.prepareStatement("select * from SM_USER_INFO where email = ?");
pst2.setString(1,(String)session.getAttribute("email"));
ResultSet rs3 = pst2.executeQuery();
if(rs3.next())
uimage = rs3.getString(6);
%>
    

    <!-- More comments -->

    <li class="write-new">

        <form action="comment_submit.jsp" method="post">
            <input type="hidden" name="mid" value="<%=mid%>">
            <textarea placeholder="Write your comment here" name="comment"></textarea>
            <div>
                <img src="./image/<%=uimage%>" width="35" alt="Profile of Bradley Jones" title="Bradley Jones" />
                <button type="submit">Submit</button>
            </div>
        </form>

    </li>

