//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KarnelTravel.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Customer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer()
        {
            this.Trips = new HashSet<Trip>();
        }
    
        public string Customer_Id { get; set; }
        public string Customer_Password { get; set; }
        public string Customer_LastName { get; set; }
        public string Customer_FirstName { get; set; }
        public Nullable<System.DateTime> Customer_Bithday { get; set; }
        public Nullable<bool> Customer_Gender { get; set; }
        public string Customer_Phone { get; set; }
        public string Customer_Address { get; set; }
        public string Customer_Email { get; set; }
        public string Customer_Possport { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Trip> Trips { get; set; }
    }
}
