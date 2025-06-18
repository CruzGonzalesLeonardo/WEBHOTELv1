<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WEBHOTEL.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Reservas de Hotel</title>
    <style>
        /* BARRA LATERAL */
.sidebar {
    width: 220px;
    height: 100vh;
    background-color: #2c3e50;
    position: fixed;
    top: 0;
    left: 0;
    padding: 20px 0;
    color: white;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 24px;
}

.sidebar ul {
    list-style: none;
    padding-left: 0;
}
.sidebar ul li a {
    text-decoration: none;
    color: white;
    display: flex;
    align-items: center;
    width: 100%;
}

.sidebar ul li:hover,
.sidebar ul li.active {
    background-color: #34495e;
    border-left: 4px solid #ffffff;
}
.sidebar ul li {
    padding: 12px 20px;
    font-size: 16px;
    display: flex;
    align-items: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.sidebar ul li span {
    margin-right: 10px;
    font-size: 18px;
}

.sidebar ul li:hover,
.sidebar ul li.active {
    background-color: #34495e;
    border-left: 4px solid #ffffff;
}

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef1f5;
        }

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 220px;
            background-color: #2c3e50;
            padding-top: 20px;
            color: white;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background-color: #34495e;
        }

        .main {
            margin-left: 240px;
            padding: 20px;
        }

        .dashboard {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            flex: 1;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            text-align: center;
        }

        .form-section, .gridview-container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            background-color: #27ae60;
            color: white;
            padding: 12px;
            border: none;
            width: 100%;
            cursor: pointer;
            border-radius: 6px;
            font-weight: bold;
        }

        .success-message {
            color: green;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Sidebar -->
        <div class="sidebar">
            <h2>WEBHOTEL</h2>
            <a href="#">🏠 Inicio</a>
            <a href="#">🛏️ Reservas</a>
            <a href="#">📋 Reportes</a>
            <a href="#">⚙️ Configuración</a>
        </div>

        <!-- Main Content -->
        <div class="main">

            <!-- Dashboard -->
            <div class="dashboard">
                <div class="card">
                    <h3>Habitaciones disponibles</h3>
                    <asp:Label ID="lblDisponibles" runat="server" Text="20" Font-Size="X-Large" />
                </div>
                <div class="card">
                    <h3>Reservas hoy</h3>
                    <asp:Label ID="lblReservasHoy" runat="server" Text="5" Font-Size="X-Large" />
                </div>
            </div>

            <!-- Formulario de reserva -->
            <div class="form-section">
                <h2>Formulario de Reserva</h2>

                <asp:Label ID="lblNombre" runat="server" Text="Nombre completo:"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" />

                <asp:Label ID="lblCorreo" runat="server" Text="Correo electrónico:"></asp:Label>
                <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" />

                <asp:Label ID="lblFechaEntrada" runat="server" Text="Fecha de entrada:"></asp:Label>
                <asp:TextBox ID="txtFechaEntrada" runat="server" TextMode="Date" />

                <asp:Label ID="lblFechaSalida" runat="server" Text="Fecha de salida:"></asp:Label>
                <asp:TextBox ID="txtFechaSalida" runat="server" TextMode="Date" />

                <asp:Label ID="lblTipo" runat="server" Text="Tipo de habitación:"></asp:Label>
                <asp:DropDownList ID="ddlTipo" runat="server">
                    <asp:ListItem Text="Simple" />
                    <asp:ListItem Text="Doble" />
                    <asp:ListItem Text="Suite" />
                </asp:DropDownList>

                <asp:Button ID="btnReservar" runat="server" CssClass="btn" Text="Confirmar Reserva" OnClick="btnReservar_Click" />
                <asp:Label ID="lblMensaje" runat="server" CssClass="success-message" />
            </div>

            <!-- Lista de reservas -->
            <div class="gridview-container">
                <h2>Listado de Reservas</h2>
                <asp:GridView ID="gvReservas" runat="server" AutoGenerateColumns="true" CssClass="table table-bordered" />
            </div>

        </div>

    </form>
                <!-- BARRA LATERAL -->
            <div class="sidebar">
                <h2>WEBHOTEL</h2>
                <ul>
                        <li class="@(Request.Url.AbsolutePath.EndsWith("Home.aspx") ? "active" : "")">
                            <a href="Home.aspx"><span>🏠</span> Inicio</a>
                        </li>
                        <li class="@(Request.Url.AbsolutePath.EndsWith("Reservas.aspx") ? "active" : "")">
                            <a href="Reservas.aspx"><span>🛏️</span> Reservas</a>
                        </li>
                        <li class="@(Request.Url.AbsolutePath.EndsWith("Reportes.aspx") ? "active" : "")">
                            <a href="Reportes.aspx"><span>📋</span> Reportes</a>
                        </li>
                        <li class="@(Request.Url.AbsolutePath.EndsWith("Configuracion.aspx") ? "active" : "")">
                            <a href="Configuracion.aspx"><span>⚙️</span> Configuración</a>
                        </li>
                    </ul>

            </div>

</body>
</html>
