public class futuremethod {
    public void callme(){
        system.debug('line one');
        system.debug('line two');
        system.debug('line three');
        get();
    }
    @future
    public static void get(){
        system.debug(' one');
        system.debug('two');
    }

}