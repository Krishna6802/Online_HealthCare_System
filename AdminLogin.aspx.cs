using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class CustLogin : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Login_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String login = "select count(*) from tbl_Users where UserName='" + tbUser.Text.ToString() + "' And Password='" + tbPass.Text.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(login, con);

        int t1 = (int)cmd1.ExecuteScalar();
        if (t1 > 0)
        {
            Response.Redirect("Admin/AdminHome.aspx");

        }
    }
}