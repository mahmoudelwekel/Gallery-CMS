<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavBar.ascx.cs" Inherits="NavBar" %>

<%            
    System.Data.DataTable info = new GalleryDataSetTableAdapters.InfoTableAdapter().GetData();


%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="Default.aspx">
        <img src="data:image/JPEG;base64,<%=new Controler().image(info.Rows[0]["image"]) %>" width="30" height="30" class="d-inline-block align-top" alt="" />
        <%=info.Rows[0]["name"] %>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item ">
                <a class="nav-link active" href="Control.aspx">الرئيسية </a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="Sitting.aspx">الأعدادات</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="Categories.aspx">الأقسام</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="Products.aspx">المنتجات</a>
            </li>
        </ul>
    </div>
</nav>
