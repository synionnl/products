Feature: DDD aggregate root store

    Scenario: Can get an event sourced aggregate root
        When executing get aggregate root query for event sourced aggregate root
        Then should have recieved event sourced aggregate root

    Scenario: Can get an event sourced aggregate root interface
        When executing get aggregate root query for event sourced aggregate root interface
        Then should have recieved event sourced aggregate root interface

    Scenario: Can save an event sourced aggregate root
        When saving an event sourced aggregate root
        Then event sourced aggregate is saved

    Scenario: Can save an event sourced aggregate root interface
        When saving an event sourced aggregate root interface
        Then event sourced aggregate interface is saved

    Scenario: Can get a state sourced aggregate root

    Scenario: Can get a state sourced aggregate root interface

    Scenario: Can save a state sourced aggregate root

    Scenario: Can save a state sourced aggregate root interface