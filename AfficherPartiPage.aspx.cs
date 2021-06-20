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
                    ds.Tables["PartiTable"].Columns.Add(new DataColumn("XML", typeof(bool)));
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
    }
}