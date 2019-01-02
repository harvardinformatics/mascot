# mascot
Containerized version of Mascot.

Assuming that you have mascot source code, data, and sequences under ~/mascot, run the container as follows:

```
$ docker pull harvardinformatics/mascot

$ docker run --rm --name mascot -v $HOME/mascot/mascot:/usr/local/mascot -v $HOME/mascot/sequence:/usr/local/mascot/sequence -v $HOME/mascot/data:/usr/local/mascot/data -p 7788:80 -d harvardinformatics/mascot:latest
```
