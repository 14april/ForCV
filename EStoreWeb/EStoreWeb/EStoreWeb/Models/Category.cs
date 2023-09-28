using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace EStoreWeb.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage ="Vui long nhap dung du lieu ten the loai")]
        public string CategoryName { get; set; }
        [Range(1,100, ErrorMessage ="Vui long nhap so tu 1 -100")]
        public int DisplayOrder { get; set; }
    }
}
