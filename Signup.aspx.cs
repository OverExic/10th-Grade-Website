using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.OleDb;
public partial class Signup : System.Web.UI.Page
{
    public string errors = "";
    public string serverMsg = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            string id = Request["nameId"];
            string email = Request["email"];
            string password = Request["namepass"];
            string firstName = Request["namefirst"];
            string lastName = Request["lname"];
            string gender = Request["namegender"];
            string phone = Request["namephone"];
            string age = Request["nameage"];

            /*
             Response.Write("<p>" + email + "</p>");
             Response.Write("<p>" + password + "</p>");
             Response.Write("<p>" + firstName + "</p>");
             Response.Write("<p>" + lastName + "</p>");
             Response.Write("<p>" + gender + "</p>");
             Response.Write("<p>" + phone + "</p>");
             Response.Write("<p>" + age + "</p>");
             Response.Write("<p>" + id + "</p>");
             Response.End();
             return;
             */


            // connectionString בניית
            String path = Server.MapPath(@"App_Data/users.mdb"); //שם הקובץ
            string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Persist Security Info=True";

            // יצירת קשר לבסיס הנתונים
            OleDbConnection conn = new OleDbConnection(connectionString);

            // select הכנת פקודת
            OleDbCommand cmd = new OleDbCommand();
            cmd.Connection = conn;
            cmd.CommandText = String.Format("Select * from users where nameId='{0}';", id);

            DataTable dt = new DataTable();
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            da.Fill(dt);

            //מניעת הרשמה כפולה
            if (dt.Rows.Count != 0)
            {
                //כדי לא לחזור לבניית הטופס מחדש פעולה שתמחק את הנתונים
                //כך ניתן לחזור לטופס בעזרת חזור ולמלא את הנתונים

                Response.Write("<p style='color:red'> דואר אלקטרוני כבר קיים במערכת. </p>");
                Response.End();
            }
            else
            {
                string sql;
                sql = "INSERT INTO users";
                sql += " (nameId,first_name,last_name,[pass],age,cellphone,email,gender)";
                sql += "VALUES (";
                sql += "'" + id + "'";
                sql += ",'" + firstName + "'";
                sql += ",'" + lastName + "'";
                sql += ",'" + password + "'";
                sql += ",'" + age + "'";
                sql += ",'" + phone + "'";
                sql += ",'" + email + "'";
                sql += ",'" + gender + "'";
                sql += ")";


                cmd.CommandText = sql;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}