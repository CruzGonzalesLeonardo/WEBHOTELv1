using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WEBHOTEL
{
    public partial class Reportes : System.Web.UI.Page
    {
        // Datos simulados
        private static DataTable reservas = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CrearDatosSimulados();
            }
        }

        private void CrearDatosSimulados()
        {
            if (reservas.Columns.Count == 0)
            {
                reservas.Columns.Add("Cliente");
                reservas.Columns.Add("Correo");
                reservas.Columns.Add("FechaEntrada", typeof(DateTime));
                reservas.Columns.Add("FechaSalida", typeof(DateTime));
                reservas.Columns.Add("Tipo");

                // Datos de ejemplo
                reservas.Rows.Add("Ana Torres", "ana@gmail.com", DateTime.Today.AddDays(-3), DateTime.Today.AddDays(1), "Doble");
                reservas.Rows.Add("Carlos Ríos", "carlosr@gmail.com", DateTime.Today.AddDays(-1), DateTime.Today.AddDays(2), "Suite");
                reservas.Rows.Add("Lucía Vega", "lucia@gmail.com", DateTime.Today, DateTime.Today.AddDays(4), "Simple");
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DateTime fechaInicio, fechaFin;

            if (!DateTime.TryParse(txtFechaInicio.Text, out fechaInicio) || !DateTime.TryParse(txtFechaFin.Text, out fechaFin))
            {
                lblResultado.Text = "⚠️ Debes ingresar un rango válido.";
                gvReporte.DataSource = null;
                gvReporte.DataBind();
                return;
            }

            if (fechaFin < fechaInicio)
            {
                lblResultado.Text = "⚠️ La fecha final no puede ser menor a la inicial.";
                gvReporte.DataSource = null;
                gvReporte.DataBind();
                return;
            }

            // Filtro por fechas
            DataView vista = new DataView(reservas);
            vista.RowFilter = $"FechaEntrada >= #{fechaInicio.ToShortDateString()}# AND FechaSalida <= #{fechaFin.ToShortDateString()}#";

            gvReporte.DataSource = vista;
            gvReporte.DataBind();

            lblResultado.Text = $"🔍 Se encontraron <strong>{vista.Count}</strong> reservas entre {fechaInicio:dd/MM/yyyy} y {fechaFin:dd/MM/yyyy}.";
        }
    }
}
