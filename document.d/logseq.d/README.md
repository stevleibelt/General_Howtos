# Logseq

Logseq is a personal note system.

Key feature is to have a place for your daily journal application that simplifies linking to create a graph based database of knowledge while typing.

## Keyboard Shortcuts

There is a built in Help page listing all available keystrokes.   
Open the right panel by pressing `t` and `r`.  
Select Keyboard shortcuts.

### The following list is a list of my preferred keystroks

| Keystrokes | Description |
| --- | --- |
| ENTER | Create new block |
| SHIFT+ENTER | New line in current block |
| TAB | Indent block |
| SHIFT+TAB | Outdent block |
| CTRL+a | Select parent block |
| CTRL+c | Copy (either selection, block or reference) to stack |
| CTRL+SHIFT+c | Copy selection as text to stack |
| `/` | Triggers autocompletion dialog/shows all available commands |
| `<` | Triggers block content autocomplete |
| [[word]] | Create or reference new page to this word (new page in the search bar) |
| ((word)) | Search and use reference to block on any page (linking things) |
| [my text]([[page name]]) | Create a reference to a page with an label |
| [my text](((page name))) | Create a reference to a block with an label |
| property_name:: property_value | More advanced tagging with value |
| #word | Create a tag to establish block references (linking things) |
| CTRL+ENTER | Create an entry in your todo list (hit Enter multiple times to change priority). `CANCELLED`, `WAITING` are also available but have to be typed manually |
| `/A`, `/B`, `/C` | To tag tasks with priorites. A = High, B = Medium, C = Low |
| `/Deadline`, `Scheduled` | To tag tasks or blocks with a date |

Example of a todo line `LATER /A /DEADLINE Do this ASAP`.

## config.edn

This file is available once per project and once in `~/.config/Logseq/`.

### Additional code for `:default-query`

```edn
;; BO: Todays Schedules
 {:title "Todays Schedules"
      :query [:find (pull ?b [*])
              :in $ ?today
              :where
              [?b :block/marker ?m]
              [(contains? #{"NOW" "LATER" "TODO" "DOING" "WAITING"} ?m)]

              [?b :block/page ?p]
              [?p :block/journal? true]

              (or
                [?b :block/scheduled ?d]
                [?b :block/deadline ?d])

              [(= ?d ?today)]
            ]
      :inputs [:today]
      :collapsed? false}
;; EO: Todays Schedules

;; BO: Schedules in overdue
 {:title "Overdue Schedules"
    :query [:find (pull ?b [*])
              ;;:in $ ?start ?next
              :in $ ?next
              :where
              [?b :block/marker ?marker]
              (or
                [?b :block/scheduled ?d]
                [?b :block/deadline ?d])
              [(contains? #{"TODO" "DOING" "NOW" "LATER" "WAITING"} ?marker)]
              ;;[(>= ?d ?start)]
              [(<= ?d ?next)]]
    ;;:inputs [:365d :1d]
    :inputs [:1d]
    :result-transform (fn [result]
                        (sort-by (fn [h]
                                   (get h :block/priority "Z")) result))
    :collapsed? false
    :breadcrumb-show? false}
;; EO: Schedules in overdue
```

### Define new start page

```edn
:default-home {:page "todo_list"}
```

In the shell where your `config.edn` exists.   
`touch ../pages/todo_list.md`

### Embed todays journal page

```edn
:macros {:journal-today "{{embed <%today%>}}"}
```

Add following code in your `todo_list`: `{{journal-today}}`

### Add Macro for colors for `custom.css`

```css
:color "[:span {:style \"color: $1\"} $2]"

/****
 * Prevent issues with line breaks
 * ref: https://discuss.logseq.com/t/change-text-color-for-individual-blocks-or-even-words/20508/17
 ****/
.macro,
  .macro .hiccup_html,
  .macro .raw_html {
      display: inline;
  }
```

## Notes

### List all open tasks

* Type `t` and `r`
* Open page graph
* Select `TODO`
* This is the page with all todos

## Links

* [Collection of logseq extensions: github.com](https://github.com/logseq/awesome-logseq) - 20240328
* [50 LOGSEQ TIPS: Beginner to Expert in 6 Minutes | Tutorial | ROAM Research Alternative Free Version: youtube.com](https://www.youtube.com/watch?v=r_tcDooayOo) - 20230926
* [Official webpage: logseq.com](https://logseq.com/) - 20230926
  * [Official logseq glossary: logseq.com](https://docs.logseq.com/#/page/glossary) - 20240328
  * [Official logseq tutorial: logseq.com](https://docs.logseq.com/#/page/tutorial) - 20240328
