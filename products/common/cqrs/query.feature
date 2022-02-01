Feature: CQRS queries

    Background:
        Given query handler is auto wired

    Scenario: Can ask query
        When query is asked
        Then query is answered

    Scenario: Cannot auto wire second query handler of same query type
        When second query handler is auto wired
        Then query exception is raised

    Scenario: Can use query aspect
        Given query aspect is autowired
        When query is asked
        Then query is answered
        And query aspect is executed

    Scenario: Can use generic query aspect
        Given generic query aspect is autowired
        When query is asked
        Then query is answered
        And query aspect is executed

    Scenario: Can use multiple query aspects
        Given generic query aspect is autowired
        And query aspect is autowired
        When query is asked
        Then query is answered
        And query aspect is executed twice

    Scenario: Query aspect can stop pipeline
        Given generic query aspect is autowired
        And query aspect next is not executed
        When query is asked
        Then query is not answered
    
    Scenario: Can activate query aspect with attribute
        Given attributed query handler is auto wired
        When query is asked
        Then query is answered
        And query attribute aspect is executed
        