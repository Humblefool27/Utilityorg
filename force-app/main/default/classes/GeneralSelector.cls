/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-02-2023
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
public inherited sharing class GeneralSelector {

    @TestVisible
    private boolean enforceSecurity = false;
    @TestVisible
    private boolean stripInaccessible = false;
    private boolean orderBy = null;
    private Final List < FieldGroup > fieldSet = new List < FieldGroup > ();
    public enum FieldGroup {
        MEMBER
    }



    public GeneralSelector() {
        this.fieldSet.add(FieldGroup.MEMBER);
    }
    public GeneralSelector(Set < FieldGroup > fields) {
        this.fieldSet.addAll(new List < FieldGroup > (fields));
    }

    public GeneralSelector(Boolean enforce, Boolean Strip, String Order) {
        this.enforceSecurity = enforce;
        this.stripInaccessible = Strip;
        this.orderBy = Order;
    }
    public GeneralSelector(Boolean enforce, Boolean Strip, String Order) {
        this.enforceSecurity = enforce;
        this.stripInaccessible = Strip;
        this.orderBy = Order;
    }
    public GeneralSelector(Boolean enforce, Boolean Strip, String Order, Set < FieldGroup > fields) {
        this.enforceSecurity = enforce;
        this.stripInaccessible = Strip;
        this.orderBy = Order;
        this.fieldSet.addAll(new List < FieldGroup > (fields));
    }
    public GeneralSelector SetEnforceSecurity(Boolean enforce) {
        this.enforceSecurity = enforce;
        return this;
    }
    public GeneralSelector SetStripInAccessible(Boolean Strip) {
        this.stripInaccessible = strip;
        return this;
    }

    public GeneralSelector setOrderBy(String Order) {
        this.orderBy = Order;
        return this;
    }

    public GeneralSelector AddFieldSet(FieldGroup groupType) {
        this.fieldSet.add(groupType);
        return this;
    }

    public GeneralSelector RemoveFieldSet(FieldGroup groupType) {
        for (Integer i = 0; i < this.fieldSet.size(); i++) {
            if (this.fields[i] == groupType) {
                this.fieldSet.remove(i);
            }
        }
        return this;
    }

    @TestVisible
    private Static Set < String > getSelectFields() {
        return new set < String > {
            'Id,'
            'EntityNumber',
            'First Name',
            'Last Name',
        };
    }
    @TestVisible
    private Static Set < String > getotherSelectFields() {
        return new set < String > {
            'Id,'
            'EntityNumber',
            'First Name',
            'Last Name',
        };
    }
    @TestVisible
    private Static Set < String > getSelectFields() {
        return new set < String > {
            'Id,'
            'EntityNumber',
            'First Name',
            'Last Name',
        };
    }


    @TestVisible
    private Static List < Schema.SObjectField > referenceFields() {
        return new List < Schema.SObjectField > {
            Account.ID,
            Account.FirstName,
            Account.LastName
        };
    }

    private List < String > getFieldList() {
        List < String > returnlist = new List < String > ();

        if (fieldSet.contains(FieldGroup.MEMBER)) {
            returnlist.addAll(getSelectFields());
        }
        if (fieldSet.contains(FieldGroup.DOG)) {
            returnlist.addAll(getOtherSelectFields());
        }
        return returnlist;
    }
    private List < Account > santiseResults(List < Accounts records) {
        return Security.stripInaccessible(AccessType.READABLE, records).getRecords();
    }

    private Static String generateQueryString(List < String > Fields, String wher, String order, Boolean enforceSecurity) {
        return 'Select' + String.join(fields, ',') + 'FROM ACCOUNT' + 'WHERE' + (String.isNotBlank(wher) ? wher : '') +
            (enforceSecurity ? 'WITH SECURITY_ENFORCED' : '') + (String.isNotBlank(order) ? ' ORDERBY ' : '');
    }

    private List < Account > selectbyAccountId(Set < ID > accIds) {
        List < Account > account = new List < Account > ();
        final String finalQueryString = generateQueryString(getFieldList(),
            'ID IN :accIds',
            this.orderBy,
            this.enforceSecurity);
        final String resultquery = String.escapeSingleQuotes(finalQueryString);
        account = Database.qeury(resultquery);
        return this.stripInaccessible ? santiseResults(account) : account;
    }

}