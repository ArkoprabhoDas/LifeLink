<%@include file="connect.jsp" %>
<%
String uname="",date="",phone="",passwd="";
String s = (String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("select * from sm_user_info where email=?");
pst.setString(1,s);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
  uname = rs.getString(3);
  date = rs.getString(4);
  phone = rs.getString(5);
  passwd = rs.getString(2);
}

%>
<%@ include file="user_menu.jsp" %>
<br>
    <link rel="stylesheet" href="./profile.css" />
    <section class="signup">
      <div class="head">
        <h1 class="company">Profile Page</h1>
      </div>
      <div class="form">
        <form action="profile_submit.jsp" method="post">
          <input
            type="text"
            placeholder="Username"
            class="text"
            name="uname"
            value="<%=uname%>"
            readonly
          /><br />
          <input
            type="date"
            placeholder="Date of Birth"
            class="date"
            name="dt"
            value="<%=date%>"
            required
          /><br />
          <input
            type="email"
            placeholder="Email"
            class="email"
            name="email"
            value="<%=s%>"
            readonly
          /><br />
          <input
            type="tel"
            placeholder="Phone Number"
            class="phno"
            name="tn"
            value="<%=phone%>"
            required
          /><br />
          <input
            type="password"
            placeholder="Password"
            class="password"
            name="passwd"
            value="<%=passwd%>"
            required
          /><br />
          <input
            type="password"
            placeholder="Conform Password"
            value="<%=passwd%>"
            class="cpassword"
          /><br />
          <input type="submit" value="SUBMIT" class="btn-signup" />
        </form>
      </div>
    </section>

