public class product {
    	public List<String> names {set;get;}
	public List<Account> accs {set;get;}
	public List<ProdWrap> products {set;get;}
	public List<ProdWrap> selected {set;get;}
	public product(){
		names=new List<String>{'sam','Ram','Kiran'};
		accs=new List<Account>();
		products=new List<ProdWrap>();
		Account a1=new Account(Name='Wipro',Industry='Technology');
		Account a2=new Account(Name='Satyam',Industry='Energy');
		accs.add(a1);
		accs.add(a2);
		for(Integer i=0;i<4;i++){
			ProdWrap pw=new Prodwrap();
			products.add(pw);
		}
	}
	public void getValues(){
		selected=new List<ProdWrap>();
		for(ProdWrap ps:products){
			if(ps.flag==true){
				selected.add(ps);
			}
		}
	}
	public class prodWrap{
		public String name {set;get;}
		public Decimal price {set;get;}
		public Decimal quant {set;get;}
		public Boolean flag {Set;get;}
		public ProdWrap(){
			flag=false;
		}
	}


}