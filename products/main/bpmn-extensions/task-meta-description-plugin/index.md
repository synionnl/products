# Task meta description plugin

## Product

This plugin extends the bpmn specication so that every task can be described in meta format. The meta format can be used for automatic task handler generation.

This plugin consist of two parts:

1. A moddle specification of the bpmn schema extension;
1. A plugin which adds a new Meta tab to the properties panal

## MVP

The MVP only needs implement the following specifications:

1. input
1. output

Input and output are described by property elemenents. The MVP property elemenent needs to support:

1. name (string): name of the element, must match pattern ...
1. type (string): 
    * string
    * number
    * integer
    * boolean
1. enum (string): comma seperated values wich match type.
1. format (string): 
    * string:
        * date
        * date-time
    * number: 
        * float
        * double
    * integer: 
        * int32
        * int64
1. nullable (boolean): indicating if the value can be null

### Xml specification

The xml specification follows openapi specification best practices.

```xml
<meta:description>
    <meta:input>
        <meta:property name="A" type="string" />
        <meta:property name="A1" type="string" format="date" />
        <meta:property name="A2" type="string" format="date-time" />
        <meta:property name="A3" type="string" format="uuid" />
        <meta:property name="A4" type="string" format="uri" />
        <meta:property name="B" type="number" />
        <meta:property name="B1" type="number" format="float" />
        <meta:property name="B2" type="number" format="double" />
        <meta:property name="C" type="integer" />
        <meta:property name="C1" type="integer" format="int32" />
        <meta:property name="C2" type="integer" format="int64" />
        <meta:property name="D" type="boolean" />
    </meta:input>
    <meta:output />
</meta:description>
```

### Json data

```json
{
    "A": "example",
    "A1": "2012-04-23",
    "A2": "2012-04-23T18:25:43.511Z",
    "A3": "2853908c-7493-4a79-a7e1-ed585be487dd",
    "A4": "https://example.com",
    "B": 1.5,
    "B1": 1.5,
    "B2": 1.5,
    "C": 1,
    "C1": 1,
    "C2": 1,
    "D": true
}
```

## Full blown

The full blown version needs to implement the following specifications:

1. max jobs active (integer): number of paralel workers
1. timeout (integer): in miliseconds
1. poll interval (integer): in miliseconds
1. polling timeout (integer): in miliseconds
1. retry timeout (integer): in miliseconds

The full blown property element needs to support:

1. array
1. object


### Xml specification

```xml
<meta:description>
    <meta:handler maxJobActive="1" timeout="2000" pollInterval="1000" pollingTimeout="1500" retryTimeout="5000" />
    <meta:input>
        <meta:property name="A" type="string" />
        <meta:property name="B" type="number" />
        <meta:property name="C" type="integer" />
        <meta:property name="D" type="boolean" />
        <meta:property name="E" type="array">
            <meta:items type="string" />
        </meta:property>
        <meta:property name="F" type="object">
            <meta:property name="A" type="string" />
            <meta:property name="B" type="number" />
            <meta:property name="C" type="integer" />
            <meta:property name="D" type="boolean" />
            <meta:property name="E" type="array">
                <meta:items type="string" />
            </meta:property>
        </meta:property>
        <meta:property name="G" type="array">
            <meta:items type="object">
                <meta:property name="A" type="string" />
                <meta:property name="B" type="number" />
                <meta:property name="C" type="integer" />
                <meta:property name="D" type="boolean" />
                <meta:property name="E" type="array">
                    <meta:items type="string" />
                </meta:property>
            </meta:items>
        </meta:property>
    </meta:input>
</meta:description>
```

### Json data

```json
{
    "A": "example",
    "B": 1.5,
    "C": 1,
    "D": true,
    "E": [ "A", "B", "C" ],
    "F": [{
        "A": "example",
        "B": 1.5,
        "C": 1,
        "D": true,
        "E": [ "A", "B", "C" ]
    }],
    "G": {
        "A": "example",
        "B": 1.5,
        "C": 1,
        "D": true,
        "E": [ "A", "B", "C" ]
    }
}
```