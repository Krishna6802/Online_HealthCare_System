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
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    protected void BindGrid()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select * from tbl_categories";
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            GridView1.DataSource = dr;
            GridView1.DataBind();
        }
        con.Close();
    }

    protected void btn_Add_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            String type = FileUpload1.PostedFile.ContentType;
            String ContentType = type.Substring(type.LastIndexOf('.') + 1);


            if (type == "image/jpeg" || type == "image/jpg" || type == "image/png" || type == "image/gif")
            {
                Random rnd = new Random();
                String ImgName = rnd.Next(111111, 999999).ToString() + "_" + Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("Images/Sub_Cat/") + ImgName);
                lblImageErr.Text = "";

                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String ins = "Insert into tbl_Sub_Cat(Sub_Cat,Image,IsAct) values (";
                ins += "'" + tbSubCatName.Text + "', ";
                ins += "'" + ImgName + "', ";
                ins += "1)";
                SqlCommand cmd = new SqlCommand(ins, con);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();


                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    CheckBox chkIns = (CheckBox)GridView1.Rows[i].Cells[2].FindControl("ChkItem");
                    if (chkIns.Checked)
                    {
                        int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
                        con.Open();
                        String catIns = "Insert into tbl_Relate_Cat(Sub_Cat_Id,Cat_Id,IsAct) values (";
                        catIns += "(SELECT MAX(Sub_Cat_Id) AS Result FROM tbl_Sub_Cat), ";

                        catIns += "" + id + ", ";
                        catIns += "1)";
                        cmd = new SqlCommand(catIns, con);
                        cmd.ExecuteNonQuery();
                        GridView1.EditIndex = -1;
                        cmd.Dispose();
                        con.Close();
                    }
                }
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
    protected void ChkItem_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ChkStatus = (CheckBox)sender;
        GridViewRow row = (GridViewRow)ChkStatus.NamingContainer;
    }
    protected void ChkHeader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ChkHeader = (CheckBox)GridView1.HeaderRow.FindControl("ChkHeader");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox Chkrow = (CheckBox)row.FindControl("ChkItem");
            if (ChkHeader.Checked == true)
            {
                Chkrow.Checked = true;
            }
            else
            {
                Chkrow.Checked = false;
            }
        }
    }
}