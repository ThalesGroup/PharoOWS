# WMS

The [Web Map Service (WMS)](https://www.ogc.org/standards/wms/) protocol
primarily relies on the **GetMap** request, which allows users to retrieve a map as
an image through an HTTP request sent to a map server. Numerous parameters can
be used to customize how the map is rendered, including the image format,
selected datasets and layers or the map projection defined by an EPSG code.

In addition, the WMS protocol provides other requests such as
**GetCapabilities**, which enables service introspection. This request returns
information about the layers currently available on the server, along with
detailed metadata for each layer, including rendering options like bounding
boxes and other configuration details.

## Initialization

To interact with a WMS map server using **PharoOWS**, you first need to create
an `OWSServiceWMS` instance with a valid URL. In this example, we will use the
[French IGN](https://www.geoportail.gouv.fr/) server (France’s national
geographic and forestry information agency).

```` c++
wms := OWSServiceWMS new.
wms url: 'https://data.geopf.fr/wms-r'.
````

## Introspection

The `capabilities` method allows a user to retrieve the full XML document
returned by the server in response to a **GetCapabilities** request. This document
contains extensive information about the server and the data it currently
provides.

```` c++
operations := wms capabilities.

service := (capabilities document descendantElementsNamed: 'Service') first.
(service findElementNamed: 'Title') contentString
//> ByteString('API Géoplateforme - Diffusion d''images WMS-Raster')
````

While it can be parsed manually by navigating the XML tree, the **PharoOWS**
API also offers built-in utility methods to access details such as the WMS
version, available layers or supported operations.

```` c++
wms version
//> ByteString('1.3.1')
````

```` c++
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
````

<img src="images/wms.png" width="400">
