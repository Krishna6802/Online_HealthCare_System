using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Order_DetailsMaster : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Order_Id"] != null)
            lbl_OrderId.Text = Request.QueryString["Order_Id"];
        BindGrid();
        BindSubtot();
        BindGrandTot();
        if (!IsPostBack)
        {
            BindGrid();
            BindSubtot();
            BindGrandTot();
        }
    }
    protected void BindGrid()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "select o.[Order_Id],o.[Sub_Prod_Id],o.[Qty],s.Sub_Prod_Id,s.Prod_Id,s.Image,s.MRP,s.Size,p.Prod_Id,p.Prod_Name from [db_ecare].[dbo].[tbl_Order_Details] as o Inner Join [db_ecare].[dbo].[tbl_Sub_Prod] as s on s.Sub_Prod_Id = o.Sub_Prod_Id Inner Join [db_ecare].[dbo].[tbl_Products] as p on p.Prod_Id = s.Prod_Id where Order_Id="+lbl_OrderId.Text;
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            GridView1.DataSource = dr;
            GridView1.DataBind();
        } dr.Close();
        con.Close();
    }
    protected void BindSubtot()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label SubTotal = (Label)GridView1.Rows[i].Cells[5].FindControl("LblSubTot");
            Label mrp = (Label)GridView1.Rows[i].Cells[3].FindControl("LblMRP");
            Label Qty = (Label)GridView1.Rows[i].Cells[4].FindControl("LblQty");
            int SubTot = Convert.ToInt32(mrp.Text) * Convert.ToInt32(Qty.Text);
            SubTotal.Text = SubTot.ToString();
        }
    }
    protected void BindGrandTot()
    {
        int GrandTot = 0;
        for (int j = 0; j < GridView1.Rows.Count; j++)
        {
            Label SubTotal = (Label)GridView1.Rows[j].Cells[5].FindControl("LblSubTot");

            GrandTot = GrandTot + Convert.ToInt32(SubTotal.Text);
        }
        lblGrandTot.Text = " Grand Total : " + GrandTot.ToString() + " Rs.";
    }
}