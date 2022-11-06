# OCR

## Example using convert with tesseract

```
#convert pdf to an image
#image should be high resolution and greyscaled
convert -density 300 file.pdf -depth 8 file.tiff  
#add "-l deu" if you know the language
tesseract file.tiff file
```

## Links

* [papierloses büro](https://www.pro-linux.de/artikel/2/1892/4,ocr-einsetzen.html)
* [pypdfocr](https://github.com/virantha/pypdfocr) - Python script to do PDF OCR conversion using Tesseract 
* [ocrmypdf](https://github.com/jbarlow83/OCRmyPDF) - OCRmyPDF adds an OCR text layer to scanned PDF files, allowing them to be searched 
* [ocrpdf](https://github.com/bdheath/OCRPDF) -  Python wrapper for quickly OCR'ing multipage PDF files
* tesseract
    * http://kiirani.com/2013/03/22/tesseract-pdf.html
    * https://www.gadgetdaily.xyz/how-to-get-started-with-the-google-maps-api/
    * http://www.tristancollins.me/computing/ocr-using-tesseract-on-multipage-pdfs/
    * https://www.gaggl.com/2015/03/paperless-office-using-the-raspberry-pi/

