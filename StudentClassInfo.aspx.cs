using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CollegeManegmentSystem
{
    public partial class StudentClassInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("fuPicture") as FileUpload;
            if (fu.HasFile)
            {
                string fileName = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
                e.Values["Picture"] = fileName;
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fu = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("fuPicture");
            //var fu = GridView1.FindControl("fuPictureUp") as FileUpload;
            if (fu != null)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string f = Guid.NewGuid() + Path.GetExtension(fu.FileName);
                    fu.PostedFile.SaveAs(Server.MapPath("~/Images/") + f);
                    e.NewValues["Picture"] = f;
                }
            }
        }
    }
}