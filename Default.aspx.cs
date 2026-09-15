using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PawCare
{
    public partial class _Default : Page
    {
        string cadena = ConfigurationManager.ConnectionStrings["PawCareConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMascotas();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                cn.Open();  

                using (SqlCommand cmd = new SqlCommand("spInsertarMascota", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@NombreMascota", SqlDbType.VarChar, 100)).Value = txtNombreMascota.Text.Trim();
                    cmd.Parameters.Add(new SqlParameter("@NombreDueno", SqlDbType.VarChar, 100)).Value = txtNombreDueno.Text.Trim();
                    cmd.Parameters.Add(new SqlParameter("@Tipo", SqlDbType.VarChar, 20)).Value = ddlTipo.SelectedValue;
                    cmd.Parameters.Add(new SqlParameter("@Edad", SqlDbType.Int)).Value = int.Parse(txtEdad.Text);
                    cmd.Parameters.Add(new SqlParameter("@Telefono", SqlDbType.VarChar, 9)).Value = txtTelefono.Text.Trim();
                    cmd.Parameters.Add(new SqlParameter("@Observaciones", SqlDbType.VarChar, 500)).Value =
                    string.IsNullOrWhiteSpace(txtObservaciones.Text) ? (object)DBNull.Value : txtObservaciones.Text.Trim();

                    cmd.ExecuteNonQuery();
                    CargarMascotas();
                    txtNombreMascota.Text = "";
                    txtNombreDueno.Text = "";
                    ddlTipo.SelectedIndex = 0;
                    txtEdad.Text = "";
                    txtTelefono.Text = "";
                    txtObservaciones.Text = "";

                }
            }
        }

        private void CargarMascotas()
        {
            using (SqlConnection cn = new SqlConnection(cadena))
            using (SqlCommand cmd = new SqlCommand("spListarMascotas", cn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    gvMascotas.DataSource = dr;
                    gvMascotas.DataBind();
                }
            }
        }

    }
}