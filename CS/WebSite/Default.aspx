<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v10.1, Version=10.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v10.1, Version=10.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to select rows via search criterion</title>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
        DataSourceID="SqlDataSource1" KeyFieldName="ProductID" OnCustomCallback="ASPxGridView1_CustomCallback">
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    
    <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Search Product Names">
        <ClientSideEvents Click="function(s, e) {
            popup.ShowAtElement(s.GetMainElement());
        }" />
    </dx:ASPxButton>
    
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup"
        Height="93px" Width="121px">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientInstanceName="tb" Height="17px"
                    Width="118px">
                </dx:ASPxTextBox>
                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" SelectedIndex="0"
                    Width="119px" ClientInstanceName="rb" ValueType="System.Boolean">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Starts with" Value="False" />
                        <dx:ListEditItem Text="Contains" Value="True" />
                    </Items>
                </dx:ASPxRadioButtonList>
                <dx:ASPxButton ID="search" runat="server" AutoPostBack="False" Height="25px" Text="Search"
                    Width="121px">
                    <ClientSideEvents Click="function(s, e) {
                        grid.PerformCallback(rb.GetValue() + &quot;;&quot; + tb.GetText());
                    }" />
                </dx:ASPxButton>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
        SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice] FROM [Products]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
