using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Order_Master : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        int CustId = 0;
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel1 = "Select Cust_Id from tbl_Login";
        SqlCommand cmd1 = new SqlCommand(sel1, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        while (dr1.Read())
        {
            CustId = Convert.ToInt32(dr1["Cust_Id"].ToString());
        }
        dr1.Close();

        if (CustId != 0)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        else
        {
            Response.Redirect("CustLogin.aspx");
        }
    }

    protected void BindGrid()
    {
        int CustId = 0;
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel1 = "Select Cust_Id from tbl_Login";
        SqlCommand cmd1 = new SqlCommand(sel1, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        while (dr1.Read())
        {
            CustId = Convert.ToInt32(dr1["Cust_Id"].ToString());
        }
        dr1.Close();

     
        String sel = "SELECT c.Cust_Id, c.Cust_Name, c.Email, c.Contact, o.Order_Id, o.Cust_Id, o.Address_Id, o.Payment_Type, o.Order_Status, o.Added_On, a.Address_Id, a.Address FROM [db_ecare].[dbo].[tbl_Customer] as c Inner Join  [db_ecare].[dbo].[tbl_Order] as o on o.Cust_Id = c.Cust_Id Inner Join [db_ecare].[dbo].[tbl_Address] as a on o.Address_Id = a.Address_Id where c.Cust_Id="+CustId;
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            GridView1.DataSource = dr;
            GridView1.DataBind();
          //  Method_Status();
        } dr.Close();
        con.Close();
    }

   
}