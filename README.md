Docker Blazegraph
=================

Run Blazegraph in Docker.

**Quickstart**

```bash
docker run --name blazegraph -d -p 8889:8080 lyrasis/blazegraph:2.1.4
docker logs -f blazegraph
```

**Local builds**

```
docker build -t blazegraph:2.1.4 2.1.4/
docker run --name blazegraph -d -p 8889:8080 blazegraph:2.1.4
docker logs -f blazegraph
```

---
