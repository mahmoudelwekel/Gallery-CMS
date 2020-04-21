<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="input-group d-md-flex mb-3">

        <asp:TextBox ID="SearchTxt" dir="rtl" runat="server" CssClass="form-control text-center" placeholder="أكتب أى كلمة للبحث عنها" AutoCompleteType="Search" AutoPostBack="True" OnTextChanged="AddProductToBill_Click" TextMode="Search"></asp:TextBox>
        <div class="input-group-append">
            <asp:LinkButton runat="server" ID="AddProductToBill" CssClass="form-control btn btn-primary font-weight-bolder" OnClick="AddProductToBill_Click">
                    بحث <i class="fas fa-search fa-1x"></i>
            </asp:LinkButton>
        </div>
    </div>


    <%-- <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <div class="addthis_inline_share_toolbox_d5na mb-3"></div>--%>

    <div class="row p-3">
        <div class="col " dir="rtl">

            <a href="Default.aspx" class="btn btn-sm font-weight-bolder btn-outline-primary mt-1" role="button" aria-pressed="true">عرض الكل</a>
            <asp:Repeater runat="server" DataSourceID="CategoriesObjectDataSource">
                <ItemTemplate>
                    <a href="Default.aspx?search=<%#Eval("name") %>" class="btn btn-sm font-weight-bolder btn-outline-primary mt-1" role="button" aria-pressed="true"><%#Eval("name") %></a>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource runat="server" ID="CategoriesObjectDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GalleryDataSetTableAdapters.CategoriesTableAdapter"></asp:ObjectDataSource>

        </div>
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row paginationspages">

                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ProductsViewObjectDataSource">
                    <ItemTemplate>
                    
                        <div class="col-md-4 pageelement py-2">
                            <div class=" card hover border-primary">
                                <img class="img-fluid card-img-top categoryslider-img" src="data:image/JPEG;base64,<%#c.image(Eval("product_image")) %>" alt="" style="height: 300px; object-fit: cover;" />
                                <a class="card-header btn btn-outline-primary  font-weight-bold rounded-0  border-left-0 border-right-0" href="ProductDetails.aspx?i=<%#Eval("product_id") %>">
                                    <div style="overflow: hidden; white-space: nowrap; direction: rtl">
                                        <%#Eval("product_name")%>
                                    </div>
                                </a>
                                <div class="card-body w-100 text-primary categoryslider-body" style="position: absolute; top: 0px; background-color: black; display: none; opacity: .8; overflow-y: scroll; max-height: 100%;">
                                    <h5 class="card-title font-weight-bold"><%#Eval("product_name") %></h5>
                                    <p class="card-text ">
                                        القسم : <%#Eval("category_name") %>
                                        <br />
                                        السعر : <%#Eval("product_price") %>
                                    </p>
                                    <p class="card-text ">
                                        تفاصيل عن المنتج
                        <br />
                                        <%#Eval("product_description") %>
                                    </p>

                                </div>
                                <a href="https://wa.me/2<%= info.Rows[0]["phone"] %>?text=<%#Eval("product_name") %>" class="btn btn-outline-primary card-footer font-weight-bold border-0 w-100" target="_blank">تواصل معنا الأن</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:ObjectDataSource runat="server" ID="ProductsViewObjectDataSource" OldValuesParameterFormatString="original_{0}" SelectMethod="GetSearch" TypeName="GalleryDataSetTableAdapters.Products_ViewTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="search" Name="txt" Type="String" DefaultValue=" "></asp:QueryStringParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>


            </div>

        </ContentTemplate>

        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="AddProductToBill" />
        </Triggers>

    </asp:UpdatePanel>


    <!-- Go to www.addthis.com/dashboard to customize your tools -->
    <%--    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5d62b17de0bd801e"></script>--%>
</asp:Content>

