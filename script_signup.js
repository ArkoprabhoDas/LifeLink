function func1(p1) {
  xmlHttp = GetXmlHttpObject();
  url = "aj1.jsp?email=" + p1;
  xmlHttp.onreadystatechange = stateChanged;
  xmlHttp.open("GET", url, true);
  xmlHttp.send(null);
}

function stateChanged() {
  var showdata = xmlHttp.responseText;
  if (showdata == 1) {
    document.signup.email.value = "";
    document.getElementById("result").innerHTML =
      "<font color=red>Email not available</font>";
  } else {
    document.getElementById("result").innerHTML =
      "<font color=yellow>Email available</font>";
  }
}

function GetXmlHttpObject() {
  var xmlHttp = null;
  try {
    xmlHttp = new XMLHttpRequest();
  } catch (e) {
    try {
      xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
  }
  return xmlHttp;
}

function func2(p2) {
  xmlHttp = GetXmlHttpObject();
  url = "aj2.jsp?name=" + p2;
  xmlHttp.onreadystatechange = stateChanged1;
  xmlHttp.open("GET", url, true);
  xmlHttp.send(null);
}

function stateChanged1() {
  var showdata = xmlHttp.responseText;
  if (showdata == 1) {
    document.signup.uname.value = "";
    document.getElementById("result1").innerHTML =
      "<font color=red>Username not available</font>";
  } else {
    document.getElementById("result1").innerHTML =
      "<font color=yellow>Username available</font>";
  }
}
