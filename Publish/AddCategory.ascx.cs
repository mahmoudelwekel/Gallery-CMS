using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GalleryDataSetTableAdapters;

public partial class AddCategory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public string Class { get; set; }
    public string Text { get; set; }

    CategoriesTableAdapter products_categoriesTableAdapter = new CategoriesTableAdapter();

    Controler c = new Controler();

    protected void AddProductsCategoriesBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(ProductsCategoriesname.Text) && !string.IsNullOrWhiteSpace(ProductsCategoriesname.Text))
            {

                products_categoriesTableAdapter.Insert(ProductsCategoriesname.Text, ProductsCategoriescomment.Text);

                c.Alert(this.Page, "تم الاضافة بنجاح", "", "success");

                Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
                //ProductsCategoriesname.Text = "";
                //ProductsCategoriescomment.Text = "";
            }
        }
        catch (Exception errortxt)
        {
            c.AlertError(this.Page, errortxt);
        }
    }

}