public class pr {
    public account a =new account();
    public contact c=new contact();
    public opportunity o= new opportunity();
     
    public account geta(){
        return a;
    }
    public contact getc(){
        return c;
    }
    public opportunity geto(){
        return o;
    }
    
     public PageReference pa1(){
        return page.pag1;
    }
    public PageReference pa2(){
        return page.pag2;
    }
    public PageReference pa3(){
        return page.pag3;
    }
    public PageReference pa4(){
        return page.pag4;
    }

}