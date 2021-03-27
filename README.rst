
README
======


This is a collection of different libc manpages.

I started collecting the manpages with the freebsd's ones,
they are quite comprehensive and detailed.


There are a few small scripts within this folder
for browsing and searching the manpages from the terminal.

They have these requirements:

- fzy
- pinfo (prezmek info viewer)


For fulltext searches, I personally prefer the "silver_searcher".

To be able to do fulltext searches, I leave the manpages uncompressed.

It would be possible, to compress all manpages (something like `find . -exec gzip {} \;`),
then, index files within ./db/ would need to be updated.
(`sed -i 's/$/.gz/' manpages.txt`)






