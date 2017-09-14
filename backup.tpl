<div class="panel-body">
    <p>{$lang['chanbackdesc']}</p>
</div>
<div class="panel-body">
    <h2>{$lang['chanbackups']}</h2>
</div>
<table class="table table-hover table-striped">
    <thead>
        <tr>
            <th>{$lang['created']}</th>
            <th>{$lang['server']}</th>
            <th>{$lang['options']}</th>
        </tr>
    </thead>
{if isset($files[0]) AND !empty($files[0])}
    <tbody>
        {foreach key=key item=value from=$files[0]}
            {if $serverhost === true AND $hoststatus === false AND $value['server'] == $getserverip OR $serverhost === false OR $hoststatus === true}
                {if $change_col % 2} {assign var=td_col value="green1"} {else} {assign var=td_col value="green2"} {/if}
                <tr>
                    <td class="{$td_col} center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                    <td class="{$td_col} center">{$value['server']}</td>
                    <td class="{$td_col} center">
                        <form method="post" action="index.php?site=backup&amp;sid={$sid}">
                            <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                            <input type="hidden" name="fileport" value="{$value['server']}" />
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default" type="button" name="view" title="{$lang['view']}" onClick="oeffnefenster('site/chanbackupview.php?backupid={$value['timestamp']}&amp;fileport={$value['server']}');"><i class="fa fa-lg fa-eye"></i></button>
                                <button class="btn btn-sm btn-success" type="submit" name="deploy" value="" title="{$lang['deploy']}"><i class="fa fa-lg fa-play"></i></button>
                                <button class="btn btn-sm btn-danger" type="submit" name="delete" value="" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                            </div>
                        </form>
                    </td>
                </tr>
                {assign var=change_col value="`$change_col+1`"}
            {/if}
        {/foreach}
    </tbody>
{/if}
</table>
{if $serverhost == true AND $hoststatus == true OR $serverhost == false}
    <div class="panel-body">
        <h2>{$lang['host']} {$lang['chanbackups']}</h2>
    </div>
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th>{$lang['created']}</th>
            <th>{$lang['server']}</th>
            <th>{$lang['options']}</th>
        </tr>
        </thead>
        {if isset($files[1]) AND !empty($files[1])}
            <tbody>
                {foreach key=key item=value from=$files[1]}
                    {if $change_col % 2} {assign var=td_col value="green1"} {else} {assign var=td_col value="green2"} {/if}
                    <tr>
                        <td class="{$td_col} center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                        <td class="{$td_col} center">{$value['server']}</td>
                        <td class="{$td_col} center">
                            <form method="post" action="index.php?site=backup&amp;sid={$sid}">
                                <input type="hidden" name="hostbackup" value="1" />
                                <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                <input type="hidden" name="fileport" value="{$value['server']}" />
                                <div class="btn-group">
                                    <button class="btn btn-sm btn-default" type="button" name="view" value="" title="{$lang['view']}" onClick="oeffnefenster('site/chanbackupview.php?backupid={$value['timestamp']}&amp;fileport={$value['server']}&amp;hostbackup=1');"><i class="fa fa-lg fa-eye"></i></button>
                                    <button class="btn btn-sm btn-success" type="submit" name="deploy" value="" title="{$lang['deploy']}"><i class="fa fa-lg fa-play"></i></button>
                                    <button class="btn btn-sm btn-danger" type="submit" name="delete" value="" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                                </div>
                            </form>
                        </td>
                    </tr>
                    {assign var=change_col value="`$change_col+1`"}
                {/foreach}
            </tbody>
        {/if}
	</table>
{/if}
<div class="panel-body">
    <form method="post" action="index.php?site=backup&amp;sid={$sid}">
        <div class="btn-group col-md-4 col-md-offset-4">
            <input class="btn btn-success" type="submit" name="create" value="{$lang['backup']}&nbsp;{$lang['create']}" />
            {if $serverhost == true AND $hoststatus == true OR $serverhost == false}
                <input type="hidden" name="hostbackup" value="1" />
                <input class="btn btn-success" type="submit" name="create" value="{$lang['host']}&nbsp;{$lang['backup']}&nbsp;{$lang['create']}" />
            {/if}
        </div>
    </form>
</div>