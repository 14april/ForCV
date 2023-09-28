using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EStoreWeb.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string Fullname { get; set; }
        public DateTime Birthday { get; set; }
    }
}
