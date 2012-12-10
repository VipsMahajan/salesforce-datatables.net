public with sharing class AccountController {
	
	public string view {get; set;}
	
	public AccountController() {
		this.view ='My Accounts';
	}
	
	public List<Account> getAccounts(){
		if (this.view == 'My Accounts'){
			return [SELECT Id, Name, Owner.Name, CreatedDate, Type FROM Account ORDER BY Name ASC LIMIT 200];
		} else{
			return [SELECT Id, Name, Owner.Name, CreatedDate, Type FROM Account ORDER BY Name DESC LIMIT 200];
		}
	}
	
    public List<SelectOption> getViews() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('My Accounts','My Accounts'));
        options.add(new SelectOption('All Accounts','All Accounts'));
        return options;
    }
    
    public void doNothing(){
    }
}