<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="WEBHOTEL.Reportes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reportes de Reservas</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
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
            color: #2c3e50;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn {
            margin-top: 20px;
            padding: 12px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .summary-box {
            background-color: #ecf0f1;
            padding: 15px;
            border-radius: 8px;
            margin-top: 15px;
            font-size: 18px;
            color: #2c3e50;
        }

        .gridview-container table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .gridview-container th,
        .gridview-container td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .gridview-container th {
            background-color: #bdc3c7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <!-- Filtros -->
            <div class="section">
                <h2>Filtrar Reservas por Fecha</h2>

                <asp:Label runat="server" Text="Fecha Inicio:" />
                <asp:TextBox ID="txtFechaInicio" runat="server" TextMode="Date" />

                <asp:Label runat="server" Text="Fecha Fin:" />
                <asp:TextBox ID="txtFechaFin" runat="server" TextMode="Date" />

                <asp:Button ID="btnFiltrar" runat="server" Text="Buscar Reservas" CssClass="btn" OnClick="btnFiltrar_Click" />

                <asp:Label ID="lblResultado" runat="server" CssClass="summary-box" />
            </div>

            <!-- Resultados -->
            <div class="section gridview-container">
                <h2>Resultados de la búsqueda</h2>
                <asp:GridView ID="gvReporte" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                        <asp:BoundField DataField="Correo" HeaderText="Correo" />
                        <asp:BoundField DataField="FechaEntrada" HeaderText="Entrada" />
                        <asp:BoundField DataField="FechaSalida" HeaderText="Salida" />
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo Habitación" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

</body>
</html>
