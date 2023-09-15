# use/escape javascript/css code in templates

```html
{literal} my content {/literal}
{ldelim} my content {rdelim} 
```

# switch between two css class

```html
{cycle assign="tr_class" values="list_white,list_grey"}
```

# isset

```html
{if isset($foo)}
```

# var_dump

```html
{$var|@var_dump}
```

# md5

```html
{md5 var=$var}
```

# assign var in script

```html
{assign var='form_name' value='document_upload_select'}
```

# if else if else

```html
{if}{elseif}{else}{/if}
```

# foreach

See [howto](http://www.smarty.net/docsv2/en/language.function.foreach).

```html
{foreach from=$myArray key=key item=value}
  key: {$key} with value: {$value}
{foreachelse}
  no items available
{/foreach}
```

# array_key_exists

```html
{if array_key_exists('foo', $myArray)}foo exists{else}no foo{/if}
```

# instanceof

```html
{if $foo instanceof \Foo}
    yes, is instance of \Foo
{else}
    no, it os not an instance of \Foo
{/if}
```

# comments

```html
<!-- @see: http://www.smarty.net/docsv2/en/language.basic.syntax -->
{* single line comment *}
{* multi
line
comment *}
```
