public class scjk implements schedulable {
    public void execute(schedulablecontext sc){
        list<account>ac=[select id from account where createddate=today];
        delete ac;
    }

}