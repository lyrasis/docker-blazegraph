# Docker Blazegraph

Run Blazegraph in Docker.

## Quickstart

```bash
docker run --name blazegraph -d -p 8889:8080 lyrasis/blazegraph:2.1.4
docker logs -f blazegraph
```

## Local builds

```
docker build -t blazegraph:2.1.4 2.1.4/
docker run --name blazegraph -d -p 8889:8080 blazegraph:2.1.4
docker logs -f blazegraph
```

## Loading data (example)

Files or directories need to be made available to the container:

```bash
# using a host volume mount to make files available
mkdir -p /tmp/blazegraph/data/
cp data/authoritieschildrensSubjects.nt /tmp/blazegraph/data/

# start container making files available under /data
docker run --name blazegraph -d \
  -p 8889:8080 \
  -v $PWD/data/RWStore.properties:/RWStore.properties \
  -v /tmp/blazegraph/data/:/data \
  lyrasis/blazegraph:2.1.4

# create payload config
cp data/dataloader.txt.example dataloader.txt

# trigger data import
curl -X POST \
  --data-binary @dataloader.txt \
  --header 'Content-Type:text/plain' \
  http://localhost:8889/bigdata/dataloader
```

Sample query:

```sparql
prefix bds: <http://www.bigdata.com/rdf/search#>
select ?identifier ?value
where {
  ?value bds:search "Women" .
  ?value bds:matchAllTerms "true" .
  ?identifier <http://www.loc.gov/mads/rdf/v1#authoritativeLabel> ?value .
}
```

---
