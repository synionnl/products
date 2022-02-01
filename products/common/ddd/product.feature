Feature: DDD

    Scenario: Can get an event sourced aggregate root
        When executing get aggregate root query for event sourced aggregate root
        Then should have recieved event sourced aggregate root

    Scenario: Can get a state sourced aggregate root

    Scenario: Can save an event sourced aggregate root

    Scenario: Can save a state sourced aggregate root