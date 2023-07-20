using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class Cate_master : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    public void Method_Status()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);


            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String qry = "select *from tbl_categories where IsAct=1 AND Cat_Id='" + id + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[3].FindControl("ChkEmpty");
                chkDeAct.Checked = true;
            }
            else
            {
                CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[3].FindControl("ChkEmpty");
                chkDeAct.Checked = false;
            }
            con.Close();
        }
    }

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
            Method_Status();
        } dr.Close();
        con.Close();
    }

    protected void ChkEmpty_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[3].FindControl("ChkEmpty");
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);

            if (chkDeAct.Checked == false)
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_categories set IsAct=0 where Cat_Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
            }

            else
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_categories set IsAct=1 where Cat_Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
            }
        }
    }

    protected void ChkEmpty_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Method_Status();
        }
    }
    protected void ChkHeader_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chkHeader = (CheckBox)GridView1.HeaderRow.FindControl("ChkHeader");
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chkRow = (CheckBox)row.FindControl("ChkEmpty");
            if (chkHeader.Checked == true)
            {
                chkRow.Checked = true;
            }
            else
            {
                chkRow.Checked = false;
            }
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();
        CheckBox ch = (CheckBox)GridView1.Rows[e.NewEditIndex].FindControl("ChkEmpty");
        ch.Enabled = false;

        Method_Status();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        int index = e.RowIndex;
        GridViewRow row = (GridViewRow)GridView1.Rows[index];

        int Cat_Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        String Cat = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        Response.Write("<script>alert(Cat) </script>");

        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String check = "select count(*) from tbl_Categories where Cat='" + Cat + "' AND Cat_Id !="+Cat_Id;
        SqlCommand cmd1 = new SqlCommand(check, con);

        int t1 = (int)cmd1.ExecuteScalar();
        if (t1 > 0)
        {
            Response.Write("<script>alert('Category With This Name Already Exist') </script>");
        }
        else
        {
            FileUpload F1 = (FileUpload)row.FindControl("FU");

            if (F1.HasFile == true)
            {
                String type = F1.PostedFile.ContentType;
                String ContentType = type.Substring(type.LastIndexOf('.') + 1);


                if (type == "image/jpeg" || type == "image/jpg" || type == "image/png" || type == "image/gif")
                {
                    Random rnd = new Random();
                    String ImgName = rnd.Next(111111, 999999).ToString() + "_" + Path.GetFileName(F1.FileName);
                    F1.SaveAs(Server.MapPath("Images/Cat/") + ImgName);
                    Label1.Text = "";

                    String qry = "update tbl_categories set Cat='" + Cat + "' , Image='" + ImgName + "' where Cat_Id='" + Cat_Id + "'";
                    SqlCommand cmd = new SqlCommand(qry, con);
                    int t = cmd.ExecuteNonQuery();
                    if (t > 0)
                    {
                        Response.Write("<script>alert('Category has Updated') </script>");
                        GridView1.EditIndex = -1;
                        BindGrid();
                    }

                }
                else
                {
                    Label1.Text = "Only jpg, jpeg, png or gif files are allowed";
                }
            }
            else
            {
                String qry = "update tbl_categories set Cat='" + Cat + "' where Cat_Id='" + Cat_Id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Category has Updated') </script>");
                    GridView1.EditIndex = -1;
                    BindGrid();
                }
            }
        }
        
        
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Cat_Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        
        String qry1 = "Delete from tbl_Sub_Cat where Sub_Cat_Id in (select Sub_Cat_Id from tbl_Relate_Cat where Cat_Id =" + Cat_Id+")";
        String qry2 = "Delete from tbl_categories where Cat_Id=" + Cat_Id;
   
        SqlCommand cmd1 = new SqlCommand(qry1, con);
        SqlCommand cmd2 = new SqlCommand(qry2, con);
        int t1 = cmd1.ExecuteNonQuery();
        int t2 = cmd2.ExecuteNonQuery();

        if (t2 > 0)
        {
            Response.Write("<script>alert('Category has Deleted') </script>");
            GridView1.EditIndex = -1;
            BindGrid();
        }
    }
}