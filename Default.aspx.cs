using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected string searchStr = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

        searchDiv.Attributes["onclick"] = ClientScript.GetPostBackEventReference(this, "FillPageListView");

        searchStr = search.Text;

        FillPageListView();

        //if (!this.IsPostBack)
        //{
        //    FillPageListView();
        //}
        //else
        //{
        //    searchStr = search.Text;
        //    //FillPageListView(searchStr);
        //}


    }

    private void FillPageListView()
    {

        dbConn con = new dbConn();
        DataSet ds;

        if (searchStr != "")
        {
            Dictionary<string, string> Param = new Dictionary<string, string>();
            Param.Add("keyword", searchStr);

            ds = con.SelectProcWithParam("searchList", Param);

        }
        else
        {
            ds = con.SelectProc("PopularResList");

        }

        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }
}