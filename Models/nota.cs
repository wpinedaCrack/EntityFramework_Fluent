using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DatabaseFirst.Models
{
    public partial class nota
    {
        [Key]
        public int idnota { get; set; }
        [StringLength(50)]
        public string titulo { get; set; } = null!;
        [StringLength(200)]
        public string? descripcion { get; set; }
        [Column(TypeName = "date")]
        public DateTime fecha { get; set; }
        public int? usuario_id { get; set; }
    }
}
