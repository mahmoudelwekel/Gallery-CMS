using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Drawing.Imaging;
/// <summary>
/// Summary description for Class1
/// </summary>
public class Controler
{
    public Controler()
    {
        //
        // TODO: Add constructor logic here
        //
    }



    public void AlertError(Page Owner, Exception Exception)
    {
        try
        {
            ScriptManager.RegisterClientScriptBlock(Owner, this.GetType(), "alertMessage", "alert('" + Exception.Message + "')", true);
        }
        catch (Exception)
        {
        }
    }

    public void Alert(Page Owner, string title, string text, string type)
    {
        try
        {
            ScriptManager.RegisterClientScriptBlock(Owner, this.GetType(), "alertMessage", "alert('" + title + "')", true);

        }
        catch (Exception errortxt)
        {
            AlertError(Owner, errortxt);
        }
    }


    public string image(object image)
    {
        try
        {

            if (!Convert.IsDBNull(image))
            {
                return Convert.ToBase64String((byte[])image);
            }
            else
            {
                return "";
            }
        }
        catch (Exception)
        {
            return "";
        }
    }
    

    public void GridView_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        GridView GridView = sender as GridView;
        try
        {
            if (e.Exception == null)
            {
                //string keyFieldValue = e.Keys[0].ToString();
                Alert(GridView.Page, "تم التعديل بنجاح", "", "success");
            }
            else
            {
                AlertError(GridView.Page, e.Exception);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }
        catch (Exception errortxt)
        {
            AlertError(GridView.Page, errortxt);
        }
    }


    public bool IsNotEmpty(string text)
    {
        try
        {
            if (string.IsNullOrEmpty(text) && string.IsNullOrWhiteSpace(text))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        catch (Exception)
        {
            return false;
        }
    }



    public byte[] ResizeImageFile(HttpPostedFile imageFile, int targetSize) // Set targetSize to 1024
    {
        //try
        //{

        using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(imageFile.InputStream))
        {
            Size newSize = CalculateDimensions(oldImage.Size, targetSize);
            //if (newSize.Height < oldImage.Size.Height && newSize.Width < oldImage.Size.Width)
            //{
                using (Bitmap newImage = new Bitmap(newSize.Width, newSize.Height, PixelFormat.Format32bppArgb))
                {
                
                    using (Graphics canvas = Graphics.FromImage(newImage))
                    {
                        canvas.SmoothingMode = SmoothingMode.AntiAlias;
                        canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        canvas.DrawImage(oldImage, new Rectangle(new Point(0, 0), newSize));
                        MemoryStream m = new MemoryStream();
                        newImage.Save(m, ImageFormat.Png);
                        return m.GetBuffer();
                    }
                }
            //}
            //else
            //{
            //    byte[] imageBytes = null;
            //    imageBytes = new byte[imageFile.ContentLength];
            //    imageFile.InputStream.Read(imageBytes, 0, (int)imageFile.ContentLength);
            //    return imageBytes;
            //}

        }
        //}
        //catch (Exception)
        //{           
        //    byte[] imageBytes = null;
        //    imageBytes = new byte[imageFile.ContentLength];
        //    imageFile.InputStream.Read(imageBytes, 0, (int)imageFile.ContentLength);
        //    return imageBytes;
        //}
    }




    public static Size CalculateDimensions(Size oldSize, int targetSize)
    {
        Size newSize = new Size();
        if (oldSize.Height > oldSize.Width)
        {
            newSize.Width = (int)(oldSize.Width * ((float)targetSize / (float)oldSize.Height));
            newSize.Height = targetSize;
        }
        else
        {
            newSize.Width = targetSize;
            newSize.Height = (int)(oldSize.Height * ((float)targetSize / (float)oldSize.Width));
        }
        return newSize;
    }



}