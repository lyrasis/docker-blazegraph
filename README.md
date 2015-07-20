Docker Blazegraph
=================

Run Blazegraph in Docker.

**Quickstart**

```bash
$ docker run --name blazegraph -d -p 8889:8080 lyrasis/blazegraph:1.5.1
$ docker logs -f blazegraph
```

**Local builds**

```
$ docker build -t blazegraph:1.5.1 1.5.1/
$ docker run --name blazegraph -d -p 8889:8080 blazegraph:1.5.1
$ docker logs -f blazegraph
```

---