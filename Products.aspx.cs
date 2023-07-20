using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Products : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Sub_Cat_Id"] != null)
            lbl.Text = Request.QueryString["Sub_Cat_Id"];
        if (Request.QueryString["Sub_Cat_Name"] != null)
            lblHeading.Text = Request.QueryString["Sub_Cat_Name"];
        if (lbl.Text == "Label")
        {
            Response.Redirect("AllCategories.aspx");
        }
        BindList();
    }
    void BindList()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select p.Prod_Id, p.Prod_Name, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP from tbl_Products as p INNER JOIN tbl_Sub_Prod as s on p.Prod_Id = s.Prod_Id where s.Sub_Prod_Id = (select Max(Sub_Prod_Id) from tbl_Sub_Prod where Prod_id=p.Prod_Id) And p.Sub_cat_Id="+lbl.Text.ToString();
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            DLProducts.DataSource = dr;
            DLProducts.DataBind();
        }
        
        con.Close();
    }
}