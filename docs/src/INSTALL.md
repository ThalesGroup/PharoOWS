# Install

PharoOWS can be installed using [Metacello](https://github.com/Metacello/metacello):

```` c++
Metacello new
  baseline: 'OWS';
  repository: 'github://ThalesGroup/PharoOWS:main';
  load.
````

Dependencies are:

* [XMLParser](https://github.com/pharo-contributions/XML-XMLParser)
* [NeoJSON](https://github.com/svenvc/NeoJSON)
