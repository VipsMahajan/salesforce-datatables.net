public with sharing class AccountController {
	
	public string json {get; private set;}
	
	public AccountController() {
		this.json = '{ "aaData": [ ';
		this.json += '["Trident","Internet Explorer 4.0","Win 95+","4","X"],';
		this.json += '["Trident","Internet Explorer 5.0","Win 95+","5","C"]';
		this.json += ' ] ';
		this.json += '}';
	}
	
	public List<Account> getAccounts(){
		return [SELECT Id, Name, Owner.Name, Description, CreatedDate, Type FROM Account LIMIT 5000];
	}

}