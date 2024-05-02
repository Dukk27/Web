function checkinfordangnhap() {
    var email = document.getElementById("dnEmail").value;
    var pass = document.getElementById("dnPass").value;
    var erEmail = document.getElementById("error_email");
    var erPass = document.getElementById("error_pass");
    var ok = true;

    if (email == "") {
        erEmail.style.color = 'red';
        erEmail.innerHTML = "* Email không được để trống ";
        ok = false;
    } else {
        erEmail.innerHTML = "";
    }

    if (pass == "") {
        erPass.style.color = 'red';
        erPass.innerHTML = "* Password không được để trống";
        ok = false;
    } else {
        erPass.innerHTML = "";
    }

    return ok;
}





