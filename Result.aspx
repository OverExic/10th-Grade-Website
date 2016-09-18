<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <h1>
            Survey Results</h1>
        <table>
            <tr>
                <td>
                    WikiHow:
                    <%=Application["asm"] %>
                </td>
            </tr>
            <tr>
                <td>
                    Ehow:
                    <%=Application["c"]%>
                </td>
            </tr>
            <tr>
                <td>
                   Instructables:
                    <%=Application["internet"]%>
                </td>
            </tr>
            <tr>
                <td>
                    About:
                    <%=Application["other"]%>
                </td>
            </tr>
            <tr>
                <td>
                   Total Votes:
                    <%=((int)Application["asm"] + (int)Application["c"] + (int)Application["internet"] + (int)Application["other"])%>
                </td>
            </tr>
        </table>
    </center>
    <%if (Session["vote"] == "no")
      {%>
    <a href="Survey.aspx">לדף ההצבעה</a>
    <%}
    %>
</asp:Content>
