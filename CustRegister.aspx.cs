using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class CustRegister : System.Web.UI.Page
{
String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Random rnd = new Random();
            txtCaptcha1.Text = rnd.Next(1000, 9999).ToString();
        }
    }

    protected void btn_reg_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String ins = "insert into tbl_Customer (Cust_Name,Email,Password,Contact) values( ";
        ins += "'" + tbName.Text + "', ";
        ins += "'" + tbEmail.Text + "', ";
        ins += "'" + tbPass.Text + "', ";
        ins += "" + tbContact.Text + ")";
        SqlCommand cmd = new SqlCommand(ins, con);
        cmd.ExecuteNonQuery();

        String sel = "SELECT TOP 1 [Cust_Id] FROM [db_ecare].[dbo].[tbl_Customer] order By Cust_Id desc";
        SqlCommand cmd1 = new SqlCommand(sel, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        String CustId = " ";
        while (dr1.Read())
        {
            CustId = dr1["Cust_Id"].ToString();
        }
        dr1.Dispose();

        String ins2 = "insert into tbl_Address (Cust_Id,City_Id,Address) values( ";
        ins2 += "'" + CustId + "', ";
        ins2 += "'" + ddlCity.SelectedValue + "', ";
        ins2 += "'" + tbAddress.Text + "')";
        SqlCommand cmd2 = new SqlCommand(ins2, con);
        cmd2.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert(Your Registration is Successful !!)</script>");
        Response.Redirect("CustLogin.aspx");
    }
   
}
