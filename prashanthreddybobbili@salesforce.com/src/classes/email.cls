public class email {
    public void myemail(){
        messaging.singleemailmessage sem=new messaging.SingleEmailMessage();
        string[] toadd =new string[]{'prashanthreddybobbili@gmail.com'};
            string[] toad =new string[]{'prashanthreddybobbali@gmail.com'};
            sem.settoaddresses(toadd);
        sem.setccaddresses(toad);
        sem.setsubject('regarding salesforce');
        sem.setsenderdisplayname('prashanthreddy');
        sem.setplaintextbody('this is email');
        sem.sethtmlbody('<h1>html<h1>');
        messaging.Email[] ee=new messaging.Email[]{sem};
        messaging.sendemail(ee);
    }

}