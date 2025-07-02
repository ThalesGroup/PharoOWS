# Geospatial services: OGC Standards and de facto Protocols

Standard communication protocols with map servers can be divided into two main
categories:

* Official protocols defined by the Open Geospatial Consortium (OGC)
* De facto protocols that have emerged due to widespread use (such as XYZ)


## Formal OGC protocols

**Traditional OGC Services**

These services are based on SOAP or HTTP protocols with specific requests often
constructed as URLs with parameters. They primarily exchange XML or other
specialized formats (XML for requests/responses, images for maps). These
standards have been widely used for many years to ensure geospatial
interoperability.

```` console
http://mapserver?SERVICE=WMS&REQUEST=GetMap&LAYERS=layer0,layer1
````

**Modern RESTful Services**

These adopt a RESTful architecture based on modern web principles. They use
simple HTTP methods (GET, POST, etc.) and return responses in JSON. This
approach makes integration with applications easier due to its simplicity and
compatibility with current web technologies. OGC API - Features is a key
example of this new generation, providing standardized REST APIs for accessing
vector data.

```` console
http://mapserver/collections/layer0/items.json
````


## De facto standards

Although not officially standardized by organizations like the OGC, protocols
such as TMS (Tile Map Service) and the XYZ URL scheme are widely adopted in web
mapping. Their simplicity and compatibility with modern web technologies have
made them essential de facto standards for serving map tiles.
