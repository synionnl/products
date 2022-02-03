@IntegratieTest
Feature: DDD domain events

    Scenario: Publish domain events
        When domain event publisher application has executed
        Then domain events are published

    Scenario: Domain events are not published more than once
        When domain event publisher application has executed twice
        Then domain events are published once