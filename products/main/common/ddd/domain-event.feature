@Database
@DomainEvent
Feature: DDD domain events (a39ec768af5b99070a7448921a203537)

    Scenario: Publish domain events
        Given events in database
        When domain event publisher application has executed
        Then domain events are published once

    Scenario: Domain events are not published more than once
        Given events in database
        When domain event publisher application has executed twice
        Then domain events are published once