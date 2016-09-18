<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function checkloginform(that) {
            if (checkuserloginname(that.Username) && checkloginpass(that.UserPassword))
                return true;
            return false;

        }
        function checkuserloginname(that) {
            var x = that.value;
            if (x.length == 0) {
                alert("You must enter your id");
                that.select();
                return false;
            }
            return true;

        }

        function checkloginpass(that) {
            var x = that.value;
            if (x.length == 0) {
                alert("Must enter your password");
                that.select();
                return false;
            }
            if (!(x.length >= 6 && x.length <= 12)) {
                alert("You must enter a password between 6 to 12 characters.");
                that.select();
                return false
            }
            return true;
        }</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            Login</h2>
        <form name="Registration" action="CheckLogin.aspx" method="post" onsubmit="return checkloginform(this);">
        <div>
            <table>
                <tr>
                    <td>
                        Id:
                    </td>
                    <td>
                        <input type="text" name="nameId" id="numId" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <input type="password" name="Password" id="Password" />
                        <br />
                    </td>
                </tr>
            </table>
            <button type="submit" name="submit" value="submit">
                Login</button>
        </div>
        </form>
        <h1>
            Haven't registered yet? Sign up <a href="Signup.aspx">now!</a></h1>
    </center>
</asp:Content>
