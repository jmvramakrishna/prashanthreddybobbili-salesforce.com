public class apex {
    public account acc{set; get;}
    
    public void create()
    {
         acc=new account();
            acc.name='prashansdd';
        acc.phone='99997';
        acc.industry='it';
        
    }
    public void reset()
    {
         acc=new account();
    }
    

}