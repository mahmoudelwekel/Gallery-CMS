<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sitting.aspx.cs" Inherits="Sitting" %>

<%@ Register Src="~/NavBar.ascx" TagPrefix="uc1" TagName="NavBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:NavBar runat="server" ID="NavBar" />
    <fieldset>
        <legend>اعدادات الموقع</legend>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="table-responsive">
                    <asp:GridView
                        ID="infoGV"
                        runat="server"
                        dir="rtl"
                        AllowPaging="True"
                        AutoGenerateColumns="False"
                        CssClass="table  table-hover table-striped table-bordered dataTable text-center"
                        EmptyDataText="لا يوجد نتائج" DataSourceID="infoObjectDataSource" OnRowUpdating="infoGV_RowUpdating" OnRowUpdated="infoGV_RowUpdated">
                        <Columns>
                            <asp:CommandField CancelText="إلغاء" EditText="تعديل" ShowEditButton="True" UpdateText="حفظ" ItemStyle-Width="100px">
                                <ControlStyle CssClass="btn btn-outline-primary  font-weight-bold m-2" />
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="name" HeaderText="أسم المكان" SortExpression="name" ItemStyle-Width="200px">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="عن المكان" SortExpression="description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Text='<%# Bind("description") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%# Eval("description") %>
                                </ItemTemplate>
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="phone" HeaderText="الهاتف" SortExpression="phone" ItemStyle-Width="150px">
                                <ControlStyle CssClass="form-control Gridcontrol" />
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="الصورة" SortExpression="image" ItemStyle-Width="150px">
                                <EditItemTemplate>
                                    <asp:FileUpload runat="server"  Width="150px" ID="infoimageuploder"></asp:FileUpload>
                                </EditItemTemplate>
                                <ItemTemplate>
<%--                                    <a class="btn btn-secondary" href="<%# "data:image/JPEG;base64,"+new Controler().image(Eval("image")) %>" target="_blank"></a>--%>
<%--                                    <asp:Image runat="server" ID="Image1" CssClass="d-block mx-auto img-fluid" Width="100px" ImageUrl='<%# "data:image/JPEG;base64,"+new Controler().image(Eval("image")) %>' />--%>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings PageButtonCount="5" Mode="NumericFirstLast" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="infoObjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="GalleryDataSetTableAdapters.InfoTableAdapter" UpdateMethod="UpdateQuery">
                        <UpdateParameters>
                            <asp:Parameter Name="name" Type="String" />
                            <asp:Parameter Name="description" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </div>
            </ContentTemplate>

            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="infoGV" />--%>
                <asp:PostBackTrigger ControlID="infoGV" />
            </Triggers>

        </asp:UpdatePanel>
    </fieldset>

</asp:Content>

