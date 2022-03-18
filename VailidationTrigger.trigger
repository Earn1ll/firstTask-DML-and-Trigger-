trigger VailidationTrigger on Account (before insert,before update) {
    try{
         for (Account t: Trigger.new){
         if(t.Type == 'Prospect') {
                     t.addError ('account cannot be created or updated if field Type = Prospect');
        }
         }
    } catch(Exception e) {
    System.debug('An exception occurred: ' + e.getMessage());
    }
	
}