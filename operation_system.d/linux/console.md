# Linux console

## Change colors of directories and files in ls command

* All is included in the variable `$LS_COLORS`
* `di=1;4;33` tells you that
  * **di**rectories are 
  * (`=`) bold `1:` which is the color attribute
  * underline `4:` which is the color attribute
  * red (`31`) which is the color

### Color attribute

| Attribute | Code |
| --- | --- |
| Normal Text | 0 |
| Bold or Light Text | 1 |
| Dim Text | 2 |
| Underlined Text| 4 |
| Blinking Text | 5 |
| Reversed Text | 7 |
| Hidden Text | 8 |

### Color List for the foreground text

| Color | Code |
| --- | --- |
| Black | 30 |
| Red | 31 |
| Green | 32 |
| Yellow | 33 |
| Blue | 34 |
| Purple | 35 |
| Cyan | 36 |
| White | 37 |

### Color List for the background text

| Color | Code |
| --- | --- |
| Black | 40 |
| Red | 41 |
| Green | 42 |
| Yellow | 43 |
| Blue | 44 |
| Purple | 45 |
| Green | 46 |
| White | 47 |

## Links

* [Color output in console: wiki.archlinux.org](https://wiki.archlinux.org/title/Color_output_in_console) - 20230623
