<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
     </h2>
    <p>
    


    <asp:GridView ID="GridViewClients" runat="server" AutoGenerateColumns="False" AllowSorting="True" Width="80%" HorizontalAlign="Center" Caption="Web Browsers currently available for testing">
        <Columns>
   <asp:BoundField HeaderText="Application" DataField="application_long_name"  />
   <asp:BoundField HeaderText="Application Code" DataField="application_code" />
   <asp:BoundField HeaderText="Status" DataField="availability" />
   <asp:BoundField HeaderText="Platform" DataField="platform_long_name"/>
   <asp:BoundField DataField="response_time" DataFormatString="{0:m:ss}" 
                   HeaderText="Response Time (in seconds)" NullDisplayText="0" 
                   ItemStyle-HorizontalAlign="Center" />
           
        </Columns>
    </asp:GridView>
    </p>
    <p>
   
       
</p>
</asp:Content>
