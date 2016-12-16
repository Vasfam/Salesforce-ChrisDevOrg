public with sharing class SlackCasePublisher {
     
    private static final String slackURL = 'https://hooks.slack.com/services/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';
     
    public class Slackcase {
        @InvocableVariable(label='Case Subject')
        public String caseSubject;
        @InvocableVariable(label='Case Description')
        public String casedescription;
    }
     
    @InvocableMethod(label='Post to Slack')
    public static void postToSlack(List<Slackcase> cases) {
        Slackcase c = cases[0]; // If bulk, only post first to avoid overloading Slack channel
        Map<String,Object> msg = new Map<String,Object>();
        msg.put('text', 'The following case has assigned to Enterprise Delivery:\nCase Subject: *' + c.caseSubject + '*' + '\nCase Description: *' + c.casedescription + '*');
        msg.put('mrkdwn', true);
        String body = JSON.serialize(msg);    
        System.enqueueJob(new QueueableSlackCall(slackURL, 'POST', body));
    }
     
    public class QueueableSlackCall implements System.Queueable, Database.AllowsCallouts {
         
        private final String url;
        private final String method;
        private final String body;
         
        public QueueableSlackCall(String url, String method, String body) {
            this.url = url;
            this.method = method;
            this.body = body;
        }
         
        public void execute(System.QueueableContext ctx) {
            HttpRequest req = new HttpRequest();
            req.setEndpoint(url);
            req.setMethod(method);
            req.setBody(body);
            Http http = new Http();
            HttpResponse res = http.send(req);
        }
 
    }
    
}