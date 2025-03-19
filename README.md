# PharoOWS

OGC Web Services support for Pharo.

## Getting Started

### Installing PharoWMS

Pharo 11 :

```smalltalk
Metacello new
   baseline: 'PharoOWS';
   repository: 'github://OpenSmock/PharoOWS:main';
   load.
```

### Dependencies

PharoWMS loads these others projects :
  - [XMLParser](https://github.com/pharo-contributions/XML-XMLParser)
