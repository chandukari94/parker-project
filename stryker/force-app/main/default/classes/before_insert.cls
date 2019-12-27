public class before_insert {
    public static void data(List<Account>accounts){
        for(Account a:accounts){
            a.rating='hot';
            a.Industry='Banking';
            
        }
    }
}