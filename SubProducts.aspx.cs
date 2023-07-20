using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class SubProducts : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Prod_Id"] != null)
            lbl_ProdId.Text = Request.QueryString["Prod_Id"];
        if (Request.QueryString["Prod_Name"] != null)
            lblHeading.Text = Request.QueryString["Prod_Name"];
        
        if (lbl_ProdId.Text == "Label")
        {
            Response.Redirect("AllCategories.aspx");
        }

        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String selSub_Pro_Id = "select Sub_Prod_Id from tbl_Sub_Prod where Prod_Id=" + lbl_ProdId.Text + " AND Size='" + RadioButtonList1.SelectedItem + "'";
        SqlCommand cmdsel = new SqlCommand(selSub_Pro_Id, con);
        SqlDataReader drsel = cmdsel.ExecuteReader();

        while (drsel.Read())
        {
            lbl_SubProdId.Text = drsel["Sub_Prod_Id"].ToString();
        }
        drsel.Dispose();

        if (!IsPostBack)
        {
            RadioButtonList1.SelectedIndex = 0;
            
            String sel = "Select p.Prod_Name, p.Description, p.Sub_Cat_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP, s.Stock from tbl_Products as p INNER JOIN tbl_Sub_Prod as s on p.Prod_Id = s.Prod_Id where s.Prod_Id =" + lbl_ProdId.Text + " AND Size in (select size from tbl_Sub_Prod where Sub_Prod_Id in (select Min(Sub_Prod_Id) from tbl_Sub_Prod where Prod_Id="+lbl_ProdId.Text+"))";
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                DataList1.DataSource = dr;
                DataList1.DataBind();
            }

            dr.Dispose();
            con.Close();
        }
        
    }
    void BindList()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();


        String sel = "Select p.Prod_Name, p.Description, p.Sub_Cat_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP, s.Stock from tbl_Products as p INNER JOIN tbl_Sub_Prod as s on p.Prod_Id = s.Prod_Id where s.Prod_Id =" + lbl_ProdId.Text + " AND Size='" + RadioButtonList1.SelectedItem+"'";
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            DataList1.DataSource = dr;
            DataList1.DataBind();
        }
        dr.Dispose();
        con.Close();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindList();
    }
    protected void btnCart_Click(object sender, EventArgs e)
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
            

            String check = "select count(*) from tbl_Cart where Cust_Id="+CustId;
            SqlCommand cmd1 = new SqlCommand(check, con);

            int t1 = (int)cmd1.ExecuteScalar();
            if (t1 <= 0)
            {
                String ins = "insert into tbl_Cart(Cust_Id) values(" + CustId + ")";
                SqlCommand cmd2 = new SqlCommand(ins, con);
                int t2 = cmd2.ExecuteNonQuery();
            }

            String check3 = "select count(*) from tbl_Cart_Details where Cart_Id=(select Cart_Id from tbl_Cart where Cust_Id=" + CustId + ") And Sub_Prod_Id=" + lbl_SubProdId.Text;
  
            SqlCommand cmd3 = new SqlCommand(check3, con);
            int t3 = (int)cmd3.ExecuteScalar();
            if (t3 > 0)
            {
                Response.Write("<script>alert('Already Added !!') </script>");
            }
            else
            {
                String sel = "select Cart_Id from tbl_Cart where Cust_Id=" + CustId;
                SqlCommand cmd4 = new SqlCommand(sel, con);
                SqlDataReader dr4 = cmd4.ExecuteReader();
                while (dr4.Read())
                {
                    lblCartId.Text = dr4["Cart_Id"].ToString();
                }
                dr4.Dispose();
                String ins4 = "insert into tbl_Cart_Details(Cart_Id,Sub_Prod_Id,Qty) values(";
                ins4 += lblCartId.Text + ", ";
                ins4 += lbl_SubProdId.Text + ", ";
                ins4 += TxtQty.Text + ")";
                SqlCommand cmd5 = new SqlCommand(ins4, con);

                int t5 = cmd5.ExecuteNonQuery();

                if (t5 > 0)
                {
                    Response.Write("<script>alert('Added to Cart !!') </script>");
                }
            }
            
            //Response.Write(RadioButtonList1.SelectedValue.ToString()); 
        }
        else
        {
            Response.Redirect("CustLogin.aspx?page=SubProducts&Prod_Id="+lbl_ProdId.Text+"&Prod_Name="+lblHeading.Text);            
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        Label stock = (Label)e.Item.FindControl("lblStock");
        TextBox qty = (TextBox)e.Item.FindControl("TxtQty");
        if(Convert.ToInt32(stock.Text) == 0)
        {
            stock.Text = "Out Of Stock";
            stock.ForeColor = System.Drawing.Color.Red;
            stock.Visible = true;
        }      
    }
}