# viewer

* apvlv
* epdfview
* evince
* impressive
* mupdf
* qpdf

# tools

## merge or split pdfs

* pdfsam

## see (embeded) fonts

```
pdffonts <path/to/my.pdf>
```

## try to embed missing fonts

```
gs -o <path/to/new.pdf> -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite <path/to/old.pdf>
```
