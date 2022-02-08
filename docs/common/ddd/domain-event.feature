@Docker
Feature: DDD domain events

    Scenario: Publish domain events
        Given database
        And events in database
        When domain event publisher application has executed
        Then domain events are published once

    Scenario: Domain events are not published more than once
        Given database
        And events in database
        When domain event publisher application has executed twice
        Then domain events are published once