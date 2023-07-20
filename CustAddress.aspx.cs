using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class CustAddress : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Cust_Id"] != null)
            lbl.Text = Request.QueryString["Cust_Id"];
        if (Request.QueryString["Cart_Id"] != null)
            lbl2.Text = Request.QueryString["Cart_Id"];
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String ins2 = "insert into tbl_Address (Cust_Id,City_Id,Address) values( ";
        ins2 += "'" + lbl.Text + "', ";
        ins2 += "'" + ddlCity.SelectedValue + "', ";
        ins2 += "'" + tbAddress.Text + "')";
        SqlCommand cmd2 = new SqlCommand(ins2, con);
        cmd2.ExecuteNonQuery();
        con.Close();
    }
    
}