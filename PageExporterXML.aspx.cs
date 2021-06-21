using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exercices_de_revision_WCS_2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GenererXML_Click(object sender, EventArgs e)
        {
            Database.Execute(Connection =>
            {
                DataSet dataSet = new DataSet();
                new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand("select * from Candidat where idCirconscription=@idCir",Connection)
                    {
                        Parameters =
                        {
                            new SqlParameter("@idCir",Circonscripitons.SelectedValue.ToString())
                        }
                    }
                }.Fill(dataSet, "candidat");
                dataSet.Tables["candidat"].WriteXml(@"C:\Users\ISSAM\Desktop\Web Cote Serveur\TP\Exercices de revision WCS 2\CandidatXML.xml");
            }, () =>
            {
                Message.ForeColor = Color.Green;
                Message.Text = "Termine";
            }, Error =>
            {
                Message.ForeColor = Color.Red;
                Message.Text = Error;
            });
        }
    }
}