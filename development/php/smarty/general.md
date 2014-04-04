# use/escape javascript/css code in templates

    {ldelim} my content {rdelim} 

# switch between two css class

    {cycle assign="tr_class" values="list_white,list_grey"}

# isset

    {if isset($foo)}

# var_dump

    {$var|@var_dump}

# md5

    {md5 var=$var}

# assign var in script

    {assign var='form_name' value='document_upload_select'}

# if else if else

    {if}{elseif}{else}{/if}

# foreach

See [howto](http://www.smarty.net/docsv2/en/language.function.foreach).

    {foreach from=$myArray key=key item=value}
      key: {$key} with value: {$value}
    {foreachelse}
      no items available
    {/foreach}

# array_key_exists

    {if array_key_exists('foo', $myArray)}foo exists{else}no foo{/if}
