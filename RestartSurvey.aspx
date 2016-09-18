<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != "Admin")
            Response.Redirect("NeedAdmin.aspx");
        Application.Lock();
        Application["wikihow"] = 0;
        Application.UnLock();
        Application.Lock();
        Application["ehow"] = 0;
        Application.UnLock();
        Application.Lock();
        Application["instructables"] = 0;
        Application.UnLock();
        Application.Lock();
        Application["about"] = 0;
        Application.UnLock();
        Response.Redirect("AdminPage.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
