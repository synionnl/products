@Query
Feature: CQRS queries (17d146c2f008949c10a94af513ea4b71)

    Scenario: Can ask query
        Given query handler is auto wired
        When query is asked
        Then query is answered

    Scenario: Cannot auto wire second query handler of same query type
        Given query handler is auto wired
        When second query handler is auto wired
        Then multiple query handlers exception is raised

    Scenario: Can use query aspect
        Given query handler is auto wired
        And query aspect is autowired
        When query is asked
        Then query is answered
        And query aspect is executed

    Scenario: Can use generic query aspect        
        Given query handler is auto wired
        And generic query aspect is autowired
        When query is asked
        Then query is answered
        And query aspect is executed

    Scenario: Can use multiple query aspects
        Given query handler is auto wired
        And generic query aspect is autowired
        And query aspect is autowired
        When query is asked
        Then query is answered
        And query aspect is executed twice

    Scenario: Query aspect can stop pipeline
        Given query handler is auto wired
        And generic query aspect is autowired
        And query aspect next is not executed
        When query is asked
        Then query is not answered
    
    Scenario: Can activate query aspect with attribute
        Given attributed query handler is auto wired
        When query is asked
        Then query is answered
        And query attribute aspect is executed

    Scenario: Default query resonse throws exception with response not default attribute attribute
        Given query handler with response not default attribute is auto wired
        When query is asked
        Then query response is default response exception is raised    
    
    Scenario: Can add logging to query handler
        Given query handler with log attribute is auto wired
        When query is asked
        Then query is logged
        