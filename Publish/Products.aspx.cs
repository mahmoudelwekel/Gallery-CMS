using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GalleryDataSetTableAdapters;
using AjaxControlToolkit;

public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    InfoTableAdapter InfoTableAdapter = new InfoTableAdapter();
    ProductsTableAdapter ProductsTableAdapter = new ProductsTableAdapter();
    Controler c = new Controler();

    protected void infoGV_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        c.GridView_RowUpdated(sender, e);
    }

    protected void infoimageuploder_UploadedComplete(object sender, AsyncFileUploadEventArgs e)
    {
        try
        {


            

            AsyncFileUpload flUp = ( sender as AsyncFileUpload);


            //byte[] imageBytes = null;
            if (flUp != null && flUp.HasFile)
            {

                //byte[] bytes = System.IO.File.ReadAllBytes(@"E:\WORK\Web Apps\Gallery\Images\bg.jpg");

                ////variable to store the image content
                //imageBytes = new byte[flUp.PostedFile.ContentLength];
                //HttpPostedFile uploadImage = flUp.PostedFile;
                ////read the image stream from the post and store it in imageBytes
                //uploadImage.InputStream.Read(imageBytes, 0, (int)flUp.PostedFile.ContentLength);

                ProductsTableAdapter.Updateimage(c.ResizeImageFile(flUp.PostedFile, 384), int.Parse(flUp.ToolTip));


            }
                //c.Alert(this, "تم حفظ الصورة بنجاح", row.Cells[1].Text, "info");

        }
        catch (Exception errortxt)
        {
            c.AlertError(this, errortxt);
        }

    }

  
}