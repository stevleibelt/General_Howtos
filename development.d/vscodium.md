# VSCodium

## Used Extension

I am using [vscodium](https://github.com/VSCodium/vscodium) with the following extensions:

* [Data Preview](https://github.com/RandomFractals/vscode-data-preview)
* [Excel to Markdown table](https://github.com/csholmq/vscode-excel-to-markdown-table)
* [German Language Pack for Visual Studio Code](https://github.com/Microsoft/vscode-loc)
* [German Support for LanguageTool](https://github.com/adamvoss/vscode-languagetool)
* [Git Graph](https://github.com/mhutchie/vscode-git-graph)
* [LanguageTool for Visual Studio Code](https://github.com/adamvoss/vscode-languagetool)
* [Learn Vim](https://marketplace.visualstudio.com/items?itemName=vintharas.learn-vim)
* [Markdown All in One](https://github.com/yzhang-gh/vscode-markdown)
* [Markdown Navigation](https://github.com/AlanWalk/markdown-navigation)
* [Markdown PDF](https://github.com/yzane/vscode-markdown-pdf)
* [Markdown Preview Mermaid Support](https://github.com/mjbvz/vscode-markdown-mermaid)
* [markdownlint](https://github.com/DavidAnson/vscode-markdownlint)
* [PHP Debug](https://github.com/xdebug/vscode-php-debug)
* [PHP Intelephense](https://github.com/bmewburn/vscode-intelephense)
* [PowerShell](https://github.com/PowerShell/vscode-powershell)
* [Prettiy JSON](https://marketplace.visualstudio.com/items?itemName=mohsen1.prettify-json)
* [SpellChecker](https://github.com/swyphcosmo/vscode-spellchecker)
* [Vim](https://github.com/VSCodeVim/Vim)
* [vscode-pdf](https://github.com/tomoki1207/vscode-pdfviewer)
* [Zenburn](https://github.com/ryanolsonx/vscode-zenburn-theme)
* [Zenburn Monolith Theme](https://github.com/nicolagranata/vscode-theme-zenburn-monolith)

## HowTo

### Disable Preview

* [Source](https://www.nicoespeon.com/en/2020/01/change-vscode-preview-files/) - 2020-01-01
* Issue is, that you want to open multiple files but vscodium is "overwriting" this one tab with other files
* Short answer
  * Open settings
  * Search for "enable preview"
  * Disable it
* Long answer
  * VSCode has a build in feature called "preview" mode
  * The developer assumes that you want to open a file, by default, in a preview tab
    * The idea behind this is, that you are searching for a file content
    * To decrease the chance that you fill up your tab space with multiple open files, your are having this one preview tab
  * If you are not the person who closes files that you don't need, this feature is for you
  * To open this file in a real tab, you have to double click this file

