using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml.XPath;
using System.Xml.Xsl;
using System.Xml;
using System.Net;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Binds Data to the gridview displayed on emails.aspx
        //the XML resource is generated from the customer API under the session_start class in global.asax

        using (DataSet ds = new DataSet())
        {
            ds.ReadXml(Server.MapPath("~/App_Data/emails_transform.xml"));
            GridViewEmails.DataSource = ds;
            GridViewEmails.DataBind();
        }

    }
}