<%@ include file="connect.jsp" %>
<%!
String uimage="";
%>
<%
String email = (String)session.getAttribute("email");
PreparedStatement pst = con.prepareStatement("select image from sm_user_info where email=?");
pst.setString(1,email);
ResultSet rs = pst.executeQuery();
if(rs.next())
uimage=rs.getString(1);
%>

<link rel="stylesheet" href="./home.css" />
<body>
  <a href="pic_upload.jsp" class="image"
    ><img src="./image/<%=uimage%>" alt="" height="50" width="50"
    /></a>