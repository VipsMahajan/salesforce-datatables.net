public with sharing class ContactsController {
	
	public ApexPages.StandardSetController ssc {get; set;}
	public string listView {get; set;}
	
	public ContactsController(){
		this.ssc = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id, Name FROM Contact]));
	}
	
	public List<SelectOption> getListViews(){
		return this.ssc.getListViewOptions();
	}
	
	public List<Contact> getContacts(){
		ssc.setPageSize(2000);
		ssc.setFilterId(this.listView);
		ssc.setPageNumber(1);
		return (List<Contact>) this.ssc.getRecords();
	}
	
	public void doNothing(){
	}
}