# PharoOWS

[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![Unit tests](https://github.com/OpenSmock/PharoOWS/actions/workflows/test.yml/badge.svg)](https://github.com/OpenSmock/PharoOWS/actions/workflows/test.yml)

OGC Web Services support for Pharo.

## Getting Started

### Installing PharoOWS

Pharo 11 :

```smalltalk
Metacello new
   baseline: 'PharoOWS';
   repository: 'github://OpenSmock/PharoOWS:main';
   load.
```

### Dependencies

PharoOWS loads these others projects :
  - [XMLParser](https://github.com/pharo-contributions/XML-XMLParser)
