@Event
Feature: CQRS events

    Scenario: Can notify event
        Given event handler is auto wired
        When event is notified
        Then notification is recieved

    Scenario: Can auto wire second event handler of same event type
        Given event handler is auto wired
        When second event handler is auto wired
        When event is notified
        Then notification is recieved twice

    Scenario: Can use event aspect
        Given event handler is auto wired
        And event aspect is autowired
        When event is notified
        Then notification is recieved
        And event aspect is executed

    Scenario: Can use generic event aspect
        Given event handler is auto wired
        And generic event aspect is autowired
        When event is notified
        Then notification is recieved
        And event aspect is executed

    Scenario: Can use multiple event aspects
        Given event handler is auto wired
        And generic event aspect is autowired
        And event aspect is autowired
        When event is notified
        Then notification is recieved
        And event aspect is executed twice

    Scenario: Event aspect can stop pipeline
        Given event handler is auto wired
        And generic event aspect is autowired
        And event aspect next is not executed
        When event is notified
        Then notification is not recieved
    
    Scenario: Can activate event aspect with attribute
        Given attributed event handler is auto wired
        When event is notified
        Then notification is recieved
        And event attribute aspect is executed    
    
    Scenario: Can add logging to event handler
        Given event handler with log attribute is auto wired
        When event is notified
        Then event is logged