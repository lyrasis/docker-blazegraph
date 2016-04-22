Docker Blazegraph
=================

[![](https://imagelayers.io/badge/lyrasis/blazegraph:1.5.3.svg)](https://imagelayers.io/?images=lyrasis/blazegraph:1.5.3 'Get your own badge on imagelayers.io')
[![Build Status](https://travis-ci.org/lyrasis/docker-blazegraph.svg?branch=master)](https://travis-ci.org/lyrasis/docker-blazegraph)

Run Blazegraph in Docker.

**Quickstart**

```bash
docker run --name blazegraph -d -p 8889:8080 lyrasis/blazegraph:1.5.3
docker logs -f blazegraph
```

**Local builds**

```
docker build -t blazegraph:1.5.3 1.5.3/
docker run --name blazegraph -d -p 8889:8080 blazegraph:1.5.3
docker logs -f blazegraph
```

---
