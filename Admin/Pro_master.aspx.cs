using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Pro_master : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    public void Method_Status()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);


            SqlConnection con = new SqlConnection(cnStr);
            con.Open();
            String qry = "select *from tbl_Products where IsAct=1 AND Prod_Id='" + id + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows == true)
            {
                CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[5].FindControl("ChkEmpty");
                chkDeAct.Checked = true;
            }
            else
            {
                CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[5].FindControl("ChkEmpty");
                chkDeAct.Checked = false;
            }
            dr.Dispose();
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
        String sel = "Select * from tbl_Products";
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            GridView1.DataSource = dr;
            GridView1.DataBind();
            Method_Status();
        }
        dr.Dispose();
    }
    protected void BindGrid2()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        foreach (GridViewRow row in GridView1.Rows)
        {
            int id = Convert.ToInt32(row.Cells[0].Text);
            String selectBrand = "select Brand from tbl_Brand where Brand_Id in (select Brand_Id from tbl_Products where Prod_Id = " + id + ")";
           // String selectDesc = "select Description from tbl_Products where Prod_Id = " + id ;
            SqlCommand cmd1 = new SqlCommand(selectBrand, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();

            while (dr1.Read())
            {
                Label l = new Label();
                l.Text =  dr1["Brand"].ToString();
                row.Cells[3].Controls.Add(l);
            }
            dr1.Dispose();

            String selectSub_Cat = "select Sub_Cat from tbl_Sub_Cat where Sub_Cat_Id in (select Sub_Cat_Id from tbl_Products where Prod_Id = " + id + ")";
            SqlCommand cmd2 = new SqlCommand(selectSub_Cat, con);
            SqlDataReader dr2 = cmd2.ExecuteReader();

            while (dr2.Read())
            {
                Label l = new Label();
                l.Text =  dr2["Sub_cat"].ToString() ;
                row.Cells[2].Controls.Add(l);
            }
            dr2.Dispose();
        }

        foreach (GridViewRow row in GridView1.Rows)
        {

            int id = Convert.ToInt32(row.Cells[0].Text);
            GridView G2 = (GridView)row.FindControl("GridView2");

            String sel = "select Consumer_type from tbl_Consumer where Consumer_Id in (select Consumer_Id from tbl_Prod_Consumer where Prod_Id = " + id + ")";
            SqlCommand cmd = new SqlCommand(sel, con);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                Label l = new Label();
                l.Text = dr["Consumer_type"].ToString()+"<br>";
                row.Cells[4].Controls.Add(l);
            }
            dr.Dispose();
        }
        con.Close();
    }

    protected void ChkEmpty_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkDeAct = (CheckBox)GridView1.Rows[i].Cells[5].FindControl("ChkEmpty");
            int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);

            if (chkDeAct.Checked == false)
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_Products set IsAct=0 where Prod_Id='" + id + "'";
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
            }

            else
            {
                SqlConnection con = new SqlConnection(cnStr);
                con.Open();
                String qry = "update tbl_Products set IsAct=1 where Prod_Id='" + id + "'";
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

        DropDownList ddlBrand = (DropDownList)row.FindControl("ddlBrand");
        DropDownList ddlSub_Cate = (DropDownList)row.FindControl("ddlSub_Cate");

        SqlConnection con = new SqlConnection(cnStr);

        int Prod_Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        String Prod_Name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

        con.Open();
        String check = "select count(*) from tbl_Products where Prod_Name='" + Prod_Name + "' AND Prod_Id !=" + Prod_Id;
        SqlCommand cmd2 = new SqlCommand(check, con);
        int t1 = (int)cmd2.ExecuteScalar();
        if (t1 > 0)
        {
            Response.Write("<script>alert('Product With This Name Already Exist') </script>");
        }
        else
        {
            String qry3 = "update tbl_Products set Prod_Name='" + Prod_Name + "', Sub_Cat_Id=";
            
            String select = "select Sub_Cat_Id from tbl_Sub_cat where Sub_Cat='" + ddlSub_Cate.SelectedItem.ToString() + "'";
            SqlCommand cmd4 = new SqlCommand(select, con);
            SqlDataReader dr2 = cmd4.ExecuteReader();
            while (dr2.Read())
            {
                qry3 += "" + dr2["Sub_Cat_Id"].ToString() ;
            }
            dr2.Dispose();
            qry3 += ", Brand_Id=";
            String sel = "select Brand_Id from tbl_Brand where Brand='" + ddlBrand.SelectedItem.ToString()+"'";
            SqlCommand cmd5 = new SqlCommand(sel, con);
            SqlDataReader dr3 = cmd5.ExecuteReader();
            while (dr3.Read())
            {
                qry3 += "" + dr3["Brand_Id"].ToString() + " ";
            } 
            dr3.Dispose();
            qry3 += "where Prod_Id='" + Prod_Id + "'";
            SqlCommand cmd3 = new SqlCommand(qry3, con);
            int t = cmd3.ExecuteNonQuery();
            if (t > 0)
            {
                Response.Write("<script>alert('Product has Updated') </script>");
                GridView1.EditIndex = -1;
                BindGrid();
                BindGrid2();
            }  
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Prod_Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();

        String qry1 = "Delete from tbl_Products where Prod_Id =" + Prod_Id ;
        String qry2 = "Delete from tbl_Sub_Prod where Prod_Id=" + Prod_Id;

        SqlCommand cmd1 = new SqlCommand(qry1, con);
        SqlCommand cmd2 = new SqlCommand(qry2, con);
        int t1 = cmd1.ExecuteNonQuery();
        int t2 = cmd2.ExecuteNonQuery();

        if (t1 > 0)
        {
            Response.Write("<script>alert('Product has Deleted') </script>");
            GridView1.EditIndex = -1;
            BindGrid();
            BindGrid2();
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        BindGrid();
        BindGrid2();
    }
    protected void ddlSub_Cate_Load(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            DropDownList ddlSub_Cate = (DropDownList)row.FindControl("ddlSub_Cate");
           // Response.Write(ddlSub_Cate.Items.ToString());
        }

    }
}