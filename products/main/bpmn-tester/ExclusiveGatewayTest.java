ExclusiveGatewayTest.Execute(GatewayScenario scenario) =>
  var gateway = bpmn.findGateway(scenario.gateway)

  if(gateway == null)
    return new FailTestResult(scenario, "Gateway not found")

  var defaultFlow = gateway.flows
    .singleOrDefault(flow => flow.id == gateway.defaultFlow)

  var activatedFlow = gateway.flows
    .where(flow => 
      flow.id != gateway.defaultFlow && 
      expressionParser.parse(scenario.state, flow.expression) == true
    )
    .singleOrDefault()

  if(activatedFlow?.id != scenario.expectedFlow and defaultFlow?.id != scenario.expectedFlow)
    return new FailTestResult(scenario, "Expected flow is not activated")

  return new PassTestResult(scenario)