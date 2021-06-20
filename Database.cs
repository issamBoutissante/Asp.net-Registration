using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Exercices_de_revision_WCS_2
{
    internal class Database
    {
        internal static string conString = ConfigurationManager.ConnectionStrings["MonConnection"].ConnectionString;
        internal static void Execute(Action<SqlConnection> instrunctions,Action Success=null,Action<string> Error=null)
        {
            SqlConnection Connection = new SqlConnection(conString);
            Connection.Open();
            try
            {
                instrunctions(Connection);
                Success?.Invoke();
            }catch(Exception e)
            {
                Error?.Invoke(e.Message);
            }
            finally
            {
                Connection.Close();
            }
        }
    }
}