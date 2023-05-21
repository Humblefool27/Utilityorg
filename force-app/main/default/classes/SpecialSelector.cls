/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-21-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class SpecialSelector {

    @TestVisible
    private Boolean enforceSecurity = false;
    @TestVisible
    private Boolean stripInaccessible = false;

    public SpecialSelector() {

    }
    public SpecialSelector(Boolean enforce , boolean Strip) {
        this.enforceSecurity = enforce;
        this.stripInaccessible = Strip;

    }
    public SpecialSelector SetEnforceSecurity(Boolean enforce) {
        this.enforceSecurity = enforce;
        return this;
    }
    public SpecialSelector SetStripInAccessible(Boolean Strip) {
        this.stripInaccessible = Strip;
        return this;
    }
   
    private List < Account > santiseResults(List < Accounts records) {
        return Security.stripInaccessible(AccessType.READABLE, records).getRecords();
    }
    private static String generateQueryString( Boolean enforceSecurity ,String forename, String lastNAme,String Phone){
        String[] filter = new String[0];
        if(forename!=null){
            fileter.add('forename__c' LIKE :forename);
        }
        if(lastNAme!=null){
            fileter.add('lastNAme__c' LIKE :lastNAme);
        }
        if(Phone!=null){
            fileter.add('Phone__c' LIKE :Phone);
        }
        String qeury = 'SELECT forname__c,surname__C,Phone__c FROM Specialist';
        if(filter.size()>0){
            qeury+='WHERE'+String.join(filter,'AND');
        }
        qeury+= (enforceSecurity)?'WITH SECURITY_ENFORCED':'';
        return query;
    }

    public List<SPeciaist> selectHospital(Boolean enforceSecurity,Set<String> specialistID){
        String query = 'SELECT forname__c,surname__C,Phone__c FROM Specialist';
        String wher='';
        if(specialistID.size()!= 0){
            wherecause = (specialistID.size()!= 0)?'WHERE specialistId IN :specialistID':''
        }
        qeury+= (enforceSecurity)?'WITH SECURITY_ENFORCED':'';
        return query;

    }
    public List<specailist> selectspecialistvals(specailistFIlters value){
        List<specailist_c> specailist =new List<specailist_c>();
        final String forname__c=(!String.isBlank(vale.forename))?'%'+String.escapeSingleQuotes(value.forename)+'%':null;
        String runQuery = generateQueryString(this.enforceSecurity,forname,surname,Phone);
        runQuery+= 'Limit:queryLimit';
        final Integer queryLimit=100;
        specailist = Database.qeury(runQuery);
        return this.stripInaccessible ? santiseResults(specailist):specailist;

    }
    public List<Hospital> selectspecialistvals(Set<String> specialistID){
        List<Hospital> Hospital =new List<Hospital>();
        String runQuery = selectHospital(this.enforceSecurityspecialistID);
        runQuery+= 'Limit:queryLimit';
        final Integer queryLimit=Limits.getLimitQueryRows();
        Hospital = Database.qeury(runQuery);
        return this.stripInaccessible ? santiseResults(Hospital):Hospital;
    }

    public List<specialitNetworks__c> slectspecialistNetorks(Set<String> specialistID){
        List<HosspecialitNetworks__cpital> specialitNetworks__c =new List<specialitNetworks__c>();
        final Integer queryLimit=Limits.getLimitQueryRows();
        specialitNetworks__c =[SELECT networkName__c, specailist_Id FROM specialitNetworks__c WHERE specialistID IN :specialistID 
        WITH SECURITY_ENFORCED Limit:queryLimit ];
        return this.stripInaccessible ? santiseResults(specialitNetworks__c):specialitNetworks__c;
    }
    


}