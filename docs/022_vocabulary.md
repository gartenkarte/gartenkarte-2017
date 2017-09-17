### 2.2. Vocabulary

> [Berliner Gartenkarte 2017](https://github.com/gartenkarte/gartenkarte-2017/)

The vocabulary is created and translated at https://base.transformap.co/wiki/Special:AllPages?from=&to=&namespace=120

It is then exported (currently manually) to a blazgraph RDF database, which serves the taxonomy as RDF.
The RDF interface is here: https://query.base.transformap.co/bigdata/#namespaces

How to update the taxonomy in the RDF DB:

```
ssh root@rancher
cd /srv/wikibase/
date=$(date -I)
docker run -it --rm --env-file /srv/wikibase/mediawiki.env -v /srv/docker-state/wikibase/mediawiki/rootfs/data:/data -v /srv/docker-state/wikibase/mediawiki/rootfs/conf:/conf -v /srv/wikibase/LocalSettings.php:/data/LocalSettings.php  --link="wikibase_database_1:database" --net="wikibase_backend" wikibase_mediawiki /usr/bin/php /var/www/html/extensions/Wikibase/repo/maintenance/dumpRdf.php | gzip -c > $date_wikibase_dump.ttl.gz
```

#### Get the dump to your local machine

    sftp root@rancher:/srv/wikibase/$date_wikibase_dump.ttl.gz localhost

#### Upload it to the RDF store

The next steps are to be done in the web interface of the data base.

We first need to delete the old DB (there would be duplicate values if we just dump in the new extract)
Go to https://query.base.transformap.co/bigdata/#namespaces

1. clone the transformap namespace to a copy "tm2" or something like that
  * click "clone"
2. enter the name in the box on the bottom
  * click "create namespace"
3. delete the "transformap" namespace
  * clone the copy to "transformap"
4. for the "transformap" namespace, click "Use"

Go to https://query.base.transformap.co/bigdata/#update

1. Choose File
2. Type RDF Data , Turtle
3. click 'update'

#### Backup

A fallback of taxonomy is served from the repository at https://github.com/TransforMap/transformap-viewer-translations
In there is a folder named 'taxonomy-backup/'.

```
git clone https://github.com/TransforMap/transformap-viewer-translations.git
cd taxonomy-backup/
```

In this folder is a README.md. At the bottom of it is a chain of commands to download the taxonomy for each language.

```
cd susy/
```

In the `susy/` folder execute the `for` loop found in the README from `taxonomy-backup/`.

```
git status # to see what has been updated
git add *
git commit -m "taxonomy fallback update"
git push
```

The updated taxonomy is then live for the `transformap-viewer`.
