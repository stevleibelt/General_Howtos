# howto

## alter background coler for even or odd row

Based on [this](http://nabble.documentfoundation.org/LibreOffice-Writer-Table-with-alternative-row-color-td4146325.html) link.

```
Open Format=>Conditional Formatting=>Condition

Setup condition one:
    Select "Formula" and insert "ISEVEN(ROW())"
    Select or create your own style for even rows (set a background color)

If needed add a second condition
    Select "Formula" and insert "ISODD(ROW())"
    Select or create your own style for even rows (set a background color)
```
