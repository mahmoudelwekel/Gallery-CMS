using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GalleryDataSetTableAdapters;
using System.Drawing.Imaging;

public partial class AddProduct : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string Class { get; set; }
    public string Text { get; set; }
    ProductsTableAdapter ProductsTableAdapter = new ProductsTableAdapter();
    Controler c = new Controler();


    protected void AddProductBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (c.IsNotEmpty(Productname.Text) && c.IsNotEmpty(FileUpload1111.PostedFile.FileName) && c.IsNotEmpty(Productprice.Text) && c.IsNotEmpty(ProductsCategoryList.SelectedValue))
            {
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "$('#UpdateProgress1').style.display = 'block'", true);

                ProductsTableAdapter.Insert(Productname.Text, decimal.Parse(Productprice.Text), c.ResizeImageFile(FileUpload1111.PostedFile, 384,ImageFormat.Jpeg), int.Parse(ProductsCategoryList.SelectedValue), Productcomment.Text);

                //c.Alert(this.Page, "تم الاضافة بنجاح", "", "success");

                Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
                //Productname.Text = "";
                //ProductsCategoryList.ClearSelection();
                //Productprice.Text = "";
                //Productcomment.Text = "";
            }
            else
            {
                //c.Alert(this.Page, "لم يتم الحفظ بنجاح", "", "warning");
                Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);

            }
        }
        catch (Exception errortxt)
        {
            c.AlertError(this.Page, errortxt);
        }
    }






}