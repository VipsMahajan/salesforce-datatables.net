public with sharing class AccountsController {
	
	public ApexPages.StandardSetController ssc {get; set;}
	public string listView {get; set;}
	
	public AccountsController(){
		this.ssc = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name, Owner.Name, Type, CreatedDate FROM Account]));
		this.listView = this.ssc.getFilterId();
		this.ssc.setFilterId('00Bd0000004qhnWEAQ');
		this.ssc.setFilterId('00Bd0000003nkB7');
	}
	
	public List<SelectOption> getListViews(){
		return this.ssc.getListViewOptions();
	}
	
	public List<Account> getAccounts(){
		this.ssc.setPageSize(2000);
		this.ssc.setFilterId(this.listView);
		this.ssc.setPageNumber(1);
		return (List<Account>) this.ssc.getRecords();
	}
	
	public void doNothing(){
	}
	public string getWhatIsIt(){
		return this.ssc.getFilterId();
	}
}