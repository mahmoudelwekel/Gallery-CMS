using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GalleryDataSetTableAdapters;

public partial class Sitting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    InfoTableAdapter InfoTableAdapter = new InfoTableAdapter();
    ProductsTableAdapter ProductsTableAdapter = new ProductsTableAdapter();
    Controler c = new Controler();

    protected void infoGV_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            GridViewRow row = (sender as GridView).Rows[e.RowIndex];

            FileUpload flUp = (FileUpload)row.FindControl("infoimageuploder");


            //byte[] imageBytes = null;
            if (flUp != null && flUp.HasFile)
            {
                //byte[] bytes = System.IO.File.ReadAllBytes(@"E:\WORK\Web Apps\Gallery\Images\bg.jpg");

                //variable to store the image content
                //imageBytes = new byte[flUp.PostedFile.ContentLength];
                //HttpPostedFile uploadImage = flUp.PostedFile;
                //read the image stream from the post and store it in imageBytes
                //uploadImage.InputStream.Read(imageBytes, 0, (int)flUp.PostedFile.ContentLength);


                InfoTableAdapter.Updateimage(c.ResizeImageFile(flUp.PostedFile, 512));


            }

        }
        catch (Exception errortxt)
        {
            c.AlertError(this, errortxt);
        }

    }



    protected void infoGV_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        c.GridView_RowUpdated(sender, e);

        Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);

    }

}