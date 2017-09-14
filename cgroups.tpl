{if isset($permoverview['b_virtualserver_channelgroup_list']) AND empty($permoverview['b_virtualserver_channelgroup_list'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h3>{$lang['channelgroups']}</h3>
    </div>
    <table class="table table-condensed table-striped table-hover panel-body">
        <thead>
            <tr>
                <th>{$lang['id']}</th>
                <th>{$lang['name']}</th>
                <th>{$lang['type']}</th>
                <th>{$lang['iconid']}</th>
                <th>{$lang['savedb']}</th>
                <th>{$lang['options']}</th>
            </tr>
        </thead>
        {if !empty($channelgroups)}
            <tbody>
                {foreach key=key item=value from=$channelgroups}
                    <tr>
                        <td>{$value['cgid']}</td>
                        <td>
                            <form method="post" action="index.php?site=cgroups&amp;sid={$sid}&amp;cgid={$value['cgid']}">
                                <div class="input-group">
                                    <input class="form-control" type="text" name="name" value="{$value['name']}" />
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit" name="sendname"><i class="fa fa-lg fa-edit"></i>&nbsp;{$lang['rename']}</button>
                                    </div>
                                </div>
                            </form>
                        </td>
                        <td>{$value['type']}</td>
                        <td>{$value['iconid']}</td>
                        <td>{$value['savedb']}</td>
                        <td>
                            {if $value['type'] != '0'}
                                <a class="btn btn-info" title="{$lang['clients']}" href="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$value['cgid']}"><i class="fa fa-lg fa-users"></i></a>
                            {/if}
                                <a class="btn btn-success" title="{$lang['editperms']}" href="index.php?site=cgroupeditperm&amp;sid={$sid}&amp;cgid={$value['cgid']}"><i class="fa fa-lg fa-edit"></i></a>
                            {if !isset($permoverview['b_virtualserver_channelgroup_delete']) or $permoverview['b_virtualserver_channelgroup_delete']==1}
                                <form method="post" action="index.php?site=cgroups&amp;sid={$sid}&amp;cgid={$value['cgid']}">
                                    <button type="submit" class="btn btn-danger" name="delgroup" onclick="return confirm('{$lang['deletemsgchannelgroup']}')" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                                </form>
                            {/if}
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        {/if}
    </table>
{/if}