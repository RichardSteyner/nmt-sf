public class FieldCreator {


  public Static void createCurrencyField(String objectapiname,String fieldapiname,String fieldlabel,String fielddescription) {
    HttpRequest requestinside = new HttpRequest(); 
                requestinside.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
                requestinside.setHeader('Content-Type', 'application/json');
                requestinside.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v41.0/tooling/sobjects/CustomField/');
                requestinside.setMethod('POST');
                String fieldDef = '{"Metadata" : ';
                String metadef = '"type" : "Currency","description" : "'+fielddescription+'", "inlineHelpText" : "","precision" : null,"label" : "'+fieldlabel+'","precision" : 18,"scale" : 2,"required" : false';
                      fieldDef += '{'+metadef+'},';
                      fieldDef += '"FullName" : "'+objectapiname+'.'+fieldapiname+'"}';
                system.debug(fieldDef);
                requestinside.setBody(fieldDef);
                Http http = new Http();
                HTTPResponse res = http.send(requestinside);
                System.debug(res.getBody());
  }

  public Static void createNumberField(String objectapiname,String fieldapiname,String fieldlabel,String fielddescription) {
    HttpRequest requestinside = new HttpRequest(); 
                requestinside.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
                requestinside.setHeader('Content-Type', 'application/json');
                requestinside.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v41.0/tooling/sobjects/CustomField/');
                requestinside.setMethod('POST');
                String fieldDef = '{"Metadata" : ';
                String metadef = '"type" : "double", "inlineHelpText" : "","precision" : null,"label" : "'+fieldlabel+'","precision" : 18,"scale" : 2,"required" : false';
                      fieldDef += '{'+metadef+'},';
                      fieldDef += '"FullName" : "'+objectapiname+'.'+fieldapiname+'"}';
                system.debug(fieldDef);
                requestinside.setBody(fieldDef);
                Http http = new Http();
                HTTPResponse res = http.send(requestinside);
                System.debug(res.getBody());
  }

/*
//09:18:42:040 USER_DEBUG [31]|DEBUG|
//{"Metadata" : { "type" : "double",
                  "description" : "", 
                  "inlineHelpText" : "",
                  "precision" : null,
                  "label" : "Current CPI",
                  "precision" : 18,
                  "scale" : 2,
                  "required" : false
                },"FullName" : "NMT_Project__c.Current_CPI__c"}
*/

}