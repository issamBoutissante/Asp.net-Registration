using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exercices_de_revision_WCS_2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AfficherElecteur(1);
        }
        protected void AfficherElecteur(object idCirconsctiption)
        {
            Database.Execute(Connection =>
            {
                DataTable condidatsTable = new DataTable();
                new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand("select nomCandidat,prenomCandidat,dateNC from Candidat " +
                    "where idCirconscription=@idCir order by nomCandidat asc", Connection)
                    {
                        Parameters =
                        {
                            new SqlParameter("@idCir",idCirconsctiption.ToString())
                        }
                    }
                }.Fill(condidatsTable);
                ElecteurGridView.DataSource = condidatsTable;
                ElecteurGridView.DataBind();
            }, null,
          Error =>
          {
              ErorMessage.Text = Error;
          });
        }
        protected void Circonscriptions_SelectedIndexChanged(object sender, EventArgs e)
        {
            AfficherElecteur(Circonscriptions.SelectedValue);
        }
    }
}