<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script runat="server">
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != "Admin")
            Response.Redirect("NeedAdmin.aspx");
        OleDbConnection Conn = new OleDbConnection();
        OleDbCommand Cmd = new OleDbCommand();
        Cmd.Connection = Conn;
        string Path = Server.MapPath(@"App_Data\users.mdb");
        Conn.ConnectionString = "Provider=Microsoft.jet.OLEDB.4.0;Data Source=" + Path;
        Cmd.CommandText = String.Format("select * from users;");
        OleDbDataAdapter da = new OleDbDataAdapter(Cmd);
        da.Fill(dt);

    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <%Response.Write("<table cellspacing='30'>");
          Response.Write("<td>Id</td><td>First Name</td><td>Last Name</td><td>Email</td>");
          for (int i = 0; i < dt.Rows.Count; i++)
          {
              Response.Write("<tr>");
              Response.Write("<td>" + dt.Rows[i]["nameId"] + "</td>");
              Response.Write("<td>" + dt.Rows[i]["first_name"] + "</td>");
              Response.Write("<td>" + dt.Rows[i]["last_name"] + "</td>");
              Response.Write("<td>" + dt.Rows[i]["email"] + "</td>");
              Response.Write("<td>" + "<a href='edituser.aspx?username=" + dt.Rows[i]["nameId"].ToString() + "'>Edit</a>" + "</td>");
              if (!(bool)(dt.Rows[i]["admin"]))
                  Response.Write("<td>" + "<a href='deleteuser.aspx?username=" + dt.Rows[i]["nameId"].ToString() + "'>Erase</a>" + "</td>");
              Response.Write("</tr>");
          }
          Response.Write("</table>");%>
    </center>
</asp:Content>
