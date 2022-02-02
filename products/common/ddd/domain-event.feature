Feature: DDD domain events

    Scenario: Can publish domain events
        When domain event publisher application has started
        Then domain events are published