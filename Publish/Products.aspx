<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register Src="~/AddProduct.ascx" TagPrefix="uc1" TagName="AddProduct" %>
<%@ Register Src="~/NavBar.ascx" TagPrefix="uc1" TagName="NavBar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <uc1:NavBar runat="server" ID="NavBar" />

    <fieldset>
        <legend>تعريف المنتجات</legend>
  
        <uc1:AddProduct runat="server" ID="AddProduct" Class="btn btn-primary text-white btn-block mb-3 btn-lg" Text="اضافة منتج" />
        <asp:updatepanel id="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="table-responsive">
                    <asp:GridView
                        ID="ProductGridView"
                        runat="server"
                        dir="rtl"
                        AllowPaging="True"
                        AllowSorting="True"
                        AutoGenerateColumns="False"
                        CssClass="table  table-hover table-striped table-bordered table-sm dataTable text-center"
                        EmptyDataText="لا يوجد نتائج"  DataKeyNames="id" DataSourceID="ProductsObjectDataSource" OnRowUpdated="infoGV_RowUpdated">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="false" CancelText="الغاء" DeleteText="حذف" EditText="تعديل" UpdateText="حفظ">
                                <ControlStyle CssClass="btn btn-outline-primary  font-weight-bold m-2" />
                            </asp:CommandField>
                            <asp:BoundField DataField="id" HeaderText="الرقم" SortExpression="id" ItemStyle-Width="50px" InsertVisible="False" ReadOnly="True">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="الأسم" SortExpression="name">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="القسم" SortExpression="category">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control DropDownListWithSearch Gridcontrol" DataSourceID="ObjectDataSource1" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("category") %>'></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="labeDropDownList Gridcontrol" DataSourceID="ObjectDataSource1" DataTextField="name" DataValueField="id" SelectedValue='<%# Bind("category") %>'></asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="price" HeaderText="السعر" SortExpression="price">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            </asp:BoundField>
                            <asp:BoundField DataField="description" HeaderText="التفاصيل" SortExpression="description">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="الصورة" SortExpression="image" ItemStyle-Width="150px">
                                <EditItemTemplate>
                                                    
                                    <ajaxToolkit:AsyncFileUpload ID="infoimageuploder"   OnUploadedComplete="infoimageuploder_UploadedComplete"  Width="150px" runat="server" ClientIDMode="AutoID" ToolTip='<%# Bind("id") %>' />

<%--                                    <asp:FileUpload runat="server" ID=""></asp:FileUpload>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
<%--                                    <asp:Image runat="server" ID="Image1" CssClass="d-block mx-auto img-fluid" Width="100px" ImageUrl='<%# "data:image/png;base64,"+new Controler().image(Eval("image")) %>' />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" Mode="NumericFirstLast" />
                    </asp:GridView>

                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GalleryDataSetTableAdapters.CategoriesTableAdapter"></asp:ObjectDataSource>

                    <asp:ObjectDataSource ID="ProductsObjectDataSource" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GalleryDataSetTableAdapters.ProductsTableAdapter" UpdateMethod="UpdateQuery">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="price" Type="Decimal" />
                            <asp:Parameter Name="category" Type="Int32" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>

                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ProductGridView" />
            </Triggers>
        </asp:updatepanel>
    </fieldset>



</asp:Content>

