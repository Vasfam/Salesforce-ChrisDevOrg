<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Account_Type_to_Customer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Set Account Type to Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Account_Type_to_Pending</fullName>
        <field>Type</field>
        <literalValue>Pending</literalValue>
        <name>Set Account Type to Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Account_Type_to_Prospect</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>Set Account Type to Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Texas_owner</fullName>
        <field>OwnerId</field>
        <lookupValue>sfdev@vasfam.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Texas owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Texas accounts</fullName>
        <actions>
            <name>Texas_owner</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.BillingState</field>
            <operation>equals</operation>
            <value>TX</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Follow_up_with_new_account</name>
                <type>Task</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <tasks>
        <fullName>Follow_up_with_new_account</fullName>
        <assignedTo>sfdev@vasfam.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Follow up with new account</subject>
    </tasks>
</Workflow>
