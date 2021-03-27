
README
======


This is a collection of different libc manpages.

I started collecting the manpages with the freebsd's ones,
they are quite comprehensive and detailed.


There are a two small scripts within this folder
for browsing and searching the manpages from the terminal.

They have these requirements:

- fzy [https://github.com/jhawthorn/fzy](https://github.com/jhawthorn/fzy),
  modified and included as submodule
- fpinfo.sh: pinfo (prezmek info viewer) [https://github.com/baszoetekouw/pinfo](https://github.com/baszoetekouw/pinfo)


For fulltext searches, I personally prefer the "silver_searcher".

To be able to do fulltext searches, I leave the manpages uncompressed.

It would be possible, to compress all manpages (something like `find . -exec gzip {} \;`),
then, index files within ./db/ would need to be updated.
(`sed -i 's/$/.gz/' manpages.txt`)

For convenience there's a binary of fzy included in ./bin.
It's compiled with musl at arch linux amd64.




