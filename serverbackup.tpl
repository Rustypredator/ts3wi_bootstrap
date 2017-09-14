<div class="panel-body">
    {$lang['servbackdesc']}
    <div class="alert alert-warning">{$lang['snapwarning']}</div>
    <h3 class="text-center">{$lang['serverbackups']}</h3>
</div>
<table class="table table-condensed table-hover table-striped panel-body">
    <thead>
        <td>{$lang['created']}</td>
        <td>{$lang['server']}</td>
        <td>{$lang['options']}</td>
    </thead>
    {if isset($files[0]) AND !empty($files[0]) OR isset($folder[2]) AND !empty($folder[2])}
        <tbody>
            {if !isset($smarty.post.backupdate)}
                {foreach key=key item=value from=$folder.2}
                    <tr>
                        <td class="{$td_col} center">{$value}</td>
                        <td colspan="2" class="{$td_col} center">
                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                <input type="hidden" name="backupdate" value="{$value}" />
                                <button class="btn btn-info" type="submit" name="chose" title="Ausw&auml;hlen"><i class="fa fa-lg fa-play"></i></button>
                            </form>
                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                <input type="hidden" name="backupdate" value="{$value}" />
                                <button class="btn btn-danger" type="submit" name="deleteall" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                            </form>
                        </td>
                    </tr>
                {/foreach}
            {else}
                {if	isset($files[0])}
                    {foreach key=key item=value from=$files.0}
                        <tr>
                            <td>{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                            <td>{$value['server']}</td>
                            <td>
                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                    <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                    <input type="hidden" name="fileport" value="{$value['server']}" />
                                    <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                    <button class="btn btn-info" type="submit" name="deploy" title="{$lang['deploy']}"><i class="fa fa-lg fa-play"></i></button>
                                </form>
                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                    <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                    <input type="hidden" name="fileport" value="{$value['server']}" />
                                    <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                    <button class="btn btn-danger" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                    {/foreach}
                {else}
                    <tr>
                        <td colspan="3" class="text-center" >No Backups found!</td>
                    </tr>
                {/if}
            {/if}
        </tbody>
    {/if}
</table>
{if $hoststatus == true}
    <div class="panel-body">
        <h3 class="text-center">{$lang['host']} {$lang['serverbackups']}</h3>
    </div>
    <table class="table table-condensed table-hover table-striped panel-body">
        <thead>
        <th>{$lang['created']}</th>
        <th>{$lang['server']}</th>
        <th>{$lang['options']}</th>
        </thead>
        {if isset($files[1]) AND !empty($files[1]) OR isset($folder[1]) AND !empty($folder[1])}
            {if !isset($smarty.post.backupdate)}
                <tbody>
                {foreach key=key item=value from=$folder[1]}
                    <tr>
                        <td class="{$td_col} center">{$value}</td>
                        <td colspan="2" class="{$td_col} center">
                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                <input type="hidden" name="backupdate" value="{$value}" />
                                <button class="btn btn-info" type="submit" name="chose" title="Ausw&auml;hlen"><i class="fa fa-lg fa-play"></i></button>
                            </form>
                            <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                <input type="hidden" name="hostbackup" value="1" />
                                <input type="hidden" name="backupdate" value="{$value}" />
                                <button class="btn btn-danger" type="submit" name="deleteall" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                            </form>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            {else}
                {if	isset($files[1])}
                    <tbody>
                    {foreach key=key item=value from=$files[1]}
                        <tr>
                            <td class="{$td_col} center">{$value['timestamp']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                            <td class="{$td_col} center">{$value['server']}</td>
                            <td class="{$td_col} center">
                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                    <input type="hidden" name="hostbackup" value="1" />
                                    <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                    <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                    <input type="hidden" name="fileport" value="{$value['server']}" />
                                    <button class="btn btn-info" type="submit" name="deploy" title="{$lang['deploy']}"><i class="fa fa-lg fa-play"></i></button>
                                </form>
                                <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
                                    <input type="hidden" name="hostbackup" value="1" />
                                    <input type="hidden" name="backupdate" value="{$smarty.post.backupdate}" />
                                    <input type="hidden" name="backupid" value="{$value['timestamp']}" />
                                    <input type="hidden" name="fileport" value="{$value['server']}" />
                                    <button class="btn btn-danger" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                                </form>
                            </td>
                        </tr>
                    {/foreach}
                    </tbody>
                {else}
                    <tbody>
                        <tr>
                            <td colspan="3" class="text-center">No Backups found!</td>
                        </tr>
                    </tbody>
                {/if}
            {/if}
        {/if}
    </table>
{/if}
<div class="panel-body">
    <h3 class="text-center">{$lang['createserverbackup']}</h3>
    <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
        <button class="btn btn-success" type="submit" name="create" title="{$lang['create']}">{$lang['create']}</button>
    </form>
    {if $hoststatus==true}
        <form method="post" action="index.php?site=serverbackup&amp;sid={$sid}">
            <input type="hidden" name="hostbackup" value="1" />
            <button class="btn btn-success" type="submit" name="create" title="{$lang['host']} {$lang['create']}">{$lang['host']} {$lang['create']}</button>
        </form>
    {/if}
</div>