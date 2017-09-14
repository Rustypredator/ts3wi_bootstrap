<div class="panel-body">
    <h2 class="text-center">{$lang['clientcleaner']}</h2>
    {if isset($deleted)}
        <div class="alert alert-info alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <i class="fa fa-lg fa-info-circle"></i>&nbsp;{$deleted}
        </div>
    {/if}
    <form method="post" action="index.php?site=clientcleaner&amp;sid={$sid}">
        {$lang['deleteallclientsoffline']}<input type="text" name="number" value="30" size="3"/>{$lang['deleteallclientsoffline2']}
        {$lang['checkgroupsprotected']}:<br/>
        <ul>
            {foreach key=key item=value from=$sgrouplist}
                <li><input type="checkbox" name="sgroups[]" value="{$value.sgid}" />&nbsp;{$value.name}</li>
            {/foreach}
        </ul>
        <button class="btn btn-success btn-block" type="submit" name="cleanit" title="{$lang['clean']}"><i class="fa fa-lg fa-paint-brush"></i>&nbsp;{$lang['clean']}</button>
    </form>
</div>