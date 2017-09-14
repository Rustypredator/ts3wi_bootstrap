{if $newserverversion !== true AND !empty($serverinfo['virtualserver_version'])}
	<div class="alert alert-info alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-lg fa-info-circle"></i>&nbsp;{$lang['serverupdateav']}{$newserverversion}
	</div>
{/if}

{if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
	<div class="alert alert-info alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-lg fa-info-circle"></i>&nbsp;<strong>{$lang['error']}</strong><br/>{$lang['nopermissions']}
	</div>
{else}
    <div class="panel-body">
        <form method="post" action="index.php?site=serverview&amp;sid={$sid}">
            <input type="hidden" name="sid" value="{$serverinfo['virtualserver_id']}" />
            <div class="form-group">
                <label class="label-control col-md-2" for="msgtoserver">{$lang['msgtoserver']}</label>
                <div class="col-md-8"><textarea class="form-control" name="msgtoserver" size="100"></textarea></div>
                <div class="col-md-2"><input class="btn btn-success form-control" type="submit" name="sendmsg" value="{$lang['send']}" /></div>
            </div>
        </form>
    </div>
    <div class="panel-body">
        <div class="col-md-6">
            <form method="post" action="index.php?site=serverview&amp;sid={$sid}">
                <input type="hidden" name="sid" value="{$serverinfo['virtualserver_id']}" />
                <input class="btn btn-success pull-right" type="submit" name="start" value="{$lang['start']}" title="{$lang['start']}" />
            </form>
        </div>
        <div clas="col-md-6">
            <form method="post" action="index.php?site=serverview&amp;sid={$sid}">
                <input type="hidden" name="sid" value="{$serverinfo['virtualserver_id']}" />
                <input class="btn btn-danger pull-left" type="submit" name="stop" value="{$lang['stop']}" title="{$lang['stop']}" onclick="return confirm('{$lang['stopservermsg']}')" />
            </form>
        </div>
    </div>
    <table class="panel-body">
        <td>
            <table class="table table-hover table-striped table-sm">
                <thead>
                <tr>
                    <th colspan="2">{$lang['virtualserver']} #{$serverinfo['virtualserver_id']}</th>
                </tr>
                </thead>
                <tbody>
                <tr><td colspan="2">{$lang['basics']}</td></tr>
                <tr>
                    <td>{$lang['autostart']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_autostart'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['serveraddress']}:</td>
                    <td>{$smarty.session.server_ip}:{$serverinfo['virtualserver_port']}</td>
                </tr>
                <tr>
                    <td>{$lang['minclientversion']}:</td>
                    <td>{$serverinfo['virtualserver_min_client_version']}</td>
                </tr>
                <tr>
                    <td>{$lang['uniqueid']}:</td>
                    <td>{$serverinfo['virtualserver_unique_identifier']}</td>
                </tr>
                <tr>
                    <td>{$lang['name']}:</td>
                    <td>{$serverinfo['virtualserver_name']}</td>
                </tr>
                <tr>
                    <td>{$lang['welcomemsg']}:</td>
                    <td>{$serverinfo['virtualserver_welcomemessage']}</td>
                </tr>
                <tr>
                    <td>{$lang['version']}:</td>
                    <td>{$serverinfo['virtualserver_version']}</td>
                </tr>
                <tr>
                    <td>{$lang['platform']}:</td>
                    <td>{$serverinfo['virtualserver_platform']}</td>
                </tr>
                <tr>
                    <td>{$lang['created']}:</td>
                    <td>{$serverinfo['virtualserver_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                </tr>
                <tr>
                    <td>{$lang['status']}:</td>
                    <td>{$serverinfo['virtualserver_status']}</td>
                </tr>
                <tr>
                    <td>{$lang['runtime']}:</td>
                    <td>{$serverinfo['virtualserver_uptime']}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['clients']}:</td>
                    <td>{$serverinfo['virtualserver_clientsonline']-$serverinfo['virtualserver_queryclientsonline']} / {$serverinfo['virtualserver_maxclients']}</td>
                </tr>
                <tr>
                    <td>{$lang['queryclients']}:</td>
                    <td>{$serverinfo['virtualserver_queryclientsonline']}</td>
                </tr>
                <tr>
                    <td>{$lang['maxreservedslots']}:</td>
                    <td>{$serverinfo['virtualserver_reserved_slots']}</td>
                </tr>
                <tr>
                    <td>{$lang['showonweblist']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_weblist_enabled'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['codecencryptionmode']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_codec_encryption_mode']==0}
                            {$lang['codecencryptionmodeindi']}
                        {elseif $serverinfo['virtualserver_codec_encryption_mode']==1}
                            {$lang['codecencryptionmodegoff']}
                        {elseif $serverinfo['virtualserver_codec_encryption_mode']==2}
                            {$lang['codecencryptionmodegon']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['channel']}:</td>
                    <td>{$serverinfo['virtualserver_channelsonline']}</td>
                </tr>
                <tr>
                    <td>{$lang['minclientschan']}:</td>
                    <td>{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}</td>
                </tr>
                <tr>
                    <td>{$lang['clientsdimm']}:</td>
                    <td>{$serverinfo['virtualserver_priority_speaker_dimm_modificator']}</td>
                </tr>
                <tr>
                    <td>{$lang['passwordset']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_flag_password'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['securitylevel']}:</td>
                    <td>{$serverinfo['virtualserver_needed_identity_security_level']}</td>
                </tr>
                <tr>
                    <td>{$lang['iconid']}:</td>
                    <td>{$serverinfo['virtualserver_icon_id']}</td>
                </tr>
                <tr>
                    <td colspan="2">{$lang['standardgroups']}</td>
                </tr>
                <tr>
                    <td>{$lang['servergroup']}:</td>
                    <td>
                        {if !empty($servergroups)}
                            {foreach key=key item=value from=$servergroups}
                                {if $value['sgid'] == $serverinfo['virtualserver_default_server_group']}
                                    ({$value['sgid']}){$value['name']}
                                {/if}
                            {/foreach}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['channelgroup']}:</td>
                    <td>
                        {if !empty($channelgroups)}
                            {foreach key=key item=value from=$channelgroups}
                                {if $value['cgid'] == $serverinfo['virtualserver_default_channel_group']}
                                    ({$value['cgid']}){$value['name']}
                                {/if}
                            {/foreach}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['chanadmingroup']}:</td>
                    <td>
                        {if !empty($channelgroups)}
                            {foreach key=key item=value from=$channelgroups}
                                {if $value['cgid'] == $serverinfo['virtualserver_default_channel_admin_group']}
                                    ({$value['cgid']}){$value['name']}
                                {/if}
                            {/foreach}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td colspan="2">{$lang['host']}</td>
                </tr>
                <tr>
                    <td>{$lang['hostmessage']}:</td>
                    <td>{$serverinfo['virtualserver_hostmessage']}</td>
                </tr>
                <tr>
                    <td>{$lang['hostmessageshow']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_hostmessage_mode'] == '0'}
                            {$lang['nomessage']}
                        {elseif $serverinfo['virtualserver_hostmessage_mode'] == '1'}
                            {$lang['showmessagelog']}
                        {elseif $serverinfo['virtualserver_hostmessage_mode'] == '2'}
                            {$lang['showmodalmessage']}
                        {elseif $serverinfo['virtualserver_hostmessage_mode'] == '3'}
                            {$lang['modalandexit']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>{$lang['hosturl']}:</td>
                    <td>{$serverinfo['virtualserver_hostbanner_url']}</td>
                </tr>
                <tr>
                    <td>{$lang['hostbannerurl']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
                            <img style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /><br />
                        {/if}
                        {$serverinfo['virtualserver_hostbanner_gfx_url']}</td>
                </tr>
                <tr>
                    <td>{$lang['hostbannerintval']}:</td>
                    <td>{$serverinfo['virtualserver_hostbanner_gfx_interval']}</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>{$lang['hostbuttongfx']}:</td>
                    <td>{$serverinfo['virtualserver_hostbutton_gfx_url']}</td>
                </tr>
                <tr>
                    <td>{$lang['hostbuttontooltip']}:</td>
                    <td>{$serverinfo['virtualserver_hostbutton_tooltip']}</td>
                </tr>
                <tr>
                    <td>{$lang['hostbuttonurl']}:</td>
                    <td>{$serverinfo['virtualserver_hostbutton_url']}</td>
                </tr>
                <tr>
                    <td colspan="2">{$lang['autoban']}</td>
                </tr>
                <tr>
                    <td>{$lang['autobancount']}:</td>
                    <td>{$serverinfo['virtualserver_complain_autoban_count']}</td>
                </tr>
                <tr>
                    <td>{$lang['autobantime']}:</td>
                    <td>{$serverinfo['virtualserver_complain_autoban_time']}</td>
                </tr>
                <tr>
                    <td>{$lang['removetime']}:</td>
                    <td>{$serverinfo['virtualserver_complain_remove_time']}</td>
                </tr>
                <tr>
                    <td colspan="2">{$lang['antiflood']}</td>
                </tr>
                <tr>
                    <td>{$lang['pointstickreduce']}:</td>
                    <td>{$serverinfo['virtualserver_antiflood_points_tick_reduce']}</td>
                </tr>
                <tr>
                    <td>{$lang['pointsneededblockcmd']}:</td>
                    <td>{$serverinfo['virtualserver_antiflood_points_needed_command_block']}</td>
                </tr>
                <tr>
                    <td>{$lang['pointsneededblockip']}:</td>
                    <td>{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}</td>
                </tr>
                <tr>
                    <td colspan="2">{$lang['transfers']}</td>
                </tr>
                <tr>
                    <td>{$lang['upbandlimit']}:</td>
                    <td>{$serverinfo['virtualserver_max_upload_total_bandwidth']} Byte/s</td>
                </tr>
                <tr>
                    <td>{$lang['uploadquota']}:</td>
                    <td>{$serverinfo['virtualserver_upload_quota']} MiB</td>
                </tr>
                <tr>
                    <td>{$lang['downbandlimit']}:</td>
                    <td>{$serverinfo['virtualserver_max_download_total_bandwidth']} Byte/s</td>
                </tr>
                <tr>
                    <td>{$lang['downloadquota']}:</td>
                    <td>{$serverinfo['virtualserver_download_quota']} MiB</td>
                </tr>
                <tr>
                    <td colspan="2">{$lang['logs']}</td>
                </tr>
                <tr>
                    <td>{$lang['logclient']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_log_client'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['logquery']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_log_query'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['logchannel']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_log_channel'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['logpermissions']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_log_permissions'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['logserver']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_log_server'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                <tr>
                    <td>{$lang['logfiletransfer']}:</td>
                    <td>
                        {if $serverinfo['virtualserver_log_filetransfer'] == 1}
                            {$lang['yes']}
                        {else}
                            {$lang['no']}
                        {/if}
                    </td>
                </tr>
                </tbody>
            </table>
        </td>
        <?php } ?>
        <td>
            <table>
                <tr>
                    <td>
                        <div class="content">
                            {$tree}
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        {$lang['tsviewpubhtml']}
                        <textarea rows="20" cols="20" style="width:445px; height:100px;" readonly="readonly" class="green1">{$pubtsview}</textarea>
                    </td>
                </tr>
            </table>
        </td>
    </table>
	{/if}
