<%@ Page Title="Список клиентов" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="Lab7.Clients" %>
<asp:Content ID="ContentClients" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelClients" runat="server" Font-Size="Large">Список клиентов</asp:Label>
    <br />
    Найти клиента по паспорту:&nbsp;<asp:TextBox ID="Pasport" runat="server" Width="15%" Text=""></asp:TextBox>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataClients">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            <asp:RegularExpressionValidator ControlToValidate="FIO" runat="server" ID="FIOReg" ErrorMessage="Неправильная фамилия" ValidationExpression="^.{10,100}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RegularExpressionValidator ControlToValidate="Pasport" runat="server" ID="PasReg" ErrorMessage="Неправильный паспорт" ValidationExpression="^.{8,9}$"></asp:RegularExpressionValidator>
            <br />
            ФИО:
            <asp:TextBox ID="FIO" runat="server" Text='<%# Bind("FIO") %>' />
            <br />
            Номер:
            <asp:TextBox ID="Number" runat="server" Text='<%# Bind("Number") %>' />
            <br />
            Паспорт:
            <asp:TextBox ID="Pasport" runat="server" Text='<%# Bind("Pasport") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Добавление" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить клиента" />
        </ItemTemplate>
    </asp:FormView>
    <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="Клиенты" Font-Bold="true"></asp:Label>

<asp:GridView ID="GridViewClients" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataClients">
    <Columns>
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="FIO" HeaderText="ФИО" SortExpression="FIO" />
        <asp:BoundField DataField="Number" HeaderText="Номер" SortExpression="Number" />
        <asp:BoundField DataField="Pasport" HeaderText="Паспорт" SortExpression="Pasport" />
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataClients" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VideoRentalCon %>" 
    SelectCommand="SELECT * FROM [Clients] WHERE ((Pasport LIKE '%'+ ISNULL(@Pasport,'')+'%'))" 
    DeleteCommand="DELETE FROM [Clients] WHERE [Id] = @Id" 
    UpdateCommand="UPDATE [Clients] SET [FIO] = @FIO, [Number] = @Number, [Pasport] = @Pasport WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Clients] ([Id], [FIO], [Number], [Pasport]) VALUES ((SELECT MAX(Clients.Id) FROM Clients) + 1, @FIO, @Number, @Pasport)">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="FIO" Type="String" />
        <asp:Parameter Name="Number" Type="Int32" />
        <asp:Parameter Name="Pasport" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="Pasport" Name="Pasport" PropertyName="Text" ConvertEmptyStringToNull="False" DbType="String"/>
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="Int32" />
        <asp:Parameter Name="FIO" Type="String" />
        <asp:Parameter Name="Number" Type="Int32" />
        <asp:Parameter Name="Pasport" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

</asp:Content>
