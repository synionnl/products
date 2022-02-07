Feature: DDD aggregate root store

    Scenario: Can get an event sourced aggregate root
        Given database
        And events in database
        When executing get aggregate root query for event sourced aggregate root
        Then should have recieved event sourced aggregate root

    Scenario: Can get an event sourced aggregate root interface
        Given database
        And events in database
        When executing get aggregate root query for event sourced aggregate root interface
        Then should have recieved event sourced aggregate root interface

    
    Scenario: Can save an event sourced aggregate root
        Given database initialized
        When saving an event sourced aggregate root
        Then event sourced aggregate is saved

    Scenario: Can save an event sourced aggregate root interface
        Given database initialized
        When saving an event sourced aggregate root interface
        Then event sourced aggregate interface is saved

    Scenario: Can get a state sourced aggregate root

    Scenario: Can get a state sourced aggregate root interface

    Scenario: Can save a state sourced aggregate root

    Scenario: Can save a state sourced aggregate root interface