using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exercices_de_revision_WCS_2
{
    public partial class ConnectionPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConnectionBtn_Click(object sender, EventArgs e)
        {
            Database.Execute(Connection =>
            {
                int? resultat = new SqlCommand("select COUNT(*) from Utilisateur where Nom=@nom and password=@pass", Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@nom",Nom.Text),
                        new SqlParameter("@pass",MotPass.Text),
                    }
                }.ExecuteScalar() as int?;
                if (resultat == null)
                {
                    ErrorMessage.Text = "Le Nom ou le mot de pass est incorrect";
                    return;
                }
                Session["Login"] = true;
                Response.Redirect("~/PageAfficherElecteur.aspx");
            }, null,
            Error =>
            {
                ErrorMessage.Text = Error;
            });
        }
    }
}