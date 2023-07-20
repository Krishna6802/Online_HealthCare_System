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
            String qry = "select *from tbl_Sub_Cat where IsAct=1 AND Sub_Cat_Id='" + id + "'";
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
            BindGrid2();
        }
        if (IsPostBack)
        {
            BindGrid2();
        }
    }

    protected void BindGrid()
    {
         SqlConnection con = new SqlConnection(cnStr);
         con.Open();
         String sel = "Select * from tbl_Sub_Cat";
         SqlCommand cmd = new SqlCommand(sel, con);
         SqlDataReader dr = cmd.ExecuteReader();

         if (dr.HasRows == true)
         {
             GridView1.DataSource = dr;
             GridView1.DataBind();
             Method_Status();
         }
         con.Close(); 
    }

    protected void BindGrid2()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {

            int id = Convert.ToInt32(row.Cells[0].Text);
            GridView G2 = (GridView)row.FindControl("GridView2");

            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String sel = "select Cat from tbl_Categories where Cat_Id in (select Cat_Id from tbl_Relate_Cat where Sub_Cat_Id = " + id + ")";
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Label l = new Label();
                l.Text = dr["Cat"].ToString();
                row.Cells[4].Controls.Add(l);
            }
            con.Close();

        }
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
                String qry = "update tbl_Sub_Cat set IsAct=0 where Sub_Cat_Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
            }

            else
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_Sub_Cat set IsAct=1 where Sub_Cat_Id='" + id + "'";
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

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        BindGrid();
        BindGrid2();
        CheckBox ch = (CheckBox)GridView1.Rows[e.NewEditIndex].FindControl("ChkEmpty");
        ch.Enabled = false;

        Method_Status();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int index = e.RowIndex;
        GridViewRow row = (GridViewRow)GridView1.Rows[index];

        int Sub_Cat_Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        String Cat = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

        FileUpload F1 = (FileUpload)row.FindControl("FU");

        if (F1.HasFile == true)
        {
            String type = F1.PostedFile.ContentType;
            String ContentType = type.Substring(type.LastIndexOf('.') + 1);


            if (type == "image/jpeg" || type == "image/jpg" || type == "image/png" || type == "image/gif")
            {
                Random rnd = new Random();
                String ImgName = rnd.Next(111111, 999999).ToString() + "_" + Path.GetFileName(F1.FileName);
                F1.SaveAs(Server.MapPath("Images/Sub_Cat/") + ImgName);
                Label1.Text = "";

                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_Sub_Cat set Sub_Cat='" + Cat + "' , Image='" + ImgName + "' where Sub_Cat_Id='" + Sub_Cat_Id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                int t = cmd.ExecuteNonQuery();
                if (t > 0)
                {
                    Response.Write("<script>alert('Data has Updated') </script>");
                    GridView1.EditIndex = -1;
                    BindGrid();
                    BindGrid2();
                }

            }
            else
            {
                Label1.Text = "Only jpg, jpeg, png or gif files are allowed";
            }
        }
        else
        {
            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String qry = "update tbl_Sub_Cat set Sub_Cat='" + Cat + "' where Sub_Cat_Id='" + Sub_Cat_Id + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            int t = cmd.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Data has Updated') </script>");
                GridView1.EditIndex = -1;
                BindGrid();
                BindGrid2();
            }
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
        BindGrid2();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Sub_Cat_Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String qry = "Delete from tbl_Sub_Cat where Sub_Cat_Id=" + Sub_Cat_Id;
        SqlCommand cmd = new SqlCommand(qry, con);
        int t = cmd.ExecuteNonQuery();
        if (t > 0)
        {
            Response.Write("<script>alert('Data has Deleted') </script>");
            GridView1.EditIndex = -1;
            BindGrid();
            BindGrid2();
        }
    }
}