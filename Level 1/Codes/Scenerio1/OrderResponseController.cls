public class OrderResponseController {

    public static OrderResponse parse(String jsonBody){
         OrderResponse order=(OrderResponse)JSON.deserialize(jsonBody,
                                                            OrderResponse.class);
         return order;
    }

    public static void runDemo(){
        String payload='{'
            + '"orderId":"ORD-2024-881",'
            + '"status":"CONFIRMED",'
            + '"customer":{"name":"Acme Corp","accountNumber":"ACC-78901","tier":"Gold"},'
            + '"lineItems":['
            +   '{"productCode":"SAAS-ENT","description":"Enterprise License","quantity":5,"unitPrice":2000.00},'
            +   '{"productCode":"SUPP-PRE","description":"Premium Support","quantity":1,"unitPrice":5000.00}'
            + '],'
            + '"totalAmount":15000.00,'
            + '"currency":"USD"'
            + '}';
        OrderResponse order = parse(payload);
        System.debug('Order ID - Status - Total Amount =>'+order.orderId +' - '+order.status+'--'+order.totalAmount);
        System.debug('Customername - Acountnumber - tier'+order.customer.name+' - '+order.customer.accountNumber+' - '+order.customer.tier);
        for(LineItem li : order.lineitems){
            System.debug('Product | Qty | Unit price | Line Total '+li.productCode+' - '+li.quantity+' - '+li.unitPrice+' - '+li.getLineTotal());
            
        }

    }
}