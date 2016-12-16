<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Weekly Jobs</fullName>
        <active>false</active>
        <criteriaItems>
            <field>TimeTrigger__c.Frequency__c</field>
            <operation>equals</operation>
            <value>Weekly</value>
        </criteriaItems>
        <criteriaItems>
            <field>TimeTrigger__c.Run__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>TimeTrigger__c.NextTrigger__c</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
