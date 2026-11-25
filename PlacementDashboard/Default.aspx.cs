using System;
using System.Data;
using System.Linq;

namespace PlacementDashboard
{
    public partial class DefaultPage : System.Web.UI.Page
    {
        private DataTable Opportunities
        {
            get
            {
                if (Session["Opportunities"] == null)
                {
                    DataTable table = new DataTable();
                    table.Columns.Add("Company");
                    table.Columns.Add("Role");
                    table.Columns.Add("Package");
                    table.Columns.Add("Eligibility");
                    table.Columns.Add("Status");
                    table.Rows.Add("TechNova", "Software Engineer", "8.0", "7.0 CGPA, no backlogs", "Open");
                    table.Rows.Add("CloudWorks", "Web Developer", "6.5", "6.5 CGPA, C# basics", "Open");
                    table.Rows.Add("DataBridge", "Data Analyst", "7.2", "7.0 CGPA, SQL basics", "Open");
                    table.Rows.Add("BrightApps", "Junior Tester", "5.0", "6.0 CGPA", "Placed");
                    Session["Opportunities"] = table;
                }
                return (DataTable)Session["Opportunities"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StatusFilter.Items.Add("All");
                StatusFilter.Items.Add("Open");
                StatusFilter.Items.Add("Placed");
                BindDashboard();
            }
        }

        protected void StatusFilter_Changed(object sender, EventArgs e)
        {
            BindDashboard();
        }

        protected void PlacementGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string company = PlacementGrid.SelectedDataKey.Value.ToString();
            DataRow row = Opportunities.AsEnumerable().First(r => r["Company"].ToString() == company);
            DataTable details = Opportunities.Clone();
            details.ImportRow(row);
            PlacementDetails.DataSource = details;
            PlacementDetails.DataBind();
        }

        private void BindDashboard()
        {
            DataTable table = Opportunities;
            CompanyCount.Text = table.Rows.Count.ToString();
            OpenCount.Text = table.AsEnumerable().Count(r => r["Status"].ToString() == "Open").ToString();
            PlacedCount.Text = table.AsEnumerable().Count(r => r["Status"].ToString() == "Placed").ToString();

            DataView view = table.DefaultView;
            if (StatusFilter.SelectedValue != "All")
                view.RowFilter = "Status = '" + StatusFilter.SelectedValue + "'";
            PlacementGrid.DataSource = view;
            PlacementGrid.DataBind();
            PlacementDetails.DataSource = null;
            PlacementDetails.DataBind();
        }
    }
}
