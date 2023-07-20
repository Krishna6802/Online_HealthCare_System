using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class FilterByBrand : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        BindList();
    }

    void BindList()
    {
        if (lblBrandId.Text != "...")
        {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel = "select p.Prod_Id,p.Prod_Name,p.Brand_Id,b.Brand_Id,b.Brand, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP from tbl_Products as p Inner Join tbl_Brand as b on b.Brand_Id = p.Brand_Id Inner Join tbl_Sub_Prod as s on s.Prod_Id = p.Prod_Id where b.Brand_Id=" + lblBrandId.Text;
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
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedItem.ToString() == "--Select Brand--")
        {
            Response.Redirect("CustHome.aspx");
        }

        lblBrandId.Text = DropDownList2.SelectedValue;
        lblBrand.Text = DropDownList2.SelectedItem.ToString();
        BindList();
    }
}