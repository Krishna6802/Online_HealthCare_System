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

    public void Method_Status()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);


            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String qry = "select *from tbl_Order where Order_Status=1 AND Order_Id='" + id + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[6].FindControl("ChkOrder");
                chkDeAct.Checked = true;
            }
            else
            {
                CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[6].FindControl("ChkOrder");
                chkDeAct.Checked = false;
            }
            con.Close();
        }
    }
    public void Method_PayStatus()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);


            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String qry = "select *from tbl_Order where Order_Status=1 AND Order_Id='" + id + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                Label PayStatus = (Label)GridView1.Rows[i].Cells[7].FindControl("lblPStatus");
                PayStatus.Text = "Complete";
            }
            else
            {
                Label PayStatus = (Label)GridView1.Rows[i].Cells[7].FindControl("lblPStatus");
                PayStatus.Text = "Panding";
            }
            con.Close();
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    protected void BindGrid()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "SELECT c.Cust_Id, c.Cust_Name, c.Email, c.Contact, o.Order_Id, o.Cust_Id, o.Address_Id, o.Payment_Type, o.Order_Status, o.Added_On, a.Address_Id, a.Address FROM [db_ecare].[dbo].[tbl_Customer] as c Inner Join  [db_ecare].[dbo].[tbl_Order] as o on o.Cust_Id = c.Cust_Id Inner Join [db_ecare].[dbo].[tbl_Address] as a on o.Address_Id = a.Address_Id";
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

    protected void ChkOrder_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Method_Status();
            Method_PayStatus();
        }
        
    }
    protected void ChkOrder_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[6].FindControl("ChkOrder");
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);

            if (chkDeAct.Checked == false)
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_Order set Order_Status = 0 where Order_Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
                Method_PayStatus();
            }

            else
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_Order set Order_Status = 1 where Order_Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
                Method_PayStatus();
            }
        }
    }
}