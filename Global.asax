<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application start
    }
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
       // this code block loads the XML references from the customer API and pushes them through an XSL formatting
        
        //set up credentials
        System.Xml.XmlUrlResolver resolver = new System.Xml.XmlUrlResolver();
        resolver.Credentials = new System.Net.NetworkCredential("dan@arkydiy.com", "litmus12345");
        
        //load XML reference files, one for pages and one for email clients
        System.Xml.XmlDocument pageClients = new System.Xml.XmlDocument();
        pageClients.XmlResolver = resolver;
        pageClients.Load("https://arkydiy.litmus.com/pages/clients.xml");
        System.Xml.XmlDocument emailClients = new System.Xml.XmlDocument();
        emailClients.XmlResolver = resolver;
        emailClients.Load("https://arkydiy.litmus.com/emails/clients.xml");
        
        
        //apply XSL formattings, save them as XML for the gridview
        System.Xml.Xsl.XslCompiledTransform pagesXslTrans = new System.Xml.Xsl.XslCompiledTransform();
        pagesXslTrans.Load(Server.MapPath("~/App_Data/clients.xsl"));
        System.Xml.XmlTextWriter pagesTransform = new System.Xml.XmlTextWriter(Server.MapPath("~/App_Data/clients_transform.xml"), null);
        pagesXslTrans.Transform(pageClients, null, pagesTransform);
        pagesTransform.Close();
        
        System.Xml.Xsl.XslCompiledTransform emailsXslTrans = new System.Xml.Xsl.XslCompiledTransform();
        emailsXslTrans.Load(Server.MapPath("~/App_Data/emails.xsl"));
        System.Xml.XmlTextWriter emailsTransform = new System.Xml.XmlTextWriter(Server.MapPath("~/App_Data/emails_transform.xml"), null);
        emailsXslTrans.Transform(emailClients, null, emailsTransform);
        emailsTransform.Close();

    }
    
    
    

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
