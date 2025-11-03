<%@ Page Title="Avaleht" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_Application._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Avaleht: Kontsertide ja tegevuste nimekiri</h2>
    <p>Siin on näha kõik kontserdid ja nendega seotud tegevused.</p>

    <asp:GridView ID="GridViewKontsertideTegevused" runat="server"
        DataSourceID="SqlDataSourceKontsertideTegevused"
        AutoGenerateColumns="False"
        GridLines="Both"
        Width="800px">

        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ItemStyle-Width="50px"/>
            <asp:BoundField DataField="Aeg" HeaderText="Aeg" ItemStyle-Width="100px"/>
            <asp:BoundField DataField="Kasutaja" HeaderText="Kasutaja" ItemStyle-Width="120px"/>
            <asp:BoundField DataField="Toiming" HeaderText="Toiming" ItemStyle-Width="200px"/>
            <asp:BoundField DataField="Andmed" HeaderText="Andmed" ItemStyle-Width="150px"/>
            <asp:BoundField DataField="kontsertinimi" HeaderText="Kontsert" ItemStyle-Width="150px"/>
            <asp:BoundField DataField="žanr" HeaderText="Žanr" ItemStyle-Width="100px"/>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceKontsertideTegevused" runat="server"
        ConnectionString="<%$ ConnectionStrings:kontsertConnectionString %>"
        SelectCommand="SELECT t.Id, t.Aeg, t.Kasutaja, t.Toiming, t.Andmed, k.kontsertinimi, k.žanr
                       FROM kontsertideTegevused t
                       INNER JOIN kontsert k ON t.konsertID = k.konsertID">
    </asp:SqlDataSource>
</asp:Content>