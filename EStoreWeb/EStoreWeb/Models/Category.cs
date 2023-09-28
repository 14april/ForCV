using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EStoreWeb.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage ="Vui lòng nhập tên thể loại")]
        public string Name { get; set; }
        [Range(1,100,ErrorMessage ="Vui lòng nhập số (1 - 100) nhé!")]
        public int DisplayOrder { get; set; }
        public ICollection<Product> Products { get; set; } //Khai báo mối kết hợp n
    }
}
