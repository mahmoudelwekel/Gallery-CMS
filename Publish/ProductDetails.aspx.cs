using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProductDetails : System.Web.UI.Page
{
    public DataTable info = new GalleryDataSetTableAdapters.InfoTableAdapter().GetData();
    public Controler c = new Controler();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}