Feature: Process (950322c5b153f8f57c73e80c82e66d0a})

Scenario Outline: Exclusive gateway tests

  Given process "<process>"
    And process has state "<state>"
   When the gateway with id "<gateway>" is executed
   Then the flow with id "<flow>" must be activated

  Examples: Scenarios
    | process                                           | state                            | gateway                 | flow                    | 
    | blog/bizdevops/living-documentation/process.bpmn  | { AnswerCorrectProbability: 84 } | Gateway_UseBotAnswer    | Flow_UseBotAnswerNo     | 
    | blog/bizdevops/living-documentation/process.bpmn  | { AnswerCorrectProbability: 85 } | Gateway_UseBotAnswer    | Flow_UseBotAnswerYes    | 
    | blog/bizdevops/living-documentation/process.bpmn  | { AnswerCorrectProbability: 94 } | Gateway_ReviewBotAnswer | Flow_ReviewBotAnswerYes | 
    | blog/bizdevops/living-documentation/process.bpmn  | { AnswerCorrectProbability: 95 } | Gateway_ReviewBotAnswer | Flow_ReviewBotAnswerNo  | 