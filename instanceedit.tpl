{if $hoststatus === false AND $serverhost === true}
	<div class="alert alert-danger alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-lg fa-times-circle"></i>&nbsp;{$lang['nohoster']}
	</div>
{else}
    <div class="panel-body">
        <h2 class="text-center">{$lang['instanceedit']}</h2>
        <form class="form-horizontal" method="post" action="index.php?site=instanceedit">
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['questsquerygroup']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_guest_serverquery_group]" value="{$instanceinfo['serverinstance_guest_serverquery_group']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['tempsadmingroup']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_template_serveradmin_group]" value="{$instanceinfo['serverinstance_template_serveradmin_group']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['tempcadmingroup']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_template_channeladmin_group]" value="{$instanceinfo['serverinstance_template_channeladmin_group']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['tempsdefgroup']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_template_serverdefault_group]" value="{$instanceinfo['serverinstance_template_serverdefault_group']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['tempcdefgroup']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_template_channeldefault_group]" value="{$instanceinfo['serverinstance_template_channeldefault_group']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['filetransport']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_filetransfer_port]" value="{$instanceinfo['serverinstance_filetransfer_port']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['maxdownbandwidth']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_max_download_total_bandwidth]" value="{$instanceinfo['serverinstance_max_download_total_bandwidth']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['maxupbandwidth']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_max_upload_total_bandwidth]" value="{$instanceinfo['serverinstance_max_upload_total_bandwidth']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['squeryfloodcmd']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_serverquery_flood_commands]" value="{$instanceinfo['serverinstance_serverquery_flood_commands']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['squeryfloodtime']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_serverquery_flood_time]" value="{$instanceinfo['serverinstance_serverquery_flood_time']}" />
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['squerybantime']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="newsettings[serverinstance_serverquery_ban_time]" value="{$instanceinfo['serverinstance_serverquery_ban_time']}" />
                </div>
            </div>
            <div class="col-sm-12"><button class="btn btn-success btn-block" type="submit" name="editinstance" title="{$lang['edit']}" ><i class="fa fa-lg fa-edit"></i>&nbsp;{$lang['edit']}</button></div>
        </form>
    </div>
    <form method="post" action="index.php?site=instanceedit">
        <div class="panel-body"><h2 class="text-center">{$lang['showonweblist']}</h2></div>
        <table class="table table-condensed table-hover table-striped panel-body">
            <thead>
                <tr>
                    <th>{$lang['serverid']}</th>
                    <th>{$lang['name']}</th>
                    <th>{$lang['selectall']}<input type="checkbox" name="checkall" value="0" onclick="check(1)" /></th>
                </tr>
            </thead>
            <tbody>
                {if !empty($serverlist)}
                    {foreach key=key item=value from=$serverlist}
                        {if $change_col % 2} {assign var=td_col value="green1"} {else} {assign var=td_col value="green2"} {/if}
                        <tr>
                            <td class="{$td_col}">{$value['virtualserver_id']}</td>
                            <td class="{$td_col}">{$value['virtualserver_name']}</td>
                            <td class="{$td_col}" align="right">
                                <input type="hidden" name="list[{$value['virtualserver_id']}][0]" value="0" />
                                <input {if $value['virtualserver_weblist_enabled'] == 1}checked="checked"{/if} type="checkbox" id="list{$value['virtualserver_id']}" name="list[{$value['virtualserver_id']}][0]" value="1"/>
                            </td>
                        </tr>
                        {assign var=change_col value="`$change_col+1`"}
                    {/foreach}
                {/if}
            </tbody>
        </table>
        <div class="panel-body"><button class="btn btn-success btn-block" type="submit" name="editshowlist" title="{$lang['edit']}"><i class="fa fa-lg fa-edit"></i>&nbsp;{$lang['edit']}</button></div>
    </form>
{/if}