using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Lab01.WebDemo.Models
{
    public partial class NewsDataContext
    {
        public NewsDataContext() : base(ConfigurationManager.ConnectionStrings["TintucConnectionString"].ConnectionString, mappingSource)
        {
            OnCreated();
        }
    }
}