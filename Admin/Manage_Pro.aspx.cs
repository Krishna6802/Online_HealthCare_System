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
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        
        

        if (!IsPostBack)
        {
            String qry = "select *from tbl_Brand";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader dr = cmd.ExecuteReader();

            ddlBrand.Items.Insert(0, "--Select Brand--");
            while (dr.Read())
            {
                ListItem LI = new ListItem();
                LI.Text = dr["Brand"].ToString();
                LI.Value = dr["Brand_Id"].ToString();
                ddlBrand.Items.Add(LI);
            }
            dr.Dispose();

            String qry1 = "select *from tbl_Sub_Cat";
            SqlCommand cmd1 = new SqlCommand(qry1, con);
            SqlDataReader dr1 = cmd1.ExecuteReader();

            ddlSub_Cate.Items.Insert(0, "--Select SUb CAtegory--");
            while (dr1.Read())
            {
                ListItem LI = new ListItem();
                LI.Text = dr1["Sub_Cat"].ToString();
                LI.Value = dr1["Sub_Cat_Id"].ToString();
                ddlSub_Cate.Items.Add(LI);
            }
            dr1.Dispose();

            BindGrid();
        }
    }

    protected void BindGrid()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "Select * from tbl_Consumer";
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
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String check = "select *from tbl_Products where Prod_Name='" + tbProName.Text + "'";
        SqlCommand cmd1 = new SqlCommand(check, con);
        int t1 = cmd1.ExecuteNonQuery();

        if (t1 > 0)
        {
            Response.Write("<script>alert('Product With This Name Already Exist !!') </script>");   
        }
        else
        {
            String ins = "Insert into tbl_Products(Sub_Cat_Id,Prod_Name,Brand_Id,Description,IsAct) values (";
            String select = "select Sub_Cat_Id from tbl_Sub_cat where Sub_Cat='" + ddlSub_Cate.SelectedItem.ToString() + "'";
            SqlCommand cmd4 = new SqlCommand(select, con);
            SqlDataReader dr2 = cmd4.ExecuteReader();
            while (dr2.Read())
            {
                ins += "" + dr2["Sub_Cat_Id"].ToString() + ", ";
            }
            dr2.Dispose();
            ins += "'" + tbProName.Text + "', ";
            String sel = "select Brand_Id from tbl_Brand where Brand='" + ddlBrand.SelectedItem.ToString()+"'";
            SqlCommand cmd2 = new SqlCommand(sel, con);
            SqlDataReader dr = cmd2.ExecuteReader();
            while (dr.Read())
            {
                ins += "" + dr["Brand_Id"].ToString() + ", ";
            } 
            dr.Dispose();
            ins += "'" + tbProDesc.Text.ToString() + "', ";
            ins += "1)";
           
            SqlCommand cmd3 = new SqlCommand(ins, con);
            int t3 = cmd3.ExecuteNonQuery();        
            
            if (t3 > 0)
            {
                Response.Write("<script>alert('Product has Inserted !!') </script>");
            }
             cmd2.Dispose();
        }

        cmd1.Dispose();
        con.Close();

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkIns = (CheckBox)GridView1.Rows[i].Cells[2].FindControl("ChkItem");
            if (chkIns.Checked)
            {
                int id = Convert.ToInt32(GridView1.Rows[i].Cells[0].Text);
                con.Open();
                String catIns = "Insert into tbl_Prod_Consumer(Prod_Id,Consumer_Id) values (";
                catIns += "(SELECT MAX(Prod_Id) AS Result FROM tbl_Products), ";

                catIns += "" + id + ") ";
                cmd1 = new SqlCommand(catIns, con);
                cmd1.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                cmd1.Dispose();
                con.Close();
            }
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