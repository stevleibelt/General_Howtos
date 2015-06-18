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

## see (embeded) fonts ([source](https://github.com/alexanderduring/notes/blob/master/pdf/repair-pdf-with-missing-font.md))

```
pdffonts <path/to/my.pdf>
```

## try to embed missing fonts ([source](https://github.com/alexanderduring/notes/blob/master/pdf/repair-pdf-with-missing-font.md))

```
gs -o <path/to/new.pdf> -dPDFSETTINGS=/prepress -sDEVICE=pdfwrite <path/to/old.pdf>
```
