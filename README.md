# PharoOWS

[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/ThalesGroup/PharoOWS.svg)](./LICENSE)
[![Unit tests](https://github.com/ThalesGroup/PharoOWS/actions/workflows/CI.yml/badge.svg)](https://github.com/ThalesGroup/PharoOWS/actions/workflows/CI.yml)

## :information_source: Get started

A variety of protocols and standards exist to enable communication with map
servers and access geographic data in both raster and vector formats. Defined
by the [Open Geospatial Consortium (OGC)](https://www.ogc.org/), these
protocols are fondamental to ensure interoperability between clients and
servers.

PharoOWS supports the official OGC protocols along with some widely adopted de
facto standards, offering tools for querying map servers and parsing the
returned data.


## :wrench: Install

PharoOWS can be installed using [Metacello](https://github.com/Metacello/metacello):

```smalltalk
Metacello new
  baseline: 'OWS';
  repository: 'github://ThalesGroup/PharoOWS:main';
  load.
```

Dependencies are:

  - [XMLParser](https://github.com/pharo-contributions/XML-XMLParser)


## :globe_with_meridians: Geospatial services: OGC Standards and de facto Protocols

Standard communication protocols with map servers can be divided into two main
categories:

1. Official protocols defined by the Open Geospatial Consortium (OGC)
2. De facto protocols that have emerged due to widespread use (such as XYZ)

### 1. Formal OGC protocols

**Traditional OGC Services**

These services are based on SOAP or HTTP protocols with specific requests often
constructed as URLs with parameters. They primarily exchange XML or other
specialized formats (XML for requests/responses, images for maps). These
standards have been widely used for many years to ensure geospatial
interoperability.

```console
http://mapserver?SERVICE=WMS&REQUEST=GetMap&LAYERS=layer0,layer1
```

**Modern RESTful Services**

These adopt a RESTful architecture based on modern web principles. They use
simple HTTP methods (`GET`, `POST`, etc.) and return responses in JSON. This
approach makes integration with applications easier due to its simplicity and
compatibility with current web technologies. OGC API - Features is a key
example of this new generation, providing standardized REST APIs for accessing
vector data.

```console
http://mapserver/collections/layer0/items.json
```

### 2. De facto standards

Although not officially standardized by organizations like the OGC, protocols
such as TMS (Tile Map Service) and the XYZ URL scheme are widely adopted in web
mapping. Their simplicity and compatibility with modern web technologies have
made them essential de facto standards for serving map tiles.


## :package: PharoOWS : overview of supported protocols and standards

PharoOWS is split into several packages according to the supported protocols
and standards:

| Package           | Type                  | Supported Protocols               | Status           |
|-------------------|-----------------------|-----------------------------------|------------------|
| OWS-TMS           | De facto standard     | TMS                               | In development   |
| OWS-Service       | Official OGC          | WMS, WMTS                         | In development   |
| OWS-API           | Official OGC (modern) | OGC API - Processes               | Upcoming         |


:loudspeaker: PharoOWS is still in development, so new protocols and standards
will be added over time.

## :computer: Examples

### WMS

```smalltalk
| wms operations getmap layers size map |

"Create a WMS client targeting the IGN WMS server"
wms := OWSServiceWMS new.
wms url: 'https://data.geopf.fr/wms-r'.

"Introspect the server capabilities"
operations := wms operations.

# 'operations' is a XMLOrderedList(
#   a OWSServiceWMSOperation <GetCapabilities>
#   a OWSServiceWMSOperation <GetMap>
#   a OWSServiceWMSOperation <GetFeatureInfo>
# )

"Listing available image formats for maps"
getmap := operations detect: [ :request | request name = 'GetMap' ].
getmap formats.

# 'formats' is an OrderedCollection(
#   image/jpeg
#   image/png
#   image/tiff
#   image/geotiff
#   image/x-bil;bits=32
# )

"Listing available layers"
layers := wms layers.

# 'layers' is a XMLOrderedList(
#   a OWSServiceWMSLayer(ADMINEXPRESS-COG-CARTO.LATEST)
#   a OWSServiceWMSLayer(ADMINEXPRESS-COG.2017)
#   [...]
# )

"Download a raster map with two layers for a bounding box defined by EPSG:3857 coordinates"
map := wms
  map: { 'EL.GridCoverage'. 'FORETS.PUBLIQUES' }
  bbox: (-546079 @ 6126282 corner: -398839 @ 6212047)
  size: 800 @ 600
  epsg: '3857'
  format: 'image/png'.

# 'map' is a Bitmap
```

<p align="center">
  <img src="doc/wms.png" alt="WMS map" width="400"/>
</p>


## :bust_in_silhouette: Contributing

If you are interested in contributing to the XXX project, start by reading the
[CONTRIBUTING](CONTRIBUTING) guide.


## :page_facing_up: License

This project is licensed under the MIT License - see the [LICENSE](LICENSE)
file for details.

