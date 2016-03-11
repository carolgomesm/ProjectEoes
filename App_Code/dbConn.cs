using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Data;

/// <summary>
/// Summary description for dbConn
/// </summary>
public class dbConn
{
    MySqlConnection con;
    string conStr = ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;

    public dbConn()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    // this if want to select something in your db
    public MySqlDataAdapter Select(string query)
    {
        con = new MySqlConnection(conStr);
        MySqlDataAdapter Adap;
        return Adap = new MySqlDataAdapter(query, con);
    }


    //Call procedure without parameter --- just input the procedure name
    public DataSet SelectProc(string procName)
    {
        using (con = new MySqlConnection(conStr))
        {
            using (MySqlCommand cmd = new MySqlCommand(procName, con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                using (MySqlDataAdapter Adap = new MySqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    Adap.Fill(ds);
                    return ds;
                }
            }
        }
    }

    // Call procedure with parameters --- input the name of procedure and dictionary with parameter name and value
    public DataSet SelectProcWithParam(string procName, Dictionary<string,string> param)
    {
        using (con = new MySqlConnection(conStr))
        {
            using (MySqlCommand cmd = new MySqlCommand(procName, con))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();

                foreach (KeyValuePair<string, string> entry in param)
                {
                    cmd.Parameters.AddWithValue(entry.Key, entry.Value);
                    cmd.Parameters[entry.Key].Direction = System.Data.ParameterDirection.Input;
                }

                using (MySqlDataAdapter Adap = new MySqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    Adap.Fill(ds);
                    return ds;
                }
            }
        }
    }

    // this if want to insert/delete or update 
    public Boolean Modify(string query)
    {

        con = new MySqlConnection(conStr);
        MySqlCommand command = con.CreateCommand();
        command.CommandText = query;
        con.Open();
        try
        {
            command.ExecuteNonQuery();
            return true;
        }
        catch
        {
            return false;
        }

    }
}

