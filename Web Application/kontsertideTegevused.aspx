<%@ Page Title="Lisa tegevus" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="kontsertideTegevused.aspx.cs" Inherits="Web_Application.kontsertideTegevused" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Lisa tegevus</h2>
    <p>Siin saad lisada tegevuse olemasoleva kontserdi kohta.</p>

    <asp:DetailsView ID="DetailsViewLogi" runat="server"
        DataSourceID="SqlDataSourceLogi"
        AutoGenerateRows="False"
        DefaultMode="Insert"
        DataKeyNames="Id"
        Width="700px"
        GridLines="Both"
        RowStyle-HorizontalAlign="Left">

        <Fields>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" InsertVisible="False" ItemStyle-Width="50px" />
            <asp:BoundField DataField="Aeg" HeaderText="Aeg" ItemStyle-Width="100px" />
            <asp:BoundField DataField="Kasutaja" HeaderText="Kasutaja" ItemStyle-Width="120px" />
            <asp:BoundField DataField="Toiming" HeaderText="Toiming" ItemStyle-Width="150px" />
            <asp:BoundField DataField="Andmed" HeaderText="Andmed" ItemStyle-Width="150px" />
            <asp:TemplateField HeaderText="Kontsert" ItemStyle-Width="150px">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlKontsert" runat="server"
                        DataSourceID="SqlDataSourceKontsertDropdown"
                        DataTextField="kontsertinimi"
                        DataValueField="konsertID"
                        SelectedValue='<%# Bind("konsertID") %>'>
                    </asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowInsertButton="True" InsertText="Lisa" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourceLogi" runat="server"
        ConnectionString="<%$ ConnectionStrings:kontsertConnectionString %>"
        SelectCommand="SELECT * FROM kontsertideTegevused"
        InsertCommand="INSERT INTO kontsertideTegevused (Aeg, Kasutaja, Toiming, Andmed, konsertID) VALUES (@Aeg, @Kasutaja, @Toiming, @Andmed, @konsertID)">
        <InsertParameters>
            <asp:Parameter Name="Aeg" Type="String" />
            <asp:Parameter Name="Kasutaja" Type="String" />
            <asp:Parameter Name="Toiming" Type="DateTime" />
            <asp:Parameter Name="Andmed" Type="String" />
            <asp:Parameter Name="konsertID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceKontsertDropdown" runat="server"
        ConnectionString="<%$ ConnectionStrings:kontsertConnectionString %>"
        SelectCommand="SELECT konsertID, kontsertinimi FROM kontsert">
    </asp:SqlDataSource>
</asp:Content>