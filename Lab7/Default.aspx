<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lab7._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LoginView runat="server" ViewStateMode="Disabled">
        <AnonymousTemplate>
            <br />
            <asp:Label runat="server" Font-Size="Medium">Для продолжения работы с приложением необходим вход!</asp:Label>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <asp:Label runat="server" Font-Size="Medium">Доступны следующие страницы:</asp:Label>
            <br />
            <asp:TreeView ID="TreeViewMap" runat="server" DataSourceID="SiteMapSource" CssClass="navbar-nav" />
            <br />
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>
