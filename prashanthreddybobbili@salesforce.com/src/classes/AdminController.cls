/**
* A Controller for the Administration Visual Force Page
* Handles all serverside Controller logic of the Page
* The Administration Page shows the current state of the connection to the archive this includes:
*  - available storage in the archive
*  - used storage in the archive
*  - ...
*/
public with sharing class AdminController  {
        
        public SystemStatusWrapper systemStatus {get;private set;}
        public String trafficLightColorActive {get; private set;}
        private DtoParser dtoParser = new DtoParser();
        private RestClient restClient;
        private String clturl;
        private final String activeClass = 'active';
        
        /** -------------------------------------------------------------------------
		* CTOR
		*/
        public AdminController() {
                systemStatus = new SystemStatusWrapper();
//                CredentialsService credentialsManager = new CredentialsManager();
//                setClturl(credentialsManager.getTechnicalUser().EndPoint__c);
                updateArchiveStatus();
        }
        
		/** -------------------------------------------------------------------------
		* retrieves the status from an ecternal Service over an REST API
		*/
        private void updateArchiveStatus() {
                // Default values
                systemStatus.availableStorage = '0';
                systemStatus.usedStorage = 0.0;
                systemStatus.storageStatus = Label.Disconnected;
                systemStatus.status = MyEnums.ArchiveStatus.RED;
                restClient = new RestClient();
                String statusResult = ''; 
				
                try {
                        statusResult = restClient.getFullStatus();
                } catch (CalloutException e) {
                        apexpages.addmessage(new ApexPages.Message(ApexPages.Severity.Error, 'issue_with_the_remote_server'));
                        return;
//                } catch (Exceptions.HttpException e) {
//                        apexpages.addmessage(new ApexPages.Message(ApexPages.Severity.Error, 'Communication_Error'));
//                        return;
/*                } catch (Exceptions.TechnicalUserNotSetException e) {
                        apexpages.addmessage(new ApexPages.Message(ApexPages.Severity.Error, 'TechnicalUserNotSet'));
                        return;
                } catch (Exceptions.Customer410Exception e) {
                        apexpages.addmessage(new ApexPages.Message(ApexPages.Severity.Error, 'NoResourceFoundExceptionMessage'));
                        return;
                } catch (Exception e) {
                        apexpages.addmessage(new ApexPages.Message(ApexPages.Severity.Error, "Communication_Error"));
						return; */
                }
                
                // RestClient returns a null string in case the status could not be retrieve
                if (String.isNotEmpty(statusResult)) {
//                        MyDto.SystemInformation systemStatusDto = this.dtoParser.parseSystemStatus(statusResult);
                        
/*                        systemStatus.usedStorage = systemStatusDto.status.storageSizeUsed;
                        if (systemStatusDto.status.storageSizeAvailable != null) {
                                systemStatus.availableStorage = String.valueOf(systemStatusDto.status.storageSizeAvailable);
                        } else {
                        systemStatus.availableStorage = Label.NoLimit;
                        }
                        systemStatus.storageStatus = systemStatusDto.status.statusText;
                        systemStatus.status = MyEnums.fromStringArchiveStatus(systemStatusDto.status.state);
*/                }
        }

        /** -------------------------------------------------------------------------
         * Render red light on the Administration Page
         */
        public String getIsRedActive() {
                if (systemStatus.status != null && systemStatus.status == MyEnums.ArchiveStatus.RED) {
                        return activeClass;
                }
                return '';
        }

        /**
         * Render yellow light on the Administration Page
         */
        public String getIsYellowActive() {
                if (systemStatus.status != null && systemStatus.status == MyEnums.ArchiveStatus.YELLOW) {
                        return activeClass;
                }
                return '';
        }

        /**
         * Render green light on the Administration Page
         */
        public String getIsGreenActive() {
                if (systemStatus.status != null && systemStatus.status == MyEnums.ArchiveStatus.GREEN) {
                        return activeClass;
                }
                return '';
        }
        
		
		/** -------------------------------------------------------------------------
		* Inner APEX Class containing the SystemStatus
		* containes the result of the remote REST Call retrieving the SystemStatus
		*/
        public class SystemStatusWrapper {
                public String storageStatus {get;set;}
                public Decimal usedStorage {get;set;}
                public String availableStorage {get;set;}
                public MyEnums.ArchiveStatus status {get; set;}
        }
    
    public class DtoParser {
        public string parseSystemStatus (string statusResult){
            return statusResult;
        }
    }
    public class RestClient {
        public string getFullStatus(){
            return '';
        }
    }
}