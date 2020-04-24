<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddProduct.ascx.cs" Inherits="AddProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/AddCategory.ascx" TagPrefix="uc1" TagName="AddCategory" %>






<!-- Button trigger modal -->
<a class="<%=Class %>" data-toggle="modal" data-target="#ProductModal">
    <%=Text %> <i class="fas fa-plus"></i>
</a>


<%--data-backdrop="false" --%>

<!-- Modal -->
<div class="modal fade " id="ProductModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">اضافة منتج</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="Productname" runat="server" CssClass="form-control text-right " placeholder="اسم المنتج"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon1"><i class="fas fa-product-hunt fa-1x"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <%--<div class="input-group-prepend">
                                <uc1:AddCategory runat="server" ID="AddProductsCategoriesModal" Class="btn btn-primary text-white" Text="اضافة قسم" />
                            </div>--%>
                            <asp:DropDownList runat="server" dir="rtl" CssClass="form-control text-right DropDownListWithSearch " ID="ProductsCategoryList" DataSourceID="CategoriesObjectDataSource" DataTextField="name" DataValueField="id"></asp:DropDownList>
                            <asp:ObjectDataSource ID="CategoriesObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GalleryDataSetTableAdapters.CategoriesTableAdapter"></asp:ObjectDataSource>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon9"><i class="fab fa-accusoft fa-1x"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="Productprice" TextMode="Number" min="1" runat="server" CssClass="form-control text-right " placeholder="سعر بيع المنتج"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon4"><i class="fas fa-comment-dollar fa-1x"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="Productcomment" TextMode="MultiLine" runat="server" CssClass="form-control text-right " placeholder="ملاحظة عن المنتج"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon5"><i class="fas fa-plus fa-1x"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <div class="custom-file">
<%--                                <ajaxToolkit:AsyncFileUpload ID="FileUpload1111" CssClass="custom-file-input" runat="server" />--%>
                                <asp:FileUpload ID="FileUpload1111" CssClass="custom-file-input" runat="server"  />
                                <label class="custom-file-label" for="inputGroupFile01">أختر الصورة</label>
                            </div>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon6"><i class="fas fa-plus fa-1x"></i></span>
                            </div>
                        </div>


                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="AddProductBtn" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
                <asp:Button ID="AddProductBtn" class="btn btn-outline-success" runat="server" Text="حفظ" OnClick="AddProductBtn_Click" />
            </div>
        </div>
    </div>
</div>

