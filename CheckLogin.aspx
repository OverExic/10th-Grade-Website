<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string UserName = Request.Form["nameId"].ToString().Replace("'", "''");
        string Password = Request.Form["Password"].ToString().Replace("'", "''");
        OleDbConnection Conn = new OleDbConnection();
        OleDbCommand Cmd = new OleDbCommand();
        Cmd.Connection = Conn;
        string Path = Server.MapPath(@"App_Data\users.mdb");
        Conn.ConnectionString = "Provider=Microsoft.jet.OLEDB.4.0;Data Source=" + Path;
        Cmd.CommandText = String.Format("select * from users where nameId='{0}' and pass='{1}';", UserName, Password);
        DataTable dt = new DataTable();
        OleDbDataAdapter da = new OleDbDataAdapter(Cmd);
        da.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            if ((bool)(dt.Rows[0]["Admin"]))

                Session["user"] = "Admin";

            else

                Session["user"] = dt.Rows[0]["nameId"];
        }
        else
            Response.Redirect("LoginError.aspx");
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
