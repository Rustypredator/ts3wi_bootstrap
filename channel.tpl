{if isset($permoverview['b_virtualserver_channel_list']) AND empty($permoverview['b_virtualserver_channel_list'])}
	{include file="permerror.tpl"}
{else}
<div class="panel-body">
    <h2>{$lang['channel']}</h2>
</div>
<table class="table table-condensed table-hover table-striped panel-body">
    <thead>
        <tr>
            <th>{$lang['id']}</th>
            <th>{$lang['pid']}</th>
            <th>{$lang['name']}</th>
            <th>{$lang['option']}</th>
        </tr>
    </thead>
{if !empty($channellist)}
    <tbody>
        {foreach key=key item=value from=$channellist}
            <tr>
                <td>{$value['cid']}</td>
                <td>{$value['pid']}</td>
                <td>{$value['channel_name']}</td>
                <td>
                    <div class="btn-group">
                    <a class="btn btn-info" href="index.php?site=channelview&amp;sid={$sid}&amp;cid={$value['cid']}" title="{$lang['select']}"><i class="fa fa-lg fa-eye"></i></a>
                    <a class="btn btn-success" href="index.php?site=channeleditperm&amp;sid={$sid}&amp;cid={$value['cid']}" title="{$lang['editperms']}"><i class="fa fa-lg fa-edit"></i></a>
                        <form method="post" action="index.php?site=channel&amp;sid={$sid}">
                            <input type="hidden" name="cid" value="{$value['cid']}" />
                            {if $value['total_clients'] > 0}
                                <input type="hidden" name="force" value="1" />
                            {/if}
                            {if !isset($permoverview['b_channel_delete_permanent']) AND $value['channel_flag_permanent'] == 1 OR $permoverview['b_channel_delete_permanent'] == 1 AND $value['channel_flag_permanent'] == 1}
                                {if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
                                    <button type="submit" class="btn btn-danger" name="delete" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')"><i class="fa fa-lg fa-trash"></i></button>
                                {/if}
                            {/if}
                            {if !isset($permoverview['b_channel_delete_semi_permanent']) AND $value['channel_flag_semi_permanent'] == 1 OR $permoverview['b_channel_delete_semi_permanent'] == 1 AND $value['channel_flag_semi_permanent'] == 1}
                                {if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
                                    <button type="submit" class="btn btn-danger" name="delete" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')"><i class="fa fa-lg fa-trash"></i></button>
                                {/if}
                            {/if}
                            {if !isset($permoverview['b_channel_delete_temporary']) AND $value['channel_flag_permanent'] == 0 AND $value['channel_flag_semi_permanent'] == 0 OR $permoverview['b_channel_delete_temporary'] == 1 AND $value['channel_flag_permanent'] == 0 AND $value['channel_flag_semi_permanent'] == 0}
                                {if !isset($permoverview['b_channel_delete_flag_force']) OR $value['total_clients'] == 0 AND $permoverview['b_channel_delete_flag_force'] == 0 OR $value['total_clients'] >= 0 AND $permoverview['b_channel_delete_flag_force'] == 1}
                                    <button type="submit" class="btn btn-danger" name="delete" value="" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgchannel']}')"><i class="fa fa-lg fa-trash"></i></button>
                                {/if}
                            {/if}
                        </form>
                    </div>
                </td>
            </tr>
        {/foreach}
    </tbody>
	{/if}
</table>
{/if}