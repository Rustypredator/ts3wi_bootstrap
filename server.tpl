{if $hoststatus === false AND $serverhost === true}
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <i class="fa fa-lg fa-times-circle"></i>&nbsp;{$lang['nohoster']}
    </div>
{else}
    <div class="panel-body">
        <form method="post" action="index.php?site=server">
            <div class="form-group">
                <label class="col-md-2 label-control">{$lang['msgtoall']}</label>
                <div class="col-md-8">
                    <textarea class="form-control" size="100" name="msgtoall"></textarea>
                </div>
                <div class="col-md-2">
                    <input class="btn btn-success" type="submit" name="sendmsg" value="{$lang['send']}"/>
                </div>
            </div>
        </form>
    </div>
    <div class="panel-body">
        <h2>{$lang['server']}:</h2>
        {if !empty($serverlist)}
            <div class="well">{$serverstats}</div>
        {/if}
    </div>
    <form method="post" name="saction" action="index.php?site=server">
        {if !empty($serverlist)}
            <table class="table table-striped table-hover panel-body">
                <tr>
                    <td colspan="7" align="right"></td>
                    <td><input class="btn btn-success form-control" type="submit" name="massaction" value="{$lang['action']}" onclick="return confirm(confirmAction())" /></td>
                </tr>
                <thead>
                    <th><a class="headlink" href="index.php?site=server&amp;sortby=id&amp;sorttype={if $sortby == 'virtualserver_id' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['id']}</a></th>
                    <th><a class="headlink" href="index.php?site=server&amp;sortby=name&amp;sorttype={if $sortby == 'virtualserver_name' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['name']}</a></th>
                    <th><a class="headlink" href="index.php?site=server&amp;sortby=port&amp;sorttype={if $sortby == 'virtualserver_port' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['port']}</a></th>
                    <th><a class="headlink" href="index.php?site=server&amp;sortby=status&amp;sorttype={if $sortby == 'virtualserver_status' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['status']}</a></th>
                    <th><a class="headlink" href="index.php?site=server&amp;sortby=uptime&amp;sorttype={if $sortby == 'virtualserver_uptime' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['runtime']}</a></th>
                    <th><a class="headlink" href="index.php?site=server&amp;sortby=clients&amp;sorttype={if $sortby == 'virtualserver_clientsonline' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['clients']}</a></th>
                    <th>{$lang['autostart']}</th>
                    <th>{$lang['options']}</th>
                </thead>
                <tbody>
                {foreach key=key item=value from=$serverlist}
                    <tr>
                        <td>{$value['virtualserver_id']}</td>
                        <td><a href="index.php?site=serverview&amp;sid={$value['virtualserver_id']}">{$value['virtualserver_name']}</a></td>
                        <td>{$value['virtualserver_port']}</td>
                        <td>
                            {if $value['virtualserver_status'] == "online"}
                                <span class="label label-success">{$lang['online']}</span>
                            {elseif $value['virtualserver_status'] == "online virtual"}
                                <span class="label label-default">{$lang['onlinevirtual']}</span>
                            {elseif $value['virtualserver_status'] == "offline"}
                                <span class="label label-danger">{$lang['offline']}</span>
                            {/if}
                        </td>
                        <td>{$value['virtualserver_uptime']}</td>
                        <td>{$value['virtualserver_clientsonline']} / {$value['virtualserver_maxclients']}</td>
                        <td>
                            <input type="checkbox" name="caction[{$value['virtualserver_id']}][auto]" value="1" {if $value['virtualserver_autostart'] == 1}checked="checked"{/if}/>
                        </td>
                        <td>
                            <select class="form-control" id="caction{$value['virtualserver_id']}" name="caction[{$value['virtualserver_id']}][action]" onchange="confirmArray('{$value['virtualserver_id']}', '{$value['virtualserver_name']|addslashes}', '{$value['virtualserver_port']}', '');">
                                <option value="">{$lang['select']}</option>
                                <option value="start">{$lang['start']}</option>
                                <option value="stop">{$lang['stop']}</option>
                                <option value="del">{$lang['delete']}</option>
                            </select>
                        </td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        {else}
            <div class="alert alert-warning">
                <i class="fa fa-lg fa-warning"></i>&nbsp;{$lang['noserver']}
            </div>
        {/if}
    </form>
{/if}