public class OrderResponse{
    public String orderId;
    public String status;
    public Decimal totalAmount;
    public String currency__x;
    public Customer customer;
    List<LineItem> lineitems;

    public class Customer{
        public String name;
        public String accountNumber;
        public String tier;
    }
    public class LineItem{
        public String productCode;
        public String description;
        public Integer quantity;
        public Decimal unitPrice;
    
        public Decimal getLineTotal(){
                return quantity*unitPrice;
        }
    }

    
}