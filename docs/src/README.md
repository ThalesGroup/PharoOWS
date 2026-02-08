## Welcome to PharoOWS documentation.

A variety of protocols and standards exist to enable communication with map
servers and access geographic data in both raster and vector formats. Defined
by the [Open Geospatial Consortium (OGC)](https://www.ogc.org/), these
protocols are fondamental to ensure interoperability between clients and
servers.

**PharoOWS** supports the official OGC protocols along with some widely adopted de
facto standards, offering tools for querying map servers and parsing the
returned data.


## Overview of supported protocols and standards

**PharoOWS** is split into several packages according to the supported protocols
and standards:

| Package 	| Type 	                | Supported Protocols |	Status         |
|---------------|-----------------------|---------------------|----------------|
| OWS-TMS 	| De facto standard     | TMS 	              | In development |
| OWS-Service 	| Official OGC 	        | WMS, WMTS 	      | In development |
| OWS-API 	| Official OGC (modern) | OGC API - Processes |	In development |


📢 **PharoOWS** is still in development, so new protocols and standards will be added over time.


## Map servers

Numerous map servers exist within the open-source GIS ecosystem, each
implementing OGC protocols with varying levels of completeness, and each
offering its own strengths and limitations. The most well-known are
[MapServer](https://mapserver.org/), [GeoServer](https://geoserver.org/) and
[QGIS Server](https://docs.qgis.org/3.40/en/docs/server_manual/index.html).

For this documentation, the PharoOWS examples rely on publicly available Open
Source map and tile server instances. Keep in mind, though, that these map
servers are easy to self-host, whether locally using [Docker
Compose](https://docs.docker.com/compose/) or on a cloud infrastructure when
more robust, scalable deployment is required.
