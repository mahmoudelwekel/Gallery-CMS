<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ProductsViewObjectDataSource">
        <ItemTemplate>
            <%
            %>
            <div class="card text-right">
                <div class="row no-gutters">
                    <div class="col-md-4 p-3">
                        <a data-toggle="modal" href="#" data-target="#exampleModal">
                            <img class="card-img img-fluid shadow h-100 w-100 border" src="data:image/JPEG;base64,<%#c.image(Eval("product_image")) %>" alt="" style="object-fit: cover;" />
                        </a>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h4 class="card-title font-weight-bold"><%#Eval("product_name")%></h4>
                            <p class="card-text"><%#Eval("product_description") %></p>
                            <p class="card-text" dir="rtl"><small class="text-muted h6 font-weight-bold">السعر : <%#Eval("product_price") %></small></p>
                            <a href="https://wa.me/2<%= info.Rows[0]["phone"] %>?text=<%#Eval("product_name") %>" class="btn btn-outline-primary  font-weight-bold w-100" target="_blank">اطلب الأن</a>
                            <hr />
                            <p class="card-text" dir="rtl">
                                <a href="Default.aspx?search=<%#Eval("category_name") %>">

                                    <%#Eval("category_name") %> : <%#Eval("category_description") %>
                                </a>
                            </p>


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


</asp:Content>

