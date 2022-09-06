using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CollegeManegmentSystem.DAL
{
    public class Connection
    {
        public static string GetConnectionString() 
        {
            string conStr = "Data Source=DESKTOP-0CD6RRS;Initial Catalog=BABU;Integrated Security=True";
            return conStr;
        }
    }
}