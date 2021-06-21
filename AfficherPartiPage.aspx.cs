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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Database.Execute(Connection =>
                {
                    DataSet ds = new DataSet();
                    new SqlDataAdapter()
                    {
                        SelectCommand = new SqlCommand("select nomParti,COUNT(C.CINCandidat) nombreCondidat from Parti P join Candidat C " +
                        "on P.idParti=C.idParti group by nomParti", Connection)
                    }.Fill(ds, "PartiTable");
                    PartiGridView.DataSource = ds.Tables["PartiTable"];
                    PartiGridView.DataBind();
                    int nbrTotal = (int)new SqlCommand("select COUNT(*) from Candidat", Connection).ExecuteScalar();
                    NombreTotal.Text = nbrTotal.ToString();
                }, null,
                Error =>
                {
                    ErrorMessage.Text = Error;
                });
            }
        }

        protected void Generer_Click(object sender, EventArgs e)
        {
            DataSet dataSet = new DataSet();
            dataSet.Tables.Add(new DataTable() {
                Columns =
                {
                    new DataColumn("NomParti"),
                    new DataColumn("nombreCondidat"),
                }
            });
            foreach (GridViewRow row in PartiGridView.Rows)
            {
                CheckBox isSelected=row.FindControl("checkbox") as CheckBox;
                if (isSelected.Checked)
                {
                    dataSet.Tables[0].Rows.Add(row.Cells[1].Text, row.Cells[2].Text);
                }
            }
            dataSet.Tables[0].WriteXml(@"C:\Users\ISSAM\Desktop\Web Cote Serveur\TP\Exercices de revision WCS 2\generatedXML.xml");
        }
    }
}