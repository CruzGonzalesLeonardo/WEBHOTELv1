using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEBHOTEL

{
    public partial class Reservas : System.Web.UI.Page
    {
        private static DataTable tablaReservas = new DataTable();
        private static int indiceSeleccionado = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InicializarTabla();
                CargarDatos();
            }
        }

        private void InicializarTabla()
        {
            if (tablaReservas.Columns.Count == 0)
            {
                tablaReservas.Columns.Add("Cliente");
                tablaReservas.Columns.Add("Correo");
                tablaReservas.Columns.Add("FechaEntrada");
                tablaReservas.Columns.Add("FechaSalida");
                tablaReservas.Columns.Add("Tipo");
            }
        }

        private void CargarDatos()
        {
            gvReservas.DataSource = tablaReservas;
            gvReservas.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCliente.Text) || string.IsNullOrWhiteSpace(txtCorreo.Text))
            {
                lblMensaje.Text = "⚠️ Todos los campos son obligatorios.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
                return;
            }

            DataRow fila = tablaReservas.NewRow();
            fila["Cliente"] = txtCliente.Text.Trim();
            fila["Correo"] = txtCorreo.Text.Trim();
            fila["FechaEntrada"] = txtEntrada.Text;
            fila["FechaSalida"] = txtSalida.Text;
            fila["Tipo"] = ddlTipo.SelectedValue;

            tablaReservas.Rows.Add(fila);
            CargarDatos();

            lblMensaje.Text = "✅ Reserva registrada exitosamente.";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            // Limpiar
            txtCliente.Text = "";
            txtCorreo.Text = "";
            txtEntrada.Text = "";
            txtSalida.Text = "";
            ddlTipo.SelectedIndex = 0;

            btnEliminar.Visible = false;
        }

        protected void gvReservas_SelectedIndexChanged(object sender, EventArgs e)
        {
            indiceSeleccionado = gvReservas.SelectedIndex;
            btnEliminar.Visible = true;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (indiceSeleccionado >= 0 && indiceSeleccionado < tablaReservas.Rows.Count)
            {
                tablaReservas.Rows.RemoveAt(indiceSeleccionado);
                CargarDatos();
                lblMensaje.Text = "❌ Reserva eliminada.";
                lblMensaje.ForeColor = System.Drawing.Color.OrangeRed;
                btnEliminar.Visible = false;
            }
        }
    }
}
