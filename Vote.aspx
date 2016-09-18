<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    string answer;
    protected void Page_Load(object sender, EventArgs e)
    {

        answer = Request.Form["seker"];


        if (answer == "wikihow")
        {
            Application.Lock();
            Application["wikihow"] = (int)Application["wikihow"] + 1;
            Application.UnLock();
        }
        else if (answer == "ehow")
        {
            Application.Lock();
            Application["ehow"] = (int)Application["ehow"] + 1;
            Application.UnLock();
        }
        else if (answer == "instructables")
        {
            Application.Lock();
            Application["instructables"] = (int)Application["instructables"] + 1;
            Application.UnLock();
        }

        else
        {
            Application.Lock();
            Application["about"] = (int)Application["about"] + 1;
            Application.UnLock();
        }
        Session["vote"] = "yes";
        Response.Redirect("Result.aspx");
    }

</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
