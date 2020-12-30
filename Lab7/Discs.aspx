<%@ Page Title="Диски" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Discs.aspx.cs" Inherits="Lab7.Discs" %>
<asp:Content ID="ContentDiscs" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelDiscs" runat="server" Font-Size="Large">Список дисков</asp:Label>
    <br />
    Найти диск по стране:&nbsp;<asp:TextBox ID="Country" runat="server" Width="15%" Text=""></asp:TextBox>
    <asp:FormView ID="FormViewInsert" runat="server" DataKeyNames="Id" DataSourceID="SqlDataDiscs">
        <InsertItemTemplate>
           <h4>Добавить:</h4>
            <asp:RegularExpressionValidator ControlToValidate="Name" runat="server" ID="NameReg" ErrorMessage="Неправильное название" ValidationExpression="^.{3,20}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RangeValidator ID="DateCreatReg" runat="server" ControlToValidate="DateOfCreation" ErrorMessage="Неправильное значение даты создания" MinimumValue="2000-01-01" MaximumValue="2022-01-01" Type="Date"></asp:RangeValidator>
            <br />
            <asp:RegularExpressionValidator ControlToValidate="Creater" runat="server" ID="CreaterReg" ErrorMessage="Неправильный создатель" ValidationExpression="^.{3,20}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RegularExpressionValidator ControlToValidate="Country" runat="server" ID="CountryReg" ErrorMessage="Неправильная страна" ValidationExpression="^.{3,50}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RegularExpressionValidator ControlToValidate="MainActor" runat="server" ID="MainActorReg" ErrorMessage="Неправильный главный актер" ValidationExpression="^.{10,100}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RangeValidator ID="DateOfRecordReg" runat="server" ControlToValidate="DateOfRecord" ErrorMessage="Неправильное значение даты записи" MinimumValue="2000-01-01" MaximumValue="2022-01-01" Type="Date"></asp:RangeValidator>
            <br />
            <asp:RegularExpressionValidator ControlToValidate="TypeOfDisc" runat="server" ID="TypeOfDiscReg" ErrorMessage="Неправильный тип" ValidationExpression="^.{3,7}$"></asp:RegularExpressionValidator>
            <br />
            <asp:RangeValidator ID="PriceReg" runat="server" ControlToValidate="Price" ErrorMessage="Неправильная цена" MinimumValue="1" MaximumValue="1000" Type="Double"></asp:RangeValidator>
            <br />
            Название:
            <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Дата создания:
            <asp:TextBox ID="DateOfCreation" runat="server" Text='<%# Bind("DateOfCreation") %>' />
            <br />
            Создатель:
            <asp:TextBox ID="Creater" runat="server" Text='<%# Bind("Creater") %>' />
            <br />
            Страна производства:
            <asp:TextBox ID="Country" runat="server" Text='<%# Bind("Country") %>' />
            <br />
            Главный актер:
            <asp:TextBox ID="MainActor" runat="server" Text='<%# Bind("MainActor") %>' />
            <br />
            Дата записи:
            <asp:TextBox ID="DateOfRecord" runat="server" Text='<%# Bind("DateOfRecord") %>' />
            <br />
            Жанр:
            <asp:DropDownList ID="DropDownListGenre" runat="server" DataSourceID="SqlDataGenres" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("Genre") %>'>
            </asp:DropDownList>
            <br />
            Тип диска:
            <asp:TextBox ID="TypeOfDisc" runat="server" Text='<%# Bind("TypeOfDisc") %>' />
            <br />
            Цена:
            <asp:TextBox ID="Price" runat="server" Text='<%# Bind("Price") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Добавление" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Отмена" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Добавить диск" />
        </ItemTemplate>
    </asp:FormView>
    <br />

    <asp:Label ID="GridViewLabel" runat="server" Text="Диски" Font-Bold="true"/>

    <asp:GridView ID="GridViewDiscs" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataDiscs">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Название" SortExpression="Name" />
            <asp:BoundField DataField="DateOfCreation" HeaderText="Дата создания" SortExpression="DateOfCreation" />
            <asp:BoundField DataField="Creater" HeaderText="Создатель" SortExpression="Creater" />
            <asp:BoundField DataField="Country" HeaderText="Страна" SortExpression="Country" />
            <asp:BoundField DataField="MainActor" HeaderText="Главный актер" SortExpression="MainActor" />
            <asp:BoundField DataField="DateOfRecord" HeaderText="Дата записи" SortExpression="DateOfRecord" />
            <asp:TemplateField HeaderText="Жанр" SortExpression="GenreName">
                <EditItemTemplate>
                    <asp:DropDownList ID="Genre" runat="server" DataSourceID="SqlDataGenres" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("Genre") %>'>
                </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="GenreName" runat="server"  Text='<%# Eval("GenreName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TypeOfDisc" HeaderText="Тип диска" SortExpression="TypeOfDisc" />
            <asp:BoundField DataField="Price" HeaderText="Цена" SortExpression="Price" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataGenres" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VideoRentalCon %>" 
        SelectCommand="SELECT [Id], [Name] FROM [Genres]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataDiscs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:VideoRentalCon %>" 
        SelectCommand="SELECT Discs.Id, Discs.Name, Discs.DateOfCreation, Discs.Creater, Discs.Country, Discs.MainActor, Discs.DateOfRecord, Discs.Genre, Genres.Name as GenreName, Discs.TypeOfDisc, Discs.Price
        FROM [Discs] INNER JOIN Genres ON Discs.Genre = Genres.Id
        WHERE ((Country LIKE '%'+ ISNULL(@Country,'')+'%'))" 
        DeleteCommand="DELETE FROM [Discs] WHERE [Id] = @Id" 
        UpdateCommand="UPDATE [Discs] SET [Name] = @Name, [DateOfCreation] = @DateOfCreation, [Creater] = @Creater, [Country] = @Country, [MainActor] = @MainActor, [DateOfRecord] = @DateOfRecord, [Genre] = @Genre, [TypeOfDisc] = @TypeOfDisc, [Price] = @Price WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Discs] ([Id], [Name], [DateOfCreation], [Creater], [Country], [MainActor], [DateOfRecord], [Genre], [TypeOfDisc], [Price]) VALUES ((SELECT MAX(Discs.Id) FROM Discs) + 1, @Name, @DateOfCreation, @Creater, @Country, @MainActor, @DateOfRecord, @Genre, @TypeOfDisc, @Price)">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="DateOfCreation" Type="DateTime" />
            <asp:Parameter Name="Creater" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="MainActor" Type="String" />
            <asp:Parameter Name="DateOfRecord" Type="DateTime" />
            <asp:Parameter Name="Genre" Type="Int32" />
            <asp:Parameter Name="TypeOfDisc" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Country" Name="Country" PropertyName="Text" ConvertEmptyStringToNull="False" DbType="String"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="DateOfCreation" Type="DateTime" />
            <asp:Parameter Name="Creater" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="MainActor" Type="String" />
            <asp:Parameter Name="DateOfRecord" Type="DateTime" />
            <asp:Parameter Name="Genre" Type="Int32" />
            <asp:Parameter Name="TypeOfDisc" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>