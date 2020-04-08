<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddCategory.ascx.cs" Inherits="AddCategory" %>




<!-- Button trigger modal -->
<a class="<%=Class %>" data-toggle="modal" data-target="#ProductsCategoriesModal">
    <%=Text %> <i class="fas fa-plus"></i>
</a>




<!-- Modal -->
<div class="modal fade " id="ProductsCategoriesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

    <div class="modal-dialog " role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalCenterTitle">اضافة قسم</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="ProductsCategoriesname"  runat="server" CssClass="form-control text-right " placeholder="اسم القسم"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon1"><i class="fab fa-accusoft fa-1x"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <asp:TextBox ID="ProductsCategoriescomment" runat="server" CssClass="form-control text-right " placeholder="ملاحظة عن القسم"></asp:TextBox>
                            <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon3"><i class="fas fa-plus fa-1x"></i></span>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="AddProductsCategoriesBtn" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">اغلاق</button>
                <asp:Button ID="AddProductsCategoriesBtn" class="btn btn-outline-success" runat="server" Text="حفظ" OnClick="AddProductsCategoriesBtn_Click"  />
            </div>
        </div>
    </div>
</div>
