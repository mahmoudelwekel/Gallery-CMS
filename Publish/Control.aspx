<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Control.aspx.cs" Inherits="Control" %>

<%@ Register Src="~/NavBar.ascx" TagPrefix="uc1" TagName="NavBar" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <uc1:NavBar runat="server" ID="NavBar" />
    <h1  class="font-weight-bolder py-5 my-5">
        لوحة التحكم الرئيسية
    </h1>


</asp:Content>

