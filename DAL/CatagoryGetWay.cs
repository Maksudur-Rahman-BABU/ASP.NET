using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using CollegeManegmentSystem.Models;

namespace CollegeManegmentSystem.DAL
{
    public class CatagoryGetWay
    {
        SqlConnection con = new SqlConnection(Connection.GetConnectionString());
        public IQueryable<Catagory> Get() 
        {
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("select Id,CatName,Cost from Ccategories",con);
            sda.Fill(dt);
            return dt.AsEnumerable()
                .Select(r => new Catagory
                {
                    Id=r.Field<int>("Id"),
                    CatName=r.Field<string>("CatName"),
                    Cost=r.Field<int>("Cost")
                })
                .AsQueryable();

        }

        public void Insert(Catagory c) 
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Ccategories (CatName,Cost) VALUES (@n,@c)",con);
            cmd.Parameters.AddWithValue("@n",c.CatName);
            cmd.Parameters.AddWithValue("@c",c.Cost);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void Update(Catagory c)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Ccategories SET CatName=@n,Cost=@c WHERE Id=@i", con);
            cmd.Parameters.AddWithValue("@n", c.CatName);
            cmd.Parameters.AddWithValue("@c", c.Cost);
            cmd.Parameters.AddWithValue("@i",c.Id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void Delete(int id)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Ccategories WHERE Id=@i", con);
            cmd.Parameters.AddWithValue("@i",id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}