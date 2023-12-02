function func3(p1) {
  var len = p1.length;
  if (len < 6) {
    document.getElementById("show").innerHTML = "<font color=red>Weak</font>";
  } else if (len < 9) {
    document.getElementById("show").innerHTML =
      "<font color=yellow>Medium</font>";
  } else if (len == 0) {
    document.getElementById("show").innerHTML = "";
  } else {
    document.getElementById("show").innerHTML =
      "<font color=orange>Strong</font>";
  }
}

function func4(p1) {
  var len = p1.length;
  if (len < 9) {
    alert("Give a strong Password");
    document.signup.passwd.value = "";
  }
}

function func5() {
  var pvalue = document.getElementById("passwd").value;
  var cpvalue = document.getElementById("cpasswd").value;
  var email = document.getElementById("email").value;
  var phno = document.getElementById("phno").value;
  var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
  var phoneno = /^\d{10}$/;
  if (pvalue != cpvalue) {
    alert("Password and conform password should match");
    console.log(pvalue);
    console.log(cpvalue);
    return false;
  }
  if (!email.match(mailformat)) {
    alert("Please enter a valid email adderss!!!");
    document.signup.email.focus();
    return false;
  }
  if (!phno.match(phoneno)) {
    alert("Enter a valid phone number");
    return false;
  }
}
