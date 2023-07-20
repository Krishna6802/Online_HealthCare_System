using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage_User_ : System.Web.UI.MasterPage
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel1 = "Select count(*) from tbl_Login";
            SqlCommand cmd1 = new SqlCommand(sel1, con);
            int t1 = (int)cmd1.ExecuteScalar();
            if (t1 > 0)
            {
                lblLogin.Text = "Logout";
                btnLogin.ImageUrl = "signout.png";
                btnLogin.Height = 40;
                btnLogin.Width = 40;
            }
            else
            {
                lblLogin.Text = "Login";
                btnLogin.ImageUrl = "login.png";
                btnLogin.Height = 40;
                btnLogin.Width = 40;
            }
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if(lblLogin.Text == "Logout")
        {
            lblLogin.Text = "Login";
            btnLogin.ImageUrl = "login.png";
            btnLogin.Height = 40;
            btnLogin.Width = 40;
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String del1 = "delete from tbl_Login";
            SqlCommand cmd1 = new SqlCommand(del1, con);
            int t1 = cmd1.ExecuteNonQuery();
            if (t1 > 0)
            {
                Response.Redirect("CustHome.aspx");
            }
        }
        else if (lblLogin.Text == "Login")
        {

            lblLogin.Text = "Logout";
            btnLogin.ImageUrl = "signout.png";
            btnLogin.Height = 40;
            btnLogin.Width = 40;
            Response.Redirect("CustLogin.aspx");

            
        }
    }
    protected void btnContact_Click(object sender, EventArgs e)
    {
        String CustId = "";
        SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel1 = "Select count(*) from tbl_Login";
            SqlCommand cmd1 = new SqlCommand(sel1, con);
            int t1 = (int)cmd1.ExecuteScalar();
            if (t1 > 0)
            {
                String sel2 = "Select Cust_Id from tbl_Login";
                SqlCommand cmd2 = new SqlCommand(sel2, con);
                SqlDataReader dr = cmd2.ExecuteReader();
                while (dr.Read())
                {
                    CustId = dr["Cust_Id"].ToString();
                }
                dr.Close();
                String ins = "insert into tbl_Contact (Cust_Id,Comment,Added_On) values( ";
                ins += "'" + CustId + "', ";
                ins += "'" + tbComment.Text + "', ";
                ins += "'" + DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss") + "')";
                SqlCommand cmd = new SqlCommand(ins, con);
                int t2 = cmd.ExecuteNonQuery();
                if (t2 > 0)
                {
                    Response.Write("<script>alert(Your Message is send Successfully !!)</script>");
                }
            }
            else
            {
                Response.Redirect("CustLogin.aspx");
            }
        
        
    }
}
