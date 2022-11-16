var results = []
var features > *.bpmn.tests files

foreach var feature in features
  var test = testFactory.create(feature)    
  results.add(test.execute())

export(results) //Zodat het gebruikt kan worden in de living documentation pipeline].

foreach var result in results
  assert(result);