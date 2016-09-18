using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
            if (Request.Form["user"] != "")
            {
                Session["user"] = Request.Form["user"];
                Response.Redirect("Default.aspx");
                Response.End();
            }
            else
                Response.Write("לא הוקלד שם");

    }
}