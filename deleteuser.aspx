<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != "Admin")
            Response.Redirect("NeedAdmin.aspx");
        string UserName = Request.QueryString["username"];
        OleDbConnection Conn = new OleDbConnection();
        OleDbCommand Cmd = new OleDbCommand();
        Cmd.Connection = Conn;
        string Path = Server.MapPath(@"App_Data\users.mdb");
        Conn.ConnectionString = "Provider=Microsoft.jet.OLEDB.4.0;Data Source=" + Path;
        Cmd.CommandText = String.Format("Delete from users where nameId='{0}';", UserName);
        Conn.Open();
        Cmd.ExecuteNonQuery();
        Conn.Close();
        Response.Redirect("usertable.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
