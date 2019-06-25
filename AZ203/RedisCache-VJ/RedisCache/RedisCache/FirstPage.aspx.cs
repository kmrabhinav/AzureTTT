using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StackExchange.Redis;
namespace RedisCache
{
    public partial class FirstPage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(@"Data Source=.;Initial Catalog=Northwind;Integrated Security=True");
            da = new SqlDataAdapter("Select name from sys.tables", con);
            ds = new DataSet();
            da.Fill(ds);

            if (!IsPostBack)
            {
                DropDownList1.DataSource = ds;
                DropDownList1.DataBind();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ConnectionMultiplexer connection = ConnectionMultiplexer.Connect("vatanredis.redis.cache.windows.net:6380,password=PDIaVDvMbIDjckQEibMc8PGqaE24yvFnGG07qFIX32o=,ssl=True,abortConnect=False");
            IDatabase cache = connection.GetDatabase();

            cache.StringSet("tableName", DropDownList1.SelectedItem.ToString());

            Response.Redirect("SecondPage.aspx");
        }
    }
}