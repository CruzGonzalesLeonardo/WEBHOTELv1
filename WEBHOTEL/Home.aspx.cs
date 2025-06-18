using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WEBHOTEL
{
    public partial class Home : Page
    {
        private static DataTable tablaReservas = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InicializarTabla();
                gvReservas.DataSource = tablaReservas;
                gvReservas.DataBind();
                lblReservasHoy.Text = tablaReservas.Rows.Count.ToString();
                lblDisponibles.Text = (30 - tablaReservas.Rows.Count).ToString(); // Suponiendo 30 habitaciones
            }
        }

        private void InicializarTabla()
        {
            if (tablaReservas.Columns.Count == 0)
            {
                tablaReservas.Columns.Add("Nombre");
                tablaReservas.Columns.Add("Correo");
                tablaReservas.Columns.Add("Fecha Entrada");
                tablaReservas.Columns.Add("Fecha Salida");
                tablaReservas.Columns.Add("Tipo de Habitación");
            }
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombre.Text) || string.IsNullOrWhiteSpace(txtCorreo.Text))
            {
                lblMensaje.Text = "Por favor, completa todos los campos.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            DataRow nueva = tablaReservas.NewRow();
            nueva["Nombre"] = txtNombre.Text.Trim();
            nueva["Correo"] = txtCorreo.Text.Trim();
            nueva["Fecha Entrada"] = txtFechaEntrada.Text;
            nueva["Fecha Salida"] = txtFechaSalida.Text;
            nueva["Tipo de Habitación"] = ddlTipo.SelectedValue;
            tablaReservas.Rows.Add(nueva);

            gvReservas.DataSource = tablaReservas;
            gvReservas.DataBind();

            lblMensaje.Text = "✅ Reserva registrada correctamente.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            // Actualizar dashboard
            lblReservasHoy.Text = tablaReservas.Rows.Count.ToString();
            lblDisponibles.Text = (30 - tablaReservas.Rows.Count).ToString();

            // Limpiar campos
            txtNombre.Text = "";
            txtCorreo.Text = "";
            txtFechaEntrada.Text = "";
            txtFechaSalida.Text = "";
            ddlTipo.SelectedIndex = 0;
        }
    }
}
