<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservas.aspx.cs" Inherits="WEBHOTEL.Reservas" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gestión de Reservas</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
        }

        .main {
            margin-left: 240px;
            padding: 30px;
        }

        .section {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn {
            margin-top: 20px;
            padding: 12px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-danger {
            background-color: #e74c3c;
        }

        .success-message {
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }

        .gridview-container {
            margin-top: 20px;
        }

        .gridview-container table {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview-container th,
        .gridview-container td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .gridview-container th {
            background-color: #ecf0f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- CONTENIDO PRINCIPAL -->
        <div class="main">
            <!-- Formulario -->
            <div class="section">
                <h2>Nueva Reserva</h2>

                <asp:Label runat="server" Text="Cliente:"></asp:Label>
                <asp:TextBox ID="txtCliente" runat="server" />

                <asp:Label runat="server" Text="Correo electrónico:"></asp:Label>
                <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" />

                <asp:Label runat="server" Text="Fecha de Entrada:"></asp:Label>
                <asp:TextBox ID="txtEntrada" runat="server" TextMode="Date" />

                <asp:Label runat="server" Text="Fecha de Salida:"></asp:Label>
                <asp:TextBox ID="txtSalida" runat="server" TextMode="Date" />

                <asp:Label runat="server" Text="Tipo de Habitación:"></asp:Label>
                <asp:DropDownList ID="ddlTipo" runat="server">
                    <asp:ListItem Text="Simple" />
                    <asp:ListItem Text="Doble" />
                    <asp:ListItem Text="Matrimonial" />
                    <asp:ListItem Text="Suite" />
                </asp:DropDownList>

                <asp:Button ID="btnGuardar" runat="server" Text="Registrar Reserva" CssClass="btn" OnClick="btnGuardar_Click" />
                <asp:Label ID="lblMensaje" runat="server" CssClass="success-message" />
            </div>

            <!-- Listado -->
            <div class="section gridview-container">
                <h2>Reservas Registradas</h2>
                <asp:GridView ID="gvReservas" runat="server" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvReservas_SelectedIndexChanged" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                        <asp:BoundField DataField="Correo" HeaderText="Correo" />
                        <asp:BoundField DataField="FechaEntrada" HeaderText="Entrada" />
                        <asp:BoundField DataField="FechaSalida" HeaderText="Salida" />
                        <asp:BoundField DataField="Tipo" HeaderText="Habitación" />
                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Reserva Seleccionada" CssClass="btn btn-danger" OnClick="btnEliminar_Click" Visible="false" />
            </div>
        </div>
    </form>

</body>
</html>

