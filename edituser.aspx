<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
    DataTable dt = new DataTable();
    string UserName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == "Guest")
            Response.Redirect("NeedUser.aspx");
        if (Session["user"] == "Admin")
            UserName = Request.QueryString["username"];
        else
            UserName = Session["user"].ToString();
        OleDbConnection Conn = new OleDbConnection();
        OleDbCommand Cmd = new OleDbCommand();
        Cmd.Connection = Conn;
        string Path = Server.MapPath(@"App_Data\users.mdb");
        Conn.ConnectionString = "Provider=Microsoft.jet.OLEDB.4.0;Data Source=" + Path;
        Cmd.CommandText = String.Format("select * from users where nameId='{0}';", UserName);

        OleDbDataAdapter da = new OleDbDataAdapter(Cmd);
        da.Fill(dt);

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">

        function checkForm() {

            validFName = checkFName();
            validLName = checkLName();
            validEmail = checkEmail();
            validAge = checkAge();
            validPhone = checkPhone();
            validPassword = checkPass();

            if (validFName && validLName && validEmail && validAge
           && validPhone && validPassword)
                return true;
            return false;
        }


        function isValidEmail(email_str) {

            if (email_str == "") {
                return false;
            }

            if (email_str.indexOf("@") < 1) {
                return false;
            }


            if (email_str.split("@").length != 2) {
                return false;
            }

            if (!((email_str.lastIndexOf(".") == email_str.length - 3) || (email_str.lastIndexOf(".") == email_str.length - 4))) {
                return false;
            }

            if (email_str.indexOf(".") == 0) {
                return false;
            }

            var res = isValidString(email_str);
            if (res == false) {
                return false;
            }

            return true;
        }

        function isValidString(checked_str) {

            var badCharStr = "$%^*()_+[]{}<>&";
            var apostrophe = "\"";
            pos = checked_str.indexOf(apostrophe);
            if (pos > -1) {
                return false;
            }

            for (var i = 0; i < badCharStr.length; i++) {
                badChr = badCharStr.charAt(i)
                pos = checked_str.indexOf(badChr);
                if (pos > -1) {
                    return false;
                }
            }
            return true;
        }

        function checkEmail() {
            var element = document.getElementById("email");
            var email_str = element.value;
            if (isValidEmail(email_str) == false) {
                // Invalid email adress
                document.getElementById("email_error").innerHTML = "The email adress you entered is not valid.";
                return false;
            } document.getElementById("email_error").innerHTML = "";
            return true;
        }

        function checkFName() {
            // Checks the users name.
            flag = document.getElementById("firstname").value;
            if (flag == "") {
                // You must enter a first name.
                document.getElementById("fname_error").innerHTML = "Enter your first name.";
                return false;
            } else if ((flag.length < 1) || (flag.length > 10)) {
                // Checks the number of characters entered.
                document.getElementById("fname_error").innerHTML = "Enter your name from one character to 10 characters.";
                return false;
            } else {
                document.getElementById("firstname").style.backgroundColor = "";
                document.getElementById("fname_error").innerHTML = "";
            }
            return true;
        }

        function checkLName() {
            // Checks the users last name.
            flag = document.getElementById("lastname").value;
            if (flag == "") {
                // You must enter a last name.
                document.getElementById("lname_error").innerHTML = "Enter your last name.";
                return false;
            } else if ((flag.length < 2) || (flag.length > 13)) {
                // Checks the number of characters entered.
                document.getElementById("lname_error").innerHTML = "Enter your last name ranging from 2 characters to 13. ";
                return false;
            }
            document.getElementById("lastname").style.backgroundColor = "";
            document.getElementById("lname_error").innerHTML = "";
            return true;
        }

        function checkPass() {
            // Checks the users password.
            flag = document.getElementById("password").value;
            if (flag.length == 0) {
                // You must enter a password.
                document.getElementById("passerror").innerHTML = "Enter a password to continue.";
                return false;
            } if ((flag.length < 6) || (flag.length > 12)) {
                // Checks the number of characters entered.
                document.getElementById("passerror").innerHTML = "Enter a password from 6 to 12 characters.";
                return false;
            }
            document.getElementById("password").style.backgroundColor = "";
            document.getElementById("passerror").innerHTML = "";
            return true;
        }

        function checkAge() {
            // Checks the users age.
            flag = document.getElementById("age").value;
            if (flag == "") {
                // You must enter your age.
                document.getElementById("aerror").innerHTML = "You must enter your age";
                return false;
            } else if ((flag.length < 2) || (flag.length > 3)) {
                // Checks the number of characters entered.
                document.getElementById("aerror").innerHTMl = "You are not allowed to sign up.";
                return false;
            }
            document.getElementById("age").style.backgroundColor = "";
            document.getElementById("aerror").innerHTML = "";
            return true;
        }



        function checkPhone() {
            var element = document.getElementById("phone");
            var phone_str = element.value;
            if (phone_str.length == 0) {
                document.getElementById("phoneerror").innerHTML = "You must enter your phone number.";
                return false;
            }
            if (isValidPhone(phone_str) == false) {
                // The phone number is not valid.
                document.getElementById("phoneerror").innerHTML = "The phone number you entered is not valid.";
                return false;
            }
            document.getElementById("phoneerror").innerHTML = "";
            return true;
        }

        function isValidPhone(phone_str) {
            str = phone_str;
            for (i = 0; i < str.length; i++) {
                ch = str.charAt(i)
                if (!((ch >= 0 && ch <= 9) || (ch == "-"))) {
                    return false;
                }
            } return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Edit User!</h2>
        <form name="form1" method="post" action="updateuser.aspx" onsubmit="return checkForm(this)">
        <table>
            <tr>
                <td>
                    <input type="hidden" value="<%=dt.Rows[0]["nameId"]%>" name="nameId" id="numId" />
                    First Name:
                </td>
                <td>
                    <input type="text" value="<%=dt.Rows[0]["first_name"]%>" name="namefirst" id="firstname" />
                </td>
                <td>
                    <span style="color: Red" id="fname_error"></span>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name:
                </td>
                <td>
                    <input type="text" value="<%=dt.Rows[0]["last_name"]%>" name="lname" id="lastname" />
                </td>
                <td>
                    <span style="color: Red" id="lname_error"></span>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <input type="text" value="<%=dt.Rows[0]["pass"]%>" name="namepass" id="password" />
                </td>
                <td>
                    <span style="color: Red" id="passerror"></span>
                </td>
            </tr>
            <tr>
                <td>
                    Enter your age:
                </td>
                <td>
                    <input type="text" value="<%=dt.Rows[0]["age"]%>" name="nameage" id="age" />
                </td>
                <td>
                    <span style="color: Red" id="aerror"></span>
                </td>
            </tr>
            <tr>
                <td>
                    Cell-Phone Number:
                </td>
                <td>
                    <input type="text" value="<%=dt.Rows[0]["cellphone"]%>" name="namephone" id="phone" />
                </td>
                <td>
                    <span style="color: Red" id="phoneerror"></span>
                </td>
            </tr>
            <tr>
                <td>
                    Email:
                    <br />
                    example@gmail.com
                    <br />
                </td>
                <td>
                    <input type="text" value="<%=dt.Rows[0]["email"]%>" name="email" id="email" value="" />
                </td>
                <td>
                    <span style="color: Red" id="email_error"></span>
                </td>
            </tr>
            <tr>
                <td>
                    Gender:
                </td>
                <td>
                    <label for="male">
                        Male</label>
                    <input type="radio" name="namegender" value="male" id="male" <%if (dt.Rows[0]["gender"].ToString()=="male"){ %>
                        checked="checked" <%} %> />
                    <label for="female">
                        Female</label>
                    <input type="radio" name="namegender" value="female" id="female" <%if (dt.Rows[0]["gender"].ToString()=="female"){ %>
                        checked="checked" <%} %> />
                </td>
                <td>
                    <span style="color: Red" id="gender_error"></span>
                </td>
            </tr>
        </table>
        <button type="submit" value="submit" onclick="checkForm()">
            Submit</button>
        <br />
        </form>
    </center>
</asp:Content>
