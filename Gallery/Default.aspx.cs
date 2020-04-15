using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GalleryDataSetTableAdapters;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Request.QueryString["search"]==null)
        //{
        //    Response.Redirect("Default.aspx?search=");
        //}

        //    if (!String.IsNullOrEmpty(Request.QueryString["search"]))
        //    {
        //        SearchTxt.Text= Request.QueryString["search"];

        //    }

        //ProductsTableAdapter dd = new ProductsTableAdapter();
        //byte[] bytes = System.IO.File.ReadAllBytes(@"E:\WORK\Web Apps\Gallery\Images\bg.jpg");

        //dd.UpdateQuery(bytes);
        ////Response.Write(BitConverter.ToString(bytes));
    }

    //Products_ViewTableAdapter Products_ViewTableAdapter = new Products_ViewTableAdapter();

    protected void AddProductToBill_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(SearchTxt.Text) && !string.IsNullOrWhiteSpace(SearchTxt.Text))
        {
            Response.Redirect("Default.aspx?search=" + SearchTxt.Text);
        }
        else
        {
            Response.Redirect("Default.aspx?search=");
        }
    }


    //protected DataTable products()
    //{
    //    string s = Request.QueryString["search"];
    //    if (!String.IsNullOrEmpty(s))
    //    {
    //       return Products_ViewTableAdapter.GetSearch(s);
    //    }
    //    else
    //    {
    //        return Products_ViewTableAdapter.GetData();
    //    }
    //}
}