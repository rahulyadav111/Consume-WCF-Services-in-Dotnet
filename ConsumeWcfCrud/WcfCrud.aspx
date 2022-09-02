<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WcfCrud.aspx.cs" Inherits="ConsumeWcfCrud.WcfCrud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
    <form id="form1" runat="server">  
        <div style="width:100%;" align="center">  
            <fieldset style="width:40%;">  
                <legend>Perform CRUD Operations using WCF</legend>  
                <table style="width:100%;">  
                    <tr>  
                        <td>Name</td>  
                        <td>  
                            <asp:TextBox ID="txtName" runat="server" ></asp:TextBox>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td>Salary</td>  
                        <td>  
                            <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td>DeptId</td>  
                        <td>  
                            <asp:TextBox ID="txtDeptId" runat="server"></asp:TextBox>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td></td>  
                        <td class="style1">  
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />  
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"  />  
                        </td>  
                    </tr>  
                    <tr>  
                        <td colspan="2">  
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>  
                        </td>  
                    </tr>  
                    <tr>  
                        <td colspan="2">  
                            <br />  
                        </td>  
                    </tr>  
                    <tr>  
                        <td colspan="2">  
                            <asp:GridView ID="grdWcfTest" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CellPadding="5" Width="100%">  
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />  
                                <Columns>  
                                    <asp:TemplateField HeaderText="Name">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name")%>'>  
                                            </asp:Label>  
                                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("Id")%>'>  
                                            </asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Salary">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblSalary" runat="server" Text='<%#Eval("Salary") %>'>  
                                            </asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="DeptId">  
                                        <ItemTemplate>  
                                            <asp:Label ID="lblDeptId" runat="server" Text='<%#Eval("DeptId") %>'>  
                                            </asp:Label>  
                                        </ItemTemplate>  
                                    </asp:TemplateField>  
                                    <asp:TemplateField HeaderText="Edit">  
                                        <ItemTemplate>  
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CausesValidation="false"  
    CommandArgument=' <%#Eval("Id") %>' OnCommand="lnkEdit_Command" ToolTip="Edit" />  
                                            </ItemTemplate>  
                                        </asp:TemplateField>  
                                        <asp:TemplateField HeaderText="Delete">  
                                            <ItemTemplate>  
                                                <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CausesValidation="false" CommandArgument='<%#Eval("DeptId") %>' CommandName="Delete" OnCommand="lnkDelete_Command" OnClientClick="return confirm('Are you sure you want to delete?')" ToolTip="Delete" />  
                                                </ItemTemplate>  
                                            </asp:TemplateField>  
                                        </Columns>  
                                    </asp:GridView>  
                                </td>  
                            </tr>  
                    </table>  
            </fieldset>  
        </div>  
    </form>  

</body>
</html>
