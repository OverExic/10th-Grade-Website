<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
            color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<center>
        <br />
        <br />
        <br />
        <img src="Images/error.png" alt="Photo of an error" style="height: 365px; width: 401px" />
        <br />
        <span class="style1">Your username or password is incorrect ...</span>
    </center>
</asp:Content>


