<%@ Page Title="Список жанров" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Genres.aspx.cs" Inherits="Lab7.Genres" %>
<asp:Content ID="ContentGenres" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelGenres" runat="server" Font-Size="Large">Список жанров</asp:Label>
    <br />
    Найти жанр по названию:&nbsp;<asp:TextBox ID="Name" runat="server" Width="15%" Text=""></asp:TextBox>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataGenres">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            <asp:RegularExpressionValidator ControlToValidate="Name" runat="server" ID="NameReg" ErrorMessage="Неправильное название" ValidationExpression="^.{3,20}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RegularExpressionValidator ControlToValidate="Descr" runat="server" ID="DescrReg" ErrorMessage="Неправильное описание" ValidationExpression="^.{8,200}$"></asp:RegularExpressionValidator>
            <br />
            Название:
            <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Описание:
            <asp:TextBox ID="Descr" runat="server" Text='<%# Bind("Description") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Добавление" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить жанр" />
        </ItemTemplate>
    </asp:FormView>
    <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="Клиенты" Font-Bold="true"></asp:Label>

<asp:GridView ID="GridViewGenres" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataGenres">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Название" SortExpression="Name" />
        <asp:BoundField DataField="Description" HeaderText="Описание" SortExpression="Description" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataGenres" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VideoRentalCon %>" 
    SelectCommand="SELECT * FROM [Genres] WHERE ((Name LIKE '%'+ ISNULL(@Name,'')+'%'))" 
    DeleteCommand="DELETE FROM [Genres] WHERE [Id] = @Id" 
    UpdateCommand="UPDATE [Genres] SET [Name] = @Name, [Description] = @Description WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Genres] ([Id], [Name], [Description]) VALUES ((SELECT MAX(Genres.Id) FROM Genres) + 1, @Name, @Description)">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="Name" Name="Name" PropertyName="Text" ConvertEmptyStringToNull="False" DbType="String"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
