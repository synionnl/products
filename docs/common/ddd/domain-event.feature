Feature: DDD domain events

    Scenario: Can publish domain events
        When domain event publisher application has executed
        Then domain events are published