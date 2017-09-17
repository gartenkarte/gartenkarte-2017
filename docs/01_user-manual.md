## 2. User Manual

This user manual presents the functions of the Gartenkarte which are accessible to end users. Below the aspects of *filtering*, *embedding* and *editing* the map are covered.

> ![](./assets/gartenkarte.de.jpg)
>
> [Berliner Gartenkarte 2017](https://github.com/gartenkarte/gartenkarte-2017/)

### Filtering

On a desktop computer, the left side of the screen shows a list of *garden types* which you can select or deselct to filter the displayed points of interest.

Mobile devices show you buttons to collapse and expand the filter view, which is on these shown atop the map.

These filters are built from a collaborative database.

### Embedding

To embed the Gartenkarte into your website, you can use an `<iframe />`:

    <iframe width="960" height="720" src="http://gartenkarte.de" />

You can switch the background layer via the URL parameter "background", e.g. `src="http://gartenkarte.de/?background=mapnik#5/51.166/10.451"`. These four layers are supported:

* `background=stamen_terrain_bg` Default, only terrain without any labels, roads or buildings.
* `background=stamen_terrain` terrain with (a few) labels, roads and buildings later
* `background=mapnik` Default OpenStreetMap 'Mapnik'/'OSM-Carto' style
* `background=hot` Humanitarian OSM style. Temperate colors, very detailed.

For other changes you need to adapt the source code.

### Editing

When you log in to the site, the popups that are shown after clicking on a map marker will contain an edit button that sends you to the `transformap-editor` with the point in question.
