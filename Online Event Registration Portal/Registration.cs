using System;

namespace EventRegistrationPortal
{
    [Serializable]
    public class Registration
    {
        public string RegistrationId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public int Age { get; set; }
        public string Gender { get; set; }
        public string EventName { get; set; }
        public string TicketType { get; set; }
        public int Tickets { get; set; }
        public string Interests { get; set; }
        public string Address { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime RegisteredOn { get; set; }
    }
}