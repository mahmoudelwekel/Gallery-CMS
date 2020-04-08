using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    Controler c = new Controler();

  

    protected void infoGV_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        c.GridView_RowUpdated(sender, e);
    }

}