# gartenkarte-2017/data

Dieser Ordner enthält Skripte, um die Daten vorzubereiten

## Test

### Bereinigung und Konvertierung

Um die Daten verarbeiten zu können, werden Node.js mit der global verfügbaren Bibliothek `csv2json` benötigt. NVM hilft dabei mehrere Node Versionen zu verwalten.

    ./00_prepare.sh gartenkarte 

* prepare
  * get
  * clean
  * convert

## TODO

### jeder Punkt einzeln

* filter `key` definieren
* `FeatureCollection `features` array ablaufen und objekte
  * nach `/place` hochladen, falls `id` noch keine UUID zugewiesen ist
  * zuordnung von `id` und `_id` behalten
