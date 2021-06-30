
function validate()
{
    var username = document.myform.username;
    var password = document.myform.password;

    if (username.value == null || username.value == "") //check email textbox not blank
    {
        window.alert("Please enter username ?"); //alert message
        username.style.background = '#f08080';
        username.focus();
        return false;
    }
    if (password.value == null || password.value == "") //check password textbox not blank
    {
        window.alert("Please enter password ?"); //alert message
        password.style.background = '#f08080';
        password.focus();
        return false;
    }
}

