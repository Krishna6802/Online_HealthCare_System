using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Cart : System.Web.UI.Page
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
            BindGrandTot();
            String sel = "Select Cart_Id from tbl_Cart where Cust_Id=" + CustId;
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                lblCart_Id.Text = dr["Cart_Id"].ToString();
            }

            if (!IsPostBack)
            {
                BindGrid();
                BindSubTot();
                BindGrandTot();
            }
        }
        else
        {
            Response.Redirect("CustLogin.aspx?page=Cart");            
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
        if (CustId != 0)
        {
            String sel = "select c.Cart_Detail_Id, c.Sub_Prod_Id, c.Qty, c.Cart_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.Size, s.MRP, p.Prod_Id, p.Prod_Name from [db_ecare].[dbo].[tbl_Cart_Details] as c  INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on c.Sub_Prod_Id = s.Sub_Prod_Id INNER JOIN [db_ecare].[dbo].[tbl_Products] as p on s.Prod_Id = p.Prod_Id where c.Cart_Id in (Select Cart_Id from tbl_Cart where Cust_Id=" + CustId + ")";
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                GridView1.DataSource = dr;
                GridView1.DataBind();
            }
            dr.Dispose();
                
            con.Close();  
        }
    }
    
    protected void BindSubTot()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label SubTotal = (Label)GridView1.Rows[i].Cells[5].FindControl("LblSubTot");
                    Label mrp = (Label)GridView1.Rows[i].Cells[3].FindControl("LblMRP");
                    TextBox Qty = (TextBox)GridView1.Rows[i].Cells[4].FindControl("LblQty");
                    int SubTot = Convert.ToInt32(mrp.Text) * Convert.ToInt32(Qty.Text);
                    SubTotal.Text = SubTot.ToString();
                }
    }
    
    protected void LblQty_TextChanged(object sender, EventArgs e)
    {
        int CustId = 0;
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String selLogin = "Select Cust_Id from tbl_Login";
        SqlCommand cmdLogin = new SqlCommand(selLogin, con);
        SqlDataReader drLogin = cmdLogin.ExecuteReader();
        while (drLogin.Read())
        {
            CustId = Convert.ToInt32(drLogin["Cust_Id"].ToString());
        }
        drLogin.Close();

        if (CustId != 0)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                TextBox Qty = (TextBox)GridView1.Rows[i].Cells[4].FindControl("LblQty");
                Label CartDetailId = (Label)GridView1.Rows[i].Cells[2].FindControl("LblCart_Detail_Id");
                if (Convert.ToInt32(Qty.Text) == 0)
                {
                    String qry = "delete from tbl_Cart_Details where Cart_Detail_Id=" + Convert.ToInt32(CartDetailId.Text);
                    SqlCommand cmd = new SqlCommand(qry, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Cart.aspx");
                    con.Close();
                }
                SqlConnection con1 = new SqlConnection(cnStr);
                con1.Open();
                String qry1 = "update tbl_Cart_Details set Qty=" + Qty.Text + " where Cart_Detail_Id=" + Convert.ToInt32(CartDetailId.Text);
                SqlCommand cmd1 = new SqlCommand(qry1, con1);
                cmd1.ExecuteNonQuery();
            }
            BindSubTot();
            BindGrandTot();
        }
        else
        {

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label CartDetailId = (Label)GridView1.Rows[i].Cells[2].FindControl("LblCart_Detail_Id");

            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String qry = "delete from tbl_Cart_Details where Cart_Detail_Id=" + Convert.ToInt32(CartDetailId.Text);
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
            Response.Redirect("Cart.aspx");
            con.Close();
        }
        BindSubTot();
        BindGrandTot();
    }
    
    protected void BindGrandTot()
    {
        int GrandTot = 0;
        for (int j = 0; j < GridView1.Rows.Count; j++)
        {
            Label SubTotal = (Label)GridView1.Rows[j].Cells[5].FindControl("LblSubTot");

            GrandTot = GrandTot + Convert.ToInt32(SubTotal.Text);
        }
        lblGrandTot.Text =" Grand Total : "+ GrandTot.ToString()+" Rs.";
    }
    protected void btnProceed_Click(object sender, EventArgs e)
    {
        Response.Redirect("Checkout.aspx?Cart_Id="+lblCart_Id.Text);
    }
}