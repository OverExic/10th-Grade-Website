<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != "Admin")
            Response.Redirect("NeedAdmin.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h2>
            <b>Admin page</b>
        </h2>
        <table>
            <tr>
                <td>
                    <a class="link" href="RestartMone.aspx">Erase visitor counter</a> <a class="link" href="RestartSurvey.aspx">
                        Erase survery answers</a> <a class="link" href="usertable.aspx">User Table</a>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
