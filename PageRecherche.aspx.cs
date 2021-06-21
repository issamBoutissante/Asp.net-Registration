using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Exercices_de_revision_WCS_2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Database.Execute(Connection =>
                {
                    SqlDataReader reader = new SqlCommand("select distinct LEFT(nomCir,1) from Circonscription",Connection).ExecuteReader();
                    while (reader.Read())
                    {
                        LinkButton alphabetLink = new LinkButton()
                        {
                            Text = reader[0].ToString(),
                        };
                        alphabetLink.ID = "link";
                        alphabetLink.Click += AfficherLesNom;
                        LinkContent.Controls.Add(alphabetLink);
                    }
                    reader.Close();
                }, null, Error =>
                {
                    ErrorMessage.Text = Error;
                });
            }
        }
        protected void AfficherLesNom(object sender, EventArgs e)
        {
            //LinkButton selectedLink = sender as LinkButton;
            //char alphabet = selectedLink.Text[0];
            //Database.Execute(Connection =>
            //{
            //    SqlDataReader reader = new SqlCommand($"select nomCir from Circonscription where LEFT(nomCir,1)='{alphabet}'", Connection)
            //    .ExecuteReader();
            //    while (reader.Read())
            //    {
            //        LinkButton NomLink = new LinkButton()
            //        {
            //            Text = reader["nomCir"].ToString(),
            //        };
            //        LinkContent.Controls.Add(NomLink);
            //    }
            //    reader.Close();
            //}, null, Error =>
            //{
            //    ErrorMessage.Text = Error;
            //});
        }
    }
}