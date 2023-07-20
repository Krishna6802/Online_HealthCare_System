using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;

using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class Invoice : System.Web.UI.Page
{
    String cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Order_Id"] != null)
            lblOId.Text = Request.QueryString["Order_Id"];

        BindGrid();
        BindSubtot();
        BindGrandTot();
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "SELECT o.[Order_Id],o.[Cust_Id],o.[Address_Id],o.[Payment_Type],o.[Order_Status],o.[Added_On],a.[Address_Id],a.[Address] FROM [db_ecare].[dbo].[tbl_Order] as o Inner Join [db_ecare].[dbo].[tbl_Address] as a on o.Address_Id = a.Address_Id where Order_Id="+lblOId.Text;
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            
            lblODate.Text = dr["Added_On"].ToString();
            lblAdd.Text = dr["Address"].ToString();
            lblPayType.Text = dr["Payment_Type"].ToString();
            lblPayStatus.Text = "Panding";

        }
        dr.Close();
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

    protected void BindGrid()
    {
        SqlConnection con = new SqlConnection(cnStr);
        con.Open();
        String sel = "SELECT o.[Order_Detail_Id] ,o.[Order_Id],o.[Sub_Prod_Id],o.[Qty],s.[Sub_Prod_Id],s.[Prod_Id],s.[Image],s.[Size],s.[MRP],p.[Prod_Id],p.[Prod_Name] FROM [db_ecare].[dbo].[tbl_Order_Details] as o Inner Join [db_ecare].[dbo].[tbl_Sub_Prod] as s on o.Sub_Prod_Id=s.Sub_Prod_Id Inner Join [db_ecare].[dbo].[tbl_Products] as p on s.Prod_Id = p.Prod_Id where o.Order_Id=" + lblOId.Text; 
        SqlCommand cmd = new SqlCommand(sel, con);
        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.HasRows == true)
        {
            GridView1.DataSource = dr;
            GridView1.DataBind();
            //  Method_Status();
        } dr.Close();
        con.Close();
    }

    protected void BindSubtot()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            Label SubTotal = (Label)GridView1.Rows[i].Cells[1].FindControl("LblSubTot");
            Label mrp = (Label)GridView1.Rows[i].Cells[1].FindControl("LblMRP");
            Label Qty = (Label)GridView1.Rows[i].Cells[1].FindControl("LblQty");
            int SubTot = Convert.ToInt32(mrp.Text) * Convert.ToInt32(Qty.Text);
            SubTotal.Text = SubTot.ToString();
        }
    }

    protected void BindGrandTot()
    {
        int GrandTot = 0;
        for (int j = 0; j < GridView1.Rows.Count; j++)
        {
            Label SubTotal = (Label)GridView1.Rows[j].Cells[4].FindControl("LblSubTot");

            GrandTot = GrandTot + Convert.ToInt32(SubTotal.Text);
        }
        lblGrandTot.Text = " Grand Total : " + GrandTot.ToString() + " Rs.";
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {
        exportpdf();
    }

    protected void exportpdf()
    {
        Response.ContentType = "application/pdf";
        Response.AddHeader("content-disposition","attachment;filename=OrderInvoice.pdf");
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        Panel1.RenderControl(hw);
        StringReader sr = new StringReader(sw.ToString());
        Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 100f, 0f);
        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        htmlparser.Parse(sr);
        pdfDoc.Close();
        Response.Write(pdfDoc);
        Response.End();
    }
}