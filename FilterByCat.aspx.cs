using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class SearchProduct : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    
    }
    void BindList()
    {
        //Response.Write("Hello"+DropDownList2.SelectedValue.ToString());
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select c.Cat_Id, c.Cat, r.R_Cat_Id, r.Sub_Cat_Id, r.Cat_Id, i.Sub_Cat_Id, i.Sub_Cat, p.Sub_Cat_Id, p.Prod_Id, p.Prod_Name, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP from [db_ecare].[dbo].[tbl_Categories] as c INNER JOIN [db_ecare].[dbo].[tbl_Relate_Cat] as r on r.Cat_Id = c.Cat_Id INNER JOIN [db_ecare].[dbo].[tbl_Sub_Cat] as i on i.Sub_Cat_Id = r.Sub_Cat_Id INNER JOIN [db_ecare].[dbo].[tbl_Products] as p on p.Sub_Cat_Id = i.Sub_Cat_Id INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on s.Prod_Id = p.Prod_Id where s.Sub_Prod_Id = (select Max(Sub_Prod_Id) from [db_ecare].[dbo].[tbl_Sub_Prod] where Prod_id=p.Prod_Id) And c.Cat_Id=" + DropDownList2.SelectedValue.ToString();
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
        if (DropDownList2.SelectedItem.ToString() == "--Select Category--")
        {
            DropDownList2.SelectedIndex = 0;
            Response.Redirect("CustHome.aspx");
        }
            BindList();
            BindDDl2();
        
    }

    protected void BindDDl2()
    {
        DropDownList3.Items.Clear();
        DropDownList3.Items.Add("--Select Sub Category--");
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select * from tbl_Sub_Cat where Sub_Cat_Id in (select Sub_Cat_Id from tbl_Relate_Cat where Cat_Id=" + DropDownList2.SelectedValue.ToString()+")";
        Response.Write(sel);
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            ListItem LI = new ListItem();
            LI.Text = dr["Sub_Cat"].ToString();
            LI.Value = dr["Sub_Cat_Id"].ToString();
            DropDownList3.Items.Add(LI);
        }
        dr.Dispose();

        con.Close();
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.SelectedItem.ToString() != "--Select Sub Category--")
        {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel = "Select c.Cat_Id, c.Cat, r.R_Cat_Id, r.Sub_Cat_Id, r.Cat_Id, i.Sub_Cat_Id, i.Sub_Cat, p.Sub_Cat_Id, p.Prod_Id, p.Prod_Name, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP from [db_ecare].[dbo].[tbl_Categories] as c INNER JOIN [db_ecare].[dbo].[tbl_Relate_Cat] as r on r.Cat_Id = c.Cat_Id INNER JOIN [db_ecare].[dbo].[tbl_Sub_Cat] as i on i.Sub_Cat_Id = r.Sub_Cat_Id INNER JOIN [db_ecare].[dbo].[tbl_Products] as p on p.Sub_Cat_Id = i.Sub_Cat_Id INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on s.Prod_Id = p.Prod_Id where s.Sub_Prod_Id = (select Max(Sub_Prod_Id) from [db_ecare].[dbo].[tbl_Sub_Prod] where Prod_id=p.Prod_Id) And c.Cat_Id=" + DropDownList2.SelectedValue.ToString() + " AND i.Sub_Cat_Id=" + DropDownList3.SelectedValue.ToString();
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
            DropDownList3.SelectedIndex = 0;
            BindList();
        }
    }
          
}