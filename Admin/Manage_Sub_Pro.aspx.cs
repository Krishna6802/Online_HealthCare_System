using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Manage_Cate : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Prod_Name"] != null)
            lbl_ProName.Text = Request.QueryString["Prod_Name"];
        if (Request.QueryString["Prod_Id"] != null)
            lbl_ProdId.Text = Request.QueryString["Prod_Id"]; 
    
    }
   
    protected void btn_Add_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String check = "select count(*) from tbl_Sub_Prod where Size='" + tbProSize.Text + "' AND Prod_Id=" + Convert.ToInt32(lbl_ProdId.Text);
        SqlCommand cmd1 = new SqlCommand(check, con);
        
        int t1 = (int)cmd1.ExecuteScalar();
        if (t1 > 0)
        {
            Response.Write("<script>alert('Sub Product of This size Already Exist !!') </script>");   
        }
        else
        {
            if (FileUpload1.HasFile == true)
            {
                String type = FileUpload1.PostedFile.ContentType;
                String ContentType = type.Substring(type.LastIndexOf('.') + 1);

                if (type == "image/jpeg" || type == "image/jpg" || type == "image/png" || type == "image/gif")
                {
                    Random rnd = new Random();
                    String ImgName = rnd.Next(111111, 999999).ToString() + "_" + Path.GetFileName(FileUpload1.FileName);
                    FileUpload1.SaveAs(Server.MapPath("Images/Cat/") + ImgName);
                    lblImageErr.Text = "";

                    String ins = "Insert into tbl_Sub_Prod(Prod_Id,Image,Size,MRP,Stock,IsAct) values (";
                    ins += "'" + Convert.ToInt32(lbl_ProdId.Text) + "', ";
                    ins += "'" + ImgName + "', ";
                    ins += "'" + tbProSize.Text.ToString() + "', ";
                    ins += "'" + Convert.ToDouble(tbProMRP.Text) + "', ";
                    ins += "'" + Convert.ToInt32(tbProStock.Text) + "', ";
                    ins += "1)";
                    SqlCommand cmd2 = new SqlCommand(ins, con);
                    int t2 = cmd2.ExecuteNonQuery();

                    if (t2 > 0)
                    {
                        Response.Write("<script>alert('Sub_Product has Inserted !!') </script>");
                        Response.Redirect("Sub_Pro_Master.aspx?Prod_Id=" + Convert.ToInt32(lbl_ProdId.Text));
                    }
                    cmd2.Dispose();
                }
                else
                {
                    lblImageErr.Text = "Only jpg, jpeg, png or gif files are allowed";
                }
            }
            else
            {
                lblImageErr.Text = "Please select Image";
            }
        }

        cmd1.Dispose();
        con.Close();
    }
}