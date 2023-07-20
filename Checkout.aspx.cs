using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Checkout : System.Web.UI.Page
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
            lblCustId.Text = CustId.ToString();
        }
        dr1.Close();

        if (CustId != 0)
        {
            if (Request.QueryString["Cart_Id"] != null)
                lbl.Text = Request.QueryString["Cart_Id"];
            Gridview2Bind();
            BindSubtot();
            BindGrandTot();
        }
        else
        {
            Response.Redirect("CustLogin.aspx?page=checkout");
           // Response.Write("<script>alert('To Place order You have to Login First !!')</script>");
        
        }
        BindDataList2();
    }

    protected void Gridview2Bind()
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

            String sel = "select c.Cart_Detail_Id, c.Sub_Prod_Id, c.Qty, c.Cart_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.Size, s.MRP, p.Prod_Id, p.Prod_Name from [db_ecare].[dbo].[tbl_Cart_Details] as c  INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on c.Sub_Prod_Id = s.Sub_Prod_Id INNER JOIN [db_ecare].[dbo].[tbl_Products] as p on s.Prod_Id = p.Prod_Id where c.Cart_Id in (Select Cart_Id from tbl_Cart where Cust_Id=" + CustId + ") ";
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                GridView2.DataSource = dr;
                GridView2.DataBind();
            }
            dr.Dispose();
            dr.Close();
            con.Close();
        }
    }

    protected void BindSubtot()
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            Label SubTotal = (Label)GridView2.Rows[i].Cells[1].FindControl("LblSubTot");
            Label mrp = (Label)GridView2.Rows[i].Cells[1].FindControl("LblMRP");
            Label Qty = (Label)GridView2.Rows[i].Cells[1].FindControl("LblQty");
            int SubTot = Convert.ToInt32(mrp.Text) * Convert.ToInt32(Qty.Text);
            SubTotal.Text = SubTot.ToString();
        }
    }

    protected void btnCheckout_Click(object sender, EventArgs e)
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
            String AddressId = " ";
            if (Request.QueryString["Address_Id"] != null)
            {
                AddressId = Request.QueryString["Address_Id"];
            }
            else
            {
                String sel = "Select top 1 a.Cust_Id, a.[City_Id],a.[Address],a.[Address_Id], c.City_Id, c.City_Name from [db_ecare].[dbo].[tbl_Address] as a INNER JOIN [db_ecare].[dbo].[tbl_City] as c on a.City_Id = c.City_Id where a.Cust_Id=" + lblCustId.Text;
                SqlCommand cmd = new SqlCommand(sel, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    AddressId = dr["Address_Id"].ToString();
                }
                dr.Close();
                
            }
            String ins = "insert into tbl_Order(Cust_Id,Address_Id,Payment_Type,Order_Status,Added_On) values (";
            ins += " " + CustId + " ,";
            ins += " " + AddressId + " ,";
            ins += "'COD' , 0, ";
            ins += "'" + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + "')";
            SqlCommand cmd3 = new SqlCommand(ins, con);
            int t1 = cmd3.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("select MAX(Order_Id) as Order_Id from tbl_Order", con);
            SqlDataReader dr2 = cmd2.ExecuteReader();
            dr2.Read();
            string Order_Id = dr2["Order_Id"].ToString();
            dr2.Close();

            SqlConnection con1 = new SqlConnection(cnStr);
            SqlCommand cmd4 = new SqlCommand("select * from tbl_Cart_details where Cart_Id = (select Cart_Id from tbl_Cart where Cust_Id="+CustId+")", con);
            SqlDataReader dr4 = cmd4.ExecuteReader();
            while (dr4.Read())
            {
                string SubProdId = dr4["Sub_Prod_Id"].ToString();
                string qty = dr4["Qty"].ToString();

                SqlCommand cmd5 = new SqlCommand();
                cmd5.CommandText = "insert into tbl_Order_details(Order_Id,Sub_Prod_Id,Qty) values (" + Order_Id.ToString() + ", " + SubProdId.ToString() + ", " + qty.ToString() + ")";
                con1.Open();
                cmd5.Connection = con1;
                cmd5.ExecuteNonQuery();
                con1.Close();
            }
            dr4.Close();

            SqlCommand cmd6 = new SqlCommand("delete from tbl_Cart_details where Cart_Id=(select Cart_Id from tbl_Cart where Cust_Id=" + CustId + ")", con);
             SqlDataReader dr5 = cmd6.ExecuteReader();
             dr5.Read();
              dr5.Close();
            con.Close();
           // Response.Write("<script>alert('Place Order successful')</script>");
              con.Close();

              Response.Redirect("Invoice.aspx?Order_Id="+Order_Id);
        }
    }

    protected void BindDataList2()
    {
        String AddressId = " ";
        if (Request.QueryString["Address_Id"] != null)
        {
            AddressId = Request.QueryString["Address_Id"];

            SqlConnection con1 = new SqlConnection(cnStr);
            con1.Open();
            String sel = "Select top 1 a.Cust_Id, a.[City_Id],a.[Address],a.[Address_Id], c.City_Id, c.City_Name from [db_ecare].[dbo].[tbl_Address] as a INNER JOIN [db_ecare].[dbo].[tbl_City] as c on a.City_Id = c.City_Id where a.Address_Id=" + AddressId;
            SqlCommand cmd = new SqlCommand(sel, con1);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                DataList2.DataSource = dr;
                DataList2.DataBind();
            }
            con1.Close();
        }
        else
        {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel = "Select top 1 a.Cust_Id, a.[City_Id],a.[Address],a.[Address_Id], c.City_Id, c.City_Name from [db_ecare].[dbo].[tbl_Address] as a INNER JOIN [db_ecare].[dbo].[tbl_City] as c on a.City_Id = c.City_Id where a.Cust_Id=" + lblCustId.Text;
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                DataList2.DataSource = dr;
                DataList2.DataBind();
            }

            con.Close();
        }
        
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustAddress.aspx?Cust_Id="+lblCustId.Text+"&Cart_Id"+lbl.Text);
    }

    protected void BindGrandTot()
    {
        int GrandTot = 0;
        for (int j = 0; j < GridView2.Rows.Count; j++)
        {
            Label SubTotal = (Label)GridView2.Rows[j].Cells[1].FindControl("LblSubTot");

            GrandTot = GrandTot + Convert.ToInt32(SubTotal.Text);
        }
        lblGrandTot.Text = " Grand Total : " + GrandTot.ToString() + " Rs.";
    }
}