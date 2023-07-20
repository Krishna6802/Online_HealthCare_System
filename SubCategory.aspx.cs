using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class SubCategory : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Cat_Id"] != null)
            lblCatId.Text = Request.QueryString["Cat_Id"];
        if (Request.QueryString["Cat_Name"] != null)
            lblHeading.Text = Request.QueryString["Cat_Name"];
        if (lblCatId.Text == "Label")
        {
            Response.Redirect("AllCategories.aspx");
        }
        BindList();
    }

    void BindList()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select *from tbl_Sub_Cat where Sub_Cat_Id in (select Sub_Cat_Id from tbl_Relate_Cat where Cat_Id='" + lblCatId.Text + "')";
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            DataList1.DataSource = dr;
            DataList1.DataBind();
        }

        con.Close();
    }

}