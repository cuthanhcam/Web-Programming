using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Lab01.WebDemo.Models
{
    public partial class DataClasses1DataContext
    {
        public DataClasses1DataContext() : base(ConfigurationManager.ConnectionStrings["TintucConnectionString"].ConnectionString, mappingSource)
        {
            OnCreated();
        }
    }
}