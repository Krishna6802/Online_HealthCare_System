using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class CustLogin : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_Login_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String login = "select count(*) from tbl_Customer where Email='" + tbEmail.Text.ToString() + "' And Password='" + tbPass.Text.ToString() + "'";
        SqlCommand cmd1 = new SqlCommand(login, con);

        int t1 = (int)cmd1.ExecuteScalar();
        if (t1 > 0)
        {
            String uName = "select * from tbl_Customer where Email='" + tbEmail.Text.ToString() + "' And Password='" + tbPass.Text.ToString() + "'";
            SqlCommand cmd2 = new SqlCommand(uName, con);
            SqlDataReader dr1 = cmd2.ExecuteReader();

            while (dr1.Read())
            {
                Session["Email"] = dr1["Email"].ToString();
                Session["CustId"] = dr1["Cust_Id"].ToString();
                Session["CustName"] = dr1["Cust_Name"].ToString();

            }
            dr1.Dispose();
            String ins = "insert into tbl_Login (Cust_Id) values(" + Session["CustId"].ToString() + ")";
            SqlCommand cmd3 = new SqlCommand(ins, con);
            int t2 = cmd3.ExecuteNonQuery();
            if (t2 > 0)
            {
                Response.Write("<script>alert('Login Successfully !!') </script>");
                if (Request.QueryString["page"] != null)
                {
                    String page = Request.QueryString["page"].ToString();
                    if (page == "Cart")
                    {
                        Response.Redirect("Cart.aspx");
                    }
                    if (page == "SubProducts")
                    {
                        String Prod_Id = Request.QueryString["Prod_Id"].ToString();
                        String Prod_Name = Request.QueryString["Prod_Name"].ToString();
                        Response.Redirect("SubProducts.aspx?Prod_Id=" + Prod_Id + "&Prod_Name=" + Prod_Name);
                    }
                }
                else
                {
                    Response.Redirect("CustHome.aspx");
                }
            }

        }
    }
}