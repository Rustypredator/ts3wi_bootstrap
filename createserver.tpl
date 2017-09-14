{if $hoststatus === false AND $serverhost === true}
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <i class="fa fa-lg fa-times-circle"></i>&nbsp;{$lang['nohoster']}
    </div>
{else}
	{if !isset($smarty.post.createserver) OR !empty($error)}
        <div class="panel-body">
            <div class="well">{$lang['createserverdesc']}</div>
            <h2>{$lang['createnewserver']}:</h2>
            <form method="post" class="form-horizontal" action="index.php?site=createserver">
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['name']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_name]" value="{$screate_tmp['name']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['port']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_port]" value="{$screate_tmp['port']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['minclientversion']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_min_client_version]" value="{$screate_tmp['minclientversion']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['welcomemsg']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_welcomemessage]" value="{$screate_tmp['welcomemsg']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['maxclients']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_maxclients]" value="{$screate_tmp['maxclients']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['maxreservedslots']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_reserved_slots]" value="{$screate_tmp['reservedslots']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['showonweblist']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_weblist_enabled]" value="{$screate_tmp['showonweblist']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['password']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_password]" value="{$screate_tmp['password']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['securitylevel']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_needed_identity_security_level]" value="{$screate_tmp['securitylvl']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['minclientschan']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$screate_tmp['forcesilence']}"/>
                    </div>
                </div>
                {$lang['host']}
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostmessage']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostmessage]" value="{$screate_tmp['hostmsg']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostmessageshow']}:</label>
                    <div class="col-sm-10">
                        <input {if $screate_tmp['hostmsgshow'] === '0'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="0" />&nbsp;{$lang['nomessage']}<br/>
                        <input {if $screate_tmp['hostmsgshow'] === '1'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="1" />&nbsp;{$lang['showmessagelog']}<br />
                        <input {if $screate_tmp['hostmsgshow'] === '2'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="2" />&nbsp;{$lang['showmodalmessage']}<br />
                        <input {if $screate_tmp['hostmsgshow'] === '3'} checked="checked" {/if} type="radio" name="newsettings[virtualserver_hostmessage_mode]" value="3" />&nbsp;{$lang['modalandexit']}
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hosturl']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_url]" value="{$screate_tmp['hosturl']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostbannerurl']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$screate_tmp['hostbannerurl']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostbannerintval']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$screate_tmp['hostbannerint']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostbuttongfx']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$screate_tmp['hostbuttongfx']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostbuttontooltip']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$screate_tmp['hostbuttontip']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['hostbuttonurl']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_url]" value="{$screate_tmp['hostbuttonurl']}"/>
                    </div>
                </div>
                {$lang['autoban']}
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['autobancount']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_count]" value="{$screate_tmp['autobancount']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['autobantime']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_time]" value="{$screate_tmp['autobantime']}"/> {$lang['seconds']}
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['removetime']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_complain_remove_time]" value="{$screate_tmp['removetime']}"/> {$lang['seconds']}
                    </div>
                </div>
                {$lang['antiflood']}
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['pointstickreduce']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$screate_tmp['pointstickreduce']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['pointsneededblockcmd']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$screate_tmp['pointsneededblockcmd']}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['pointsneededblockip']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$screate_tmp['pointsneededblockip']}"/>
                    </div>
                </div>
                {$lang['transfers']}
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['upbandlimit']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$screate_tmp['uploadbandwidthlimit']}"/> Byte/s
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['uploadquota']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_upload_quota]" value="{$screate_tmp['uploadquota']}"/> MiB
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['downbandlimit']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$screate_tmp['downloadbandwidthlimit']}"/> Byte/s
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['downloadquota']}:</label>
                    <div class="col-sm-10">
                        <input class="form-control" type="text" name="newsettings[virtualserver_download_quota]" value="{$screate_tmp['downloadquota']}"/> MiB
                    </div>
                </div>
                {$lang['logs']}
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['logclient']}:</label>
                    <div class="col-sm-10">
                        {$lang['yes']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_client]" value="1" {if $screate_tmp['virtualserver_log_client'] === '1'}checked="checked"{/if} />
                        {$lang['no']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_client]" value="0" {if $screate_tmp['virtualserver_log_client'] === '0'}checked="checked"{/if} />
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['logquery']}:</label>
                    <div class="col-sm-10">
                        {$lang['yes']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_query]" value="1" {if $screate_tmp['virtualserver_log_query'] === '1'}checked="checked"{/if} />
                        {$lang['no']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_query]" value="0" {if $screate_tmp['virtualserver_log_query'] === '0'}checked="checked"{/if} />
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['logchannel']}:</label>
                    <div class="col-sm-10">
                        {$lang['yes']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_channel]" value="1" {if $screate_tmp['virtualserver_log_channel'] === '1'}checked="checked"{/if} />
                        {$lang['no']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_channel]" value="0" {if $screate_tmp['virtualserver_log_channel'] === '0'}checked="checked"{/if} />
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['logpermissions']}:</label>
                    <div class="col-sm-10">
                        {$lang['yes']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_permissions]" value="1" {if $screate_tmp['virtualserver_log_permissions'] === '1'}checked="checked"{/if} />
                        {$lang['no']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_permissions]" value="0" {if $screate_tmp['virtualserver_log_permissions'] === '0'}checked="checked"{/if} />
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['logserver']}:</label>
                    <div class="col-sm-10">
                        {$lang['yes']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_server]" value="1" {if $screate_tmp['virtualserver_log_server'] === '1'}checked="checked"{/if} />
                        {$lang['no']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_server]" value="0" {if $screate_tmp['virtualserver_log_server'] === '0'}checked="checked"{/if} />
                    </div>
                </div>
                <div class="form-group">
                    <label class="label-control col-sm-2" for="">{$lang['logfiletransfer']}:</label>
                    <div class="col-sm-10">
                        {$lang['yes']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_filetransfer]" value="1" {if $screate_tmp['virtualserver_log_filetransfer'] === '1'}checked="checked"{/if} />
                        {$lang['no']}&nbsp;<input type="radio" name="newsettings[virtualserver_log_filetransfer]" value="0" {if $screate_tmp['virtualserver_log_filetransfer'] === '0'}checked="checked"{/if} />
                    </div>
                </div>
                <div class="col-sm-12">
                    <button class="btn btn-success btn-block" type="submit" name="createserver" title="{$lang['create']}"><i class="fa fa-lg fa-plus"></i>&nbsp;{$lang['create']}</button>
                </div>
            </form>
        </div>
	{/if}
{/if}
