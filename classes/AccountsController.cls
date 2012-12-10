public with sharing class AccountsController {
	
	public ApexPages.StandardSetController ssc {get; set;}
	public string listView {get; set;}
	
	public AccountsController(ApexPages.StandardSetController ssc){
		this.ssc = ssc;
		//ssc = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name, Owner.Name, Type, CreatedDate FROM Account]));
		//listView = '00Bd0000003nkB7EAI';
		listView = ssc.getFilterId(); //this doesn't seem to be working
		//ssc.setFilterId(listView);
	}
	
	public List<SelectOption> getListViews(){
		return ssc.getListViewOptions();
	}
	
	public List<Account> getAccounts(){
		ssc.setPageSize(2000);
		ssc.setFilterId(listView);
		system.debug('LIST VIEW');
		system.debug(listView);
		system.debug(ssc.getResultSize());
		ssc.setPageNumber(1);
		return (List<Account>) ssc.getRecords();
	}
	
	public void doNothing(){
	}
	public string getWhatIsIt(){
		return ssc.getFilterId();
	}
}