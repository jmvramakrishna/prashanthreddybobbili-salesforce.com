public class ex5 {
    public account acc{set;get;}
    public void create() 
    {
     acc= new account();
        acc.name='prashanth';
        acc.phone='966644724';
        acc.industry='it';
    }
    public void reset()
    {
        acc= new account();
    }
}