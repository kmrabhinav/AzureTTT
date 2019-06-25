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
    public partial class SecondPage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ConnectionMultiplexer connection = ConnectionMultiplexer.Connect("vatanredis.redis.cache.windows.net:6380,password=PDIaVDvMbIDjckQEibMc8PGqaE24yvFnGG07qFIX32o=,ssl=True,abortConnect=False");
            IDatabase cache = connection.GetDatabase();
            string tableName = cache.StringGet("tableName");

            con = new SqlConnection(@"Data Source=.;Initial Catalog=Northwind;Integrated Security=True");
            da = new SqlDataAdapter("Select * from " + tableName, con);
            //da = new SqlDataAdapter("select * from [Order Details]", con);
            ds = new DataSet();
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();


        }
    }
}