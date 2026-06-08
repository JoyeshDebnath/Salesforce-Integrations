public class AccountSerialiser {
    public class AccountPayload{
        public String salesforceId;
        public String name;
        public String industry;
        public Decimal annualRevenue;
        public String billingCity;
        public String billingCountry;
        public String phone;
    }
    public static void serialiseAndLog(){
        List<Account> accList=[SELECT Id,Name,Industry,BillingCity,BillingCountry,Phone,AnnualRevenue FROM Account LIMIT 10];
        List<AccountPayload> payloads=new List<AccountPayload>();
        for(Account acc:accList){
            AccountPayload p=new AccountPayload();
            p.salesforceId=acc.Id;
            p.name=acc.Name;
            p.industry=acc.Industry;
            p.annualRevenue=acc.AnnualRevenue;
            p.billingCity=acc.BillingCity;
            p.billingCountry=acc.BillingCountry;
            p.phone=acc.Phone;
            payloads.add(p);
        }
    }
    String jsonOutput = JSON.serialize(payloads);
    System.debug('Serialised accounts' + jsonOutput);
    
}