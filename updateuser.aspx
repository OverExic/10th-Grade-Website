<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string LastName = Request.Form["lname"].ToString().Replace("'", "''");
        string FirstName = Request.Form["namefirst"].ToString().Replace("'", "''");
        string Gender = Request.Form["namegender"];
        string Age = Request.Form["nameage"];
        string Password = Request.Form["namepass"].ToString().Replace("'", "''");
        string UserName = Request.Form["nameId"].ToString().Replace("'", "''");
        string Email = Request.Form["email"];
        string PhoneNum = Request.Form["namephone"].ToString();
        OleDbConnection Conn = new OleDbConnection();
        OleDbCommand Cmd = new OleDbCommand();
        Cmd.Connection = Conn;
        string Path = Server.MapPath(@"App_Data\users.mdb");
        Conn.ConnectionString = "Provider=Microsoft.jet.OLEDB.4.0;Data Source=" + Path;
        Cmd.CommandText = String.Format("Update users set pass='{0}', first_name='{1}', last_name='{2}', gender='{3}', age='{4}', cellphone='{5}', email='{6}' where nameId='{7}' ;", Password, FirstName, LastName, Gender, Age, PhoneNum, Email, UserName);
        Conn.Open();
        Cmd.ExecuteNonQuery();
        Conn.Close();
        if (Session["user"] == "Admin")
            Response.Redirect("usertable.aspx");
        else
            Response.Redirect("NeedAdmin.aspx");

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
