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
        if (lblConsumerId.Text != "...")
        {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
           // String sel = "select p.Prod_Id,p.Prod_Name,r.Prod_Con_Id, r.Prod_Id,r.Consumer_Id, c.Consumer_id, c.Consumer_type, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP from tbl_Products as p Inner Join tbl_Prod_Consumer as r on r.Prod_Id = p.Prod_Id Inner Join tbl_Consumer as c on c.Consumer_Id = r.Consumer_Id Inner Join tbl_Sub_Prod as s on s.Prod_Id = p.Prod_Id where c.Consumer_Id=" + lblConsumerId.Text;
            String sel = "Select c.Consumer_id, c.Consumer_type, r.Prod_Con_Id, r.Prod_Id,r.Consumer_Id, p.Prod_Id,p.Prod_Name,r.Prod_Con_Id, s.Sub_Prod_Id, s.Prod_Id, s.Image, s.MRP from [db_ecare].[dbo].[tbl_Consumer] as c INNER JOIN [db_ecare].[dbo].[tbl_Prod_Consumer] as r on r.Consumer_Id = c.Consumer_id INNER JOIN [db_ecare].[dbo].[tbl_Products] as p on p.Prod_Id = r.Prod_Id INNER JOIN [db_ecare].[dbo].[tbl_Sub_Prod] as s on s.Prod_Id = p.Prod_Id where s.Sub_Prod_Id = (select Max(Sub_Prod_Id) from [db_ecare].[dbo].[tbl_Sub_Prod] where Prod_id=p.Prod_Id) AND r.Consumer_Id=" + lblConsumerId.Text;
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
        if (DropDownList2.SelectedItem.ToString() == "--Select Consumer--")
        {
            Response.Redirect("CustHome.aspx");
        }

        lblConsumerId.Text = DropDownList2.SelectedValue;
        lblConsumer.Text = DropDownList2.SelectedItem.ToString();
        BindList();
    }
}