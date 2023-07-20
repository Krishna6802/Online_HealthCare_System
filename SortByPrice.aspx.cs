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
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select p.Prod_Name, p.Description, p.Sub_Cat_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP, s.Size, s.Stock from [db_ecare].[dbo].[tbl_Products] as p INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on p.Prod_Id = s.Prod_Id order by s.MRP";
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            DLProducts.DataSource = dr;
            DLProducts.DataBind();
        }

        con.Close();
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedValue == "1")
        {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel = "Select p.Prod_Name, p.Description, p.Sub_Cat_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP, s.Size, s.Stock from [db_ecare].[dbo].[tbl_Products] as p INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on p.Prod_Id = s.Prod_Id order by s.MRP desc";
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                DLProducts.DataSource = dr;
                DLProducts.DataBind();
            }

            con.Close();
        }
        else
        {
            BindList();
        }
    }
}