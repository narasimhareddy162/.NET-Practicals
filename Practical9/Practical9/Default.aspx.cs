using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Practical9
{
    public partial class Default : System.Web.UI.Page
    {
        private static readonly string ConnectionString =
            ConfigurationManager.ConnectionStrings["PlacementDb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSummary();
                LoadPlacements();
            }
        }

        private void LoadSummary()
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                con.Open();

                using (SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Students", con))
                {
                    lblTotal.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString();

                    cmd.CommandText =
                        "SELECT COUNT(*) FROM Students WHERE IsPlaced = 1";

                    lblPlaced.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString();

                    cmd.CommandText =
                        "SELECT COUNT(*) FROM Students WHERE IsPlaced = 0";

                    lblUnplaced.Text = Convert.ToInt32(cmd.ExecuteScalar()).ToString();

                    cmd.CommandText =
                        "SELECT MAX(PackageLPA) FROM Students WHERE PackageLPA IS NOT NULL";

                    object result = cmd.ExecuteScalar();

                    decimal highest = result == DBNull.Value || result == null
                        ? 0
                        : Convert.ToDecimal(result);

                    lblHighestPackage.Text = highest.ToString("N2");

                    int total = Convert.ToInt32(lblTotal.Text);
                    int placed = Convert.ToInt32(lblPlaced.Text);

                    decimal percentage = total == 0
                        ? 0
                        : (decimal)placed * 100 / total;

                    lblPercentage.Text = percentage.ToString("N2") + "%";
                }
            }
        }

        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                string query = @"SELECT 
                                    StudentId, 
                                    StudentName, 
                                    RollNumber, 
                                    CGPA, 
                                    IsPlaced, 
                                    CompanyName, 
                                    JobRole, 
                                    PackageLPA 
                                FROM Students 
                                ORDER BY StudentId";

                DataTable dt = new DataTable();

                using (SqlDataAdapter da = new SqlDataAdapter(query, con))
                {
                    da.Fill(dt);
                }

                gvPlacements.DataSource = dt;
                gvPlacements.DataBind();
            }
        }
    }
}