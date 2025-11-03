<%@ Page Title="Lisa kontsert" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Web_Application.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Lisa kontsert</h2>
    <p>Siin saad lisada uue kontserdi andmebaasi.</p>

    <asp:DetailsView ID="DetailsView1" runat="server"
        DataSourceID="SqlDataSource1_kontsert"
        AutoGenerateRows="False"
        DataKeyNames="konsertID"
        DefaultMode="Insert"
        Width="400px">

        <Fields>
            <asp:BoundField DataField="kontsertID" HeaderText="Kontsert ID" ReadOnly="True" InsertVisible="False" />
            <asp:BoundField DataField="kontsertinimi" HeaderText="Kontserdi nimi" SortExpression="kontsertinimi" />
            <asp:BoundField DataField="žanr" HeaderText="Žanr" SortExpression="žanr" />
            <asp:CommandField ShowInsertButton="True" InsertText="Lisa" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource1_kontsert" runat="server"
        ConnectionString="<%$ ConnectionStrings:kontsertConnectionString %>"
        SelectCommand="SELECT * FROM kontsert"
        InsertCommand="INSERT INTO kontsert (kontsertinimi, žanr) VALUES (@kontsertinimi, @žanr)">
        <InsertParameters>
            <asp:Parameter Name="kontsertinimi" Type="String" />
            <asp:Parameter Name="žanr" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>