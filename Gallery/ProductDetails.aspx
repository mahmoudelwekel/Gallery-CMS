<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ProductsViewObjectDataSource">
        <ItemTemplate>
            <div class="card text-right">
                <div class="row no-gutters">
                    <div class="col-md-6 p-3">
                        <a data-toggle="modal" href="#" data-target="#exampleModal">
                            <img class="card-img img-fluid  h-100 w-100" src="data:image/JPEG;base64,<%#c.image(Eval("product_image")) %>" alt="" style="object-fit: contain;" />
                        </a>
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h4 class="card-title font-weight-bold" dir="rtl"><%#Eval("product_name")%></h4>
                            <hr />
                            <p class="card-text text-pre" dir="rtl"><%#Eval("product_description") %></p>
                            <p class="card-text" dir="rtl"><small class="text-muted h6 font-weight-bold">السعر : <%#Eval("product_price") %></small></p>
                            <a href="https://wa.me/2<%= info.Rows[0]["phone"] %>?text=<%#Eval("product_name") %>" class="btn btn-primary  font-weight-bold w-100" target="_blank">اطلب الأن</a>
                            <hr />
                            <p class="card-text" dir="rtl">
                                <a class="btn btn-sm btn-outline-primary font-weight-bold " href="Default.aspx?search=<%#Eval("category_name") %>">
                                    <%#"قسم "+Eval("category_name") %>
                                </a>
                            </p>
                            <p class="card-text text-pre" dir="rtl"><%#Eval("category_description") %></p>

                            <hr />

                            <p class="card-text text-center ">شارك الأن</p>
                            <!-- Go to www.addthis.com/dashboard to customize your tools -->
                            <%--<div class="addthis_inline_share_toolbox_d5na mb-3"></div>--%>
                            <div class="sharethis-inline-share-buttons"></div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Button trigger modal -->


            <!-- Modal -->
            <div class="modal pt-0 fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered  modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body p-0">
                            <img class=" img-fluid h-100 w-100" src="data:image/JPEG;base64,<%#new Controler().image(Eval("product_image")) %>" alt="" />
                        </div>

                    </div>
                </div>
            </div>
        </ItemTemplate>

    </asp:Repeater>
    <asp:ObjectDataSource runat="server" ID="ProductsViewObjectDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataById" TypeName="GalleryDataSetTableAdapters.Products_ViewTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="i" DefaultValue="0" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:ObjectDataSource>

    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <%--    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5d62b17de0bd801e"></script>--%>

    <script type='text/javascript' src='https://platform-api.sharethis.com/js/sharethis.js#property=5eb2b4469fbb400012e5ad44&product=inline-share-buttons' async='async'></script>

</asp:Content>

