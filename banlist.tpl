{if isset($permoverview['b_client_ban_list']) AND empty($permoverview['b_client_ban_list'])}
    {include file="permerror.tpl"}
{else}
	<div class="panel-body">
		<h2>{$lang['banlist']}</h2>
	</div>
	<table class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th>{$lang['banid']}</th>
                <th>{$lang['ip']}/{$lang['name']}/{$lang['uniqueid']}</th>
                <th>{$lang['created']}</th>
                <th>{$lang['invokername']}</th>
                <th>{$lang['invokeruid']}</th>
                <th>{$lang['reason']}</th>
                <th>{$lang['length']}</th>
                <th>{$lang['enforcement']}</th>
                <th>{$lang['option']}</th>
            </tr>
        </thead>
	{if !empty($banlist)}
        <tbody>
            {foreach key=key item=value from=$banlist}
                <tr>
                    <td>{$value['banid']}</td>
                    <td>{$value['ip']}{$value['name']}{$value['uid']}</td>
                    <td>{$value['created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                    <td>{secure($value['invokername'])}</td>
                    <td>{$value['invokeruid']}</td>
                    <td>{$value['reason']}</td>
                    <td>{if isset($value['duration'])} {$value['duration']}{else}0{/if}</td>
                    <td>{$value['enforcement']}</td>
                    <td>
                    {if !isset($permoverview['b_client_ban_delete']) OR $permoverview['b_client_ban_delete'] == 1}
                        <form method="post" action="index.php?site=banlist&amp;sid={$sid}">
                            <input type="hidden" name="banid" value="{$value['banid']}" />
                            <input class="btn btn-warning btn-sm" type="submit" name="unban" value="Unban" />
                        </form>
                    {/if}
                    </td>
                </tr>
                {assign var=change_col value="`$change_col+1`"}
            {/foreach}
        </tbody>
	{/if}
	</table>
{/if}