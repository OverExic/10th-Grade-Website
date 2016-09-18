<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == "Guest")
            Response.Redirect("NeedUser.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function checkradio(that) {
            var i;
            for (i = 0; i < that.length; i++)
                if (that[i].checked)
                    return true;
            alert("You must pick an answer.");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <center>
        <%if (Session["vote"] == "yes")
          {
              Response.Redirect("Result.aspx");
          }
        %>
        <h1>
            What site is the best site out of these?</h1>
        <form name="Survey" action="Vote.aspx" method="post" onsubmit="return checkradio(this);">
        <table>
            <tr>
                <td>
                    <input type="radio" name="seker" value="wikihow" />
                </td>
                <td>
                    WikiHow
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="seker" value="ehow" />
                </td>
                <td>
                    Ehow
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="seker" value="instructables" />
                </td>
                <td>
                    Instructables<br />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="seker" value="about" />
                </td>
                <td>
                    About<br />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <input type="submit" value="Vote" />
                </td>
            </tr>
        </table>
        </form>
    </center>
</asp:Content>
