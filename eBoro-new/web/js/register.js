function validate()
{
    var fullname = /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
    var mykad = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern allowed alphabet a-z or A-Z 
    var notel = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/;
    var email = /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
    var username = /^[a-z A-Z]+$/; 
    var password = /^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 

    var fullname = document.getElementById("fullname"); 
    var mykad = document.getElementById("mykad"); 
    var notel = document.getElementById("notel"); 
    var email = document.getElementById("email"); 
    var username = document.getElementById("username"); 
     var password = document.getElementById("password"); 
    

    if (!fullname.test(fullname.value) || fullname.value == '')
    {
        alert("Enter Firstname Alphabet Only....!");
        fullname.focus();
        fullname.style.background = '#f08080';
        return false;
    }
    if (!mykad.test(mykad.value) || mykad.value == '')
    {
        alert("Enter Mykad 6 to 12 and allowed !@#$%&*()<> character Only....!");
        mykad.focus();
        mykad.style.background = '#f08080';
        return false;
    }
    if (!notel.test(notel.value) || notel.value == '')
    {
        alert("Enter notel 6 to 12 and allowed !@#$%&*()<> character Only....!");
        notel.focus();
        notel.style.background = '#f08080';
        return false;
    }
    if (!email.test(email.value) || email.value == '')
    {
        alert("Enter Valid Email!");
        email.focus();
        email.style.background = '#f08080';
        return false;
    }
    if (!username.test(username.value) || username.value == '')
    {
        alert("Enter username Alphabet Only! ");
        username.focus();
        username.style.background = '#f08080';
        return false;
    }
    if (!password.test(password.value) || password.value == '')
    {
        alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
        password.focus();
        password.style.background = '#f08080';
        return false;
    }
}
	