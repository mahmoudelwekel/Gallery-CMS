<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>

<%@ Register Src="~/AddCategory.ascx" TagPrefix="uc1" TagName="AddCategory" %>
<%@ Register Src="~/NavBar.ascx" TagPrefix="uc1" TagName="NavBar" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:NavBar runat="server" ID="NavBar" />
    <fieldset>
        <legend>اقسام المنتجات</legend>

        <uc1:AddCategory runat="server" ID="AddCategory" Class="btn btn-primary text-white btn-block mb-3 btn-lg" Text="اضافة قسم"  />

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="table-responsive">
                    <asp:GridView
                        ID="categoriesGridView"
                        runat="server"
                        dir="rtl"
                        AllowPaging="True"
                        AllowSorting="True"
                        AutoGenerateColumns="False"
                        CssClass="table  table-hover table-striped table-bordered dataTable text-center"
                        EmptyDataText="لا يوجد نتائج" DataKeyNames="id" DataSourceID="CategoriesObjectDataSource" PageSize="5" OnRowUpdated="infoGV_RowUpdated">
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
                            <asp:BoundField DataField="description" HeaderText="التفاصيل" SortExpression="description">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            </asp:BoundField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" Mode="NumericFirstLast" />
                    </asp:GridView>

                    <asp:ObjectDataSource ID="CategoriesObjectDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GalleryDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="description" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="Original_id" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>

                </div>
            </ContentTemplate>

            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="infoGV" />--%>
                <asp:AsyncPostBackTrigger ControlID="categoriesGridView" />
            </Triggers>

        </asp:UpdatePanel>



    </fieldset>


    


</asp:Content>

