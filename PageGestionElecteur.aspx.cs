using System;
using System.Data.SqlClient;
using System.Drawing;

namespace Exercices_de_revision_WCS_2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Ajouter_Click(object sender, EventArgs e)
        {
            Database.Execute(Connection =>
            {
                new SqlCommand("insert into Candidat values(@cin,@nom,@prenom,@date,@niveau,@ordreListe,@adresse,@cir,@parti,@tranche)",Connection)
                {
                    Parameters =
                    {
                        new SqlParameter("@cin",CIN.Text),
                        new SqlParameter("@nom",Nom.Text),
                        new SqlParameter("@prenom",Prenom.Text),
                        new SqlParameter("@date",DateNaissance.Text),
                        new SqlParameter("@niveau",NiveauScolaire.Text),
                        new SqlParameter("@ordreListe",NumeroOrdreListe.Text),
                        new SqlParameter("@adresse",Adresse.Text),
                        new SqlParameter("@cir",Circonscriptions.SelectedValue.ToString()),
                        new SqlParameter("@parti",Partis.SelectedValue.ToString()),
                        new SqlParameter("@tranche",TrancheAges.SelectedValue.ToString()),
                    }
                }.ExecuteNonQuery();
            }, () =>
            {
                Message.ForeColor = Color.Green;
                Message.Text = "L'ajout a ete effectue";
                GridView1.DataBind();
            }, Error =>
            {
                Message.ForeColor = Color.Red;
                Message.Text = Error;
            });
        }
    }
}