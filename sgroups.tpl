{if isset($permoverview['b_virtualserver_servergroup_list']) AND empty($permoverview['b_virtualserver_servergroup_list'])}
    {include file="permerror.tpl"}
{else}
	<div class="panel-body">
        <h3 class="text-center">{$lang['servergroups']}</h3>
    </div>
	<table class="table table-condensed table-hover table-striped panel-body">
		<thead>
			<tr>
				<td>{$lang['id']}</td>
				<td>{$lang['name']}</td>
				<td>{$lang['type']}</td>
				<td>{$lang['iconid']}</td>
				<td>{$lang['savedb']}</td>
				<td>{$lang['options']}</td>
			</tr>
		</thead>
        {if !empty($servergroups)}
            <tbody>
                {foreach key=key item=value from=$servergroups}
                    <tr>
                        <td>{$value['sgid']}</td>
                        <td>
                            <form method="post" action="index.php?site=sgroups&amp;sid={$sid}&amp;sgid={$value['sgid']}">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="name" value="{$value['name']}" />
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit" name="sendname" title="{$lang['rename']}">{$lang['rename']}</button>
                                    </div>
                                </div>
                            </form>
                        </td>
                        <td>{$value['type']}</td>
                        <td>{sprintf('%u', $value['iconid'] & 0xffffffff)}</td>
                        <td>{$value['savedb']}</td>
                        <td>
                            {if $value['type'] != '0'}
                                <form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$value['sgid']}">
                                    <button class="btn btn-info" type="submit" class="clients" name="groupclients" title="{$lang['clients']}"><i class="fa fa-lg fa-users"></i></button>
                                </form>
                            {/if}
                            <form method="post" action="index.php?site=sgroupeditperm&amp;sid={$sid}&amp;sgid={$value['sgid']}">
                                <button class="btn btn-success" type="submit" class="eperms" name="permedit" title="{$lang['editperms']}"><i class="fa fa-lg fa-edit"></i></button>
                            </form>
                            {if !isset($permoverview['b_virtualserver_servergroup_delete']) or $permoverview['b_virtualserver_servergroup_delete'] == 1}
                                <form method="post" action="index.php?site=sgroups&amp;sid={$sid}&amp;sgid={$value['sgid']}">
                                    <button class="btn btn-danger" type="submit" class="delete" name="delgroup" title="{$lang['delete']}"  onclick="return confirm('{$lang['deletemsgservergroup']}')"><i class="fa fa-lg fa-trash"></i></button>
                                </form>
                            {/if}
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        {/if}
	</table>
{/if}