# Mermaid

## Examples

### Simple Flowchart

```mermaid
%%ref: https://www.freecodecamp.org/news/use-mermaid-javascript-library-to-create-flowcharts/%%
flowchart TD
  START((start)) --> user_name_input[/Please insert name/]
  user_name_input --> fetch_user[Fetch user from db]
  fetch_user --> |"Some information **describing** the process"|user_found{Username found in the db?}
  user_found --> Yes --> output_user_data[/Output user data/]
  user_found --> No --> output_user_not_found[/Output user not found/]
  output_user_data --> END(((end)))
  output_user_not_found --> END
```

## Links

* [Flowchars as code mit Mermaid-JS: ordix.de](https://blog.ordix.de/flowcharts-as-code-mit-mermaid-js) - 20241108
* [Mermaid integration in cutemakred: buoa.de](https://buoa.de/wiki/mermaid-integration-in-cutemarked) - 20241108
  * [How to Use the Mermaid JavaScript Library to Create Flowcharts: freecodecamp.org](https://www.freecodecamp.org/news/use-mermaid-javascript-library-to-create-flowcharts/) - 20250114
