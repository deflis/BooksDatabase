<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>書庫DB</title>
    </head>
    <body>
        <h1>{$name}</h1>
        {foreach from=$Users item=User}
        <p>
            {foreach from=$User key=k item=v}
                {$k}: {$v}<br />
            {/foreach}
        </p>
        {/foreach}
        <!-- {section name=idx loop=$Books} -->
        <p>
            <!-- {$Books[idx].title} -->
            <img alt="{$Books[idx].title}"  src="{$Books[idx].amazon.LargeImage.URL}" />
            <!-- {foreach from=$Books[idx] key=k item=v} -->
                {$k}: {$v}<br />
            <!-- {/foreach} -->
        </p>

        <!--{/section}-->


    </body>
</html>