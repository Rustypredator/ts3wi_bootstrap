<div class="panel-body">
    <h2 class="text-center">{$lang['virtualserver']} #{$serverinfo['virtualserver_id']} {$lang['editor']}</h2>
    {if !isset($permoverview['b_virtualserver_modify_password']) OR $permoverview['b_virtualserver_modify_password'] == 1}
        <h3 class="text-center">{$lang['serverpassword']}</h3>
        <form class="form-horizontal" method="post" action="index.php?site=serveredit&amp;sid={$sid}">
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['passwordset']}</label>
                <div class="col-sm-10">
                    {if $serverinfo['virtualserver_flag_password'] == 1}{$lang['yes']}{else} {$lang['no']}{/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['newpassword']}</label>
                <div class="col-sm-10">
                <div class="input-group">
                    <input class="form-control" type="text" name="newsettings[virtualserver_password]"/>
                    <div class="input-group-btn"><button class="btn btn-success" type="submit" name="editpw" title="{$lang['set']}">{$lang['set']}</button></div>
                </div>
                </div>
            </div>
        </form>
    {/if}
    <h3 class="text-center">{$lang['general']}allgemein</h3>
    <form class="form-horizontal" method="post" action="index.php?site=serveredit&amp;sid={$sid}">
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['autostart']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_autostart']) AND empty($permoverview['b_virtualserver_modify_autostart'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_autostart]">
                        <option value="1" {if $serverinfo['virtualserver_autostart'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                        <option value="0" {if $serverinfo['virtualserver_autostart'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                    </select>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['port']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_port']) AND empty($permoverview['b_virtualserver_modify_port'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_port]" value="{$serverinfo['virtualserver_port']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['minclientversion']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_min_client_version']) AND empty($permoverview['b_virtualserver_modify_min_client_version'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_min_client_version]" value="{$serverinfo['virtualserver_min_client_version']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['name']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_name']) AND empty($permoverview['b_virtualserver_modify_name'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_name]" value="{$serverinfo['virtualserver_name']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['welcomemsg']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_welcomemessage']) AND empty($permoverview['b_virtualserver_modify_welcomemessage'])}
                    -
                {else}
                    <textarea class="form-control" name="newsettings[virtualserver_welcomemessage]" rows="5" cols="30">{$serverinfo['virtualserver_welcomemessage']}</textarea>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['maxclients']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_maxclients']) AND empty($permoverview['b_virtualserver_modify_maxclients'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_maxclients]" value="{$serverinfo['virtualserver_maxclients']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['maxreservedslots']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_reserved_slots']) AND empty($permoverview['b_virtualserver_modify_reserved_slots'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_reserved_slots]" value="{$serverinfo['virtualserver_reserved_slots']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['showonweblist']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_weblist']) AND empty($permoverview['b_virtualserver_modify_weblist'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_weblist_enabled]">
                        <option value="1" {if $serverinfo['virtualserver_weblist_enabled'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                        <option value="0" {if $serverinfo['virtualserver_weblist_enabled'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                    </select>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['codecencryptionmode']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_codec_encryption_mode']) AND empty($permoverview['b_virtualserver_modify_codec_encryption_mode'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_codec_encryption_mode]">
                        <option value="0" {if $serverinfo['virtualserver_codec_encryption_mode'] == 0}selected='selected'{/if}>{$lang['codecencryptionmodeindi']}</option>
                        <option value="1" {if $serverinfo['virtualserver_codec_encryption_mode'] == 1}selected='selected'{/if}>{$lang['codecencryptionmodegoff']}</option>
                        <option value="2" {if $serverinfo['virtualserver_codec_encryption_mode'] == 2}selected='selected'{/if}>{$lang['codecencryptionmodegon']}</option>
                    </select>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['securitylevel']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_needed_identity_security_level']) AND empty($permoverview['b_virtualserver_modify_needed_identity_security_level'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_needed_identity_security_level]" value="{$serverinfo['virtualserver_needed_identity_security_level']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['minclientschan']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_channel_forced_silence']) AND empty($permoverview['b_virtualserver_modify_channel_forced_silence'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_min_clients_in_channel_before_forced_silence]" value="{$serverinfo['virtualserver_min_clients_in_channel_before_forced_silence']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['iconid']}</label>
            {if isset($permoverview['b_virtualserver_modify_icon_id']) AND empty($permoverview['b_virtualserver_modify_icon_id'])}
                -
            {else}
                <div class="col-sm-10">
                    <div class="input-group">
                        <input class="form-control" id="iconid" type="text" name="newsettings[virtualserver_icon_id]" value="{$serverinfo['virtualserver_icon_id']}" />
                        <div class="input-group-btn">
                            <a class="btn btn-success" href="javascript:oeffnefenster('site/showallicons.php?ip={$smarty.session.server_ip}&amp;sid={$sid}&amp;port={$serverinfo['virtualserver_port']}');">{$lang['select']}</a>
                        </div>
                    </div>
                </div>
            {/if}
        </div>
        <h3 class="text-center">{$lang['standardgroups']}</h3>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['servergroup']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_default_servergroup']) AND empty($permoverview['b_virtualserver_modify_default_servergroup'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_default_server_group]">
                        {foreach key=key item=value from=$servergroups}
                            {if $value['type'] == 1}
                                <option {if $value['sgid'] == $serverinfo['virtualserver_default_server_group']}selected="selected"{/if} value="{$value['sgid']}">{$value['sgid']} {$value['name']}</option>
                            {/if}
                        {/foreach}
                    </select>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['channelgroup']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_default_channelgroup']) AND empty($permoverview['b_virtualserver_modify_default_channelgroup'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_default_channel_group]">
                        {foreach key=key item=value from=$channelgroups}
                            {if $value['type'] == 1}
                                <option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
                            {/if}
                        {/foreach}
                    </select>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['chanadmingroup']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_default_channeladmingroup']) AND empty($permoverview['b_virtualserver_modify_default_channeladmingroup'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_default_channel_admin_group]">
                        {foreach key=key item=value from=$channelgroups}
                            {if $value['type'] == 1}
                                <option {if $value['cgid'] == $serverinfo['virtualserver_default_channel_admin_group']}selected="selected"{/if} value="{$value['cgid']}">{$value['cgid']} {$value['name']}</option>
                            {/if}
                        {/foreach}
                    </select>
                {/if}
            </div>
        </div>
        <h3 class="text-center">{$lang['host']}</h3>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostmessage']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
                    -
                {else}
                    <textarea class="form-control" name="newsettings[virtualserver_hostmessage]" rows="5" cols="30">{$serverinfo['virtualserver_hostmessage']}</textarea>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostmessageshow']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostmessage']) AND empty($permoverview['b_virtualserver_modify_hostmessage'])}
                    -
                {else}
                    <select class="form-control" name="newsettings[virtualserver_hostmessage_mode]">
                        <option value="0" {if $serverinfo['virtualserver_hostmessage_mode'] == 0}selected='selected'{/if}>{$lang['nomessage']}</option>
                        <option value="1" {if $serverinfo['virtualserver_hostmessage_mode'] == 1}selected='selected'{/if}>{$lang['showmessagelog']}</option>
                        <option value="2" {if $serverinfo['virtualserver_hostmessage_mode'] == 2}selected='selected'{/if}>{$lang['showmodalmessage']}</option>
                        <option value="3" {if $serverinfo['virtualserver_hostmessage_mode'] == 3}selected='selected'{/if}>{$lang['modalandexit']}</option>
                    </select>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hosturl']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_url]" value="{$serverinfo['virtualserver_hostbanner_url']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostbannerurl']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
                    -
                {else}
                    <div class="col-sm-6"><input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_url]" value="{$serverinfo['virtualserver_hostbanner_gfx_url']}" /></div>
                    {if $serverinfo['virtualserver_hostbanner_gfx_url']!=''}
                        <div class="col-sm-6"><img class="img img-responsive" style="width:350px" src="{$serverinfo['virtualserver_hostbanner_gfx_url']}" alt="" /></div>
                    {/if}
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostbannerintval']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostbanner']) AND empty($permoverview['b_virtualserver_modify_hostbanner'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_hostbanner_gfx_interval]" value="{$serverinfo['virtualserver_hostbanner_gfx_interval']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostbuttontooltip']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_tooltip]" value="{$serverinfo['virtualserver_hostbutton_tooltip']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostbuttongfx']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
                    -
                {else}
                    <div class="col-sm-6"><input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_gfx_url]" value="{$serverinfo['virtualserver_hostbutton_gfx_url']}" /></div>
                    <div class="col-sm-6"><img class="img img-responsible" src="{$serverinfo['virtualserver_hostbutton_gfx_url']}" alt="{$serverinfo['virtualserver_hostbutton_gfx_url']}"/></div>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['hostbuttonurl']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_hostbutton']) AND empty($permoverview['b_virtualserver_modify_hostbutton'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_hostbutton_url]" value="{$serverinfo['virtualserver_hostbutton_url']}" />
                {/if}
            </div>
        </div>
        <h3 class="text-center">{$lang['autoban']}</h3>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['autobancount']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_count]" value="{$serverinfo['virtualserver_complain_autoban_count']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['autobantime']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
                    -
                {else}
                    <div class="input-group">
                        <input class="form-control" type="text" name="newsettings[virtualserver_complain_autoban_time]" value="{$serverinfo['virtualserver_complain_autoban_time']}" />
                        <div class="input-group-addon">{$lang['seconds']}</div>
                    </div>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['removetime']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_complain']) AND empty($permoverview['b_virtualserver_modify_complain'])}
                    -
                {else}
                    <div class="input-group">
                        <input class="form-control" type="text" name="newsettings[virtualserver_complain_remove_time]" value="{$serverinfo['virtualserver_complain_remove_time']}" />
                        <div class="input-group-addon">{$lang['seconds']}</div>
                    </div>
                {/if}
            </div>
        </div>
        <h3 class="text-center">{$lang['antiflood']}</h3>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['pointstickreduce']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_tick_reduce]" value="{$serverinfo['virtualserver_antiflood_points_tick_reduce']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['pointsneededblockcmd']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_command_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_command_block']}" />
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['pointsneededblockip']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_antiflood']) AND empty($permoverview['b_virtualserver_modify_antiflood'])}
                    -
                {else}
                    <input class="form-control" type="text" name="newsettings[virtualserver_antiflood_points_needed_ip_block]" value="{$serverinfo['virtualserver_antiflood_points_needed_ip_block']}" />
                {/if}
            </div>
        </div>
        <h3 class="text-center">{$lang['transfers']}</h3>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['upbandlimit']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
                    -
                {else}
                    <div class="input-group">
                        <input class="form-control" type="text" name="newsettings[virtualserver_max_upload_total_bandwidth]" value="{$serverinfo['virtualserver_max_upload_total_bandwidth']}" />
                        <div class="input-group-addon">Byte/s</div>
                    </div>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['uploadquota']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
                    -
                {else}
                    <div class="input-group">
                        <input class="form-control" type="text" name="newsettings[virtualserver_upload_quota]" value="{$serverinfo['virtualserver_upload_quota']}" />
                        <div class="input-group-addon">MiB</div>
                    </div>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['downbandlimit']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_ft_settings']) AND empty($permoverview['b_virtualserver_modify_ft_settings'])}
                    -
                {else}
                    <div class="input-group">
                        <input class="form-control" type="text" name="newsettings[virtualserver_max_download_total_bandwidth]" value="{$serverinfo['virtualserver_max_download_total_bandwidth']}" />
                        <div class="input-group-addon">Byte/s</div>
                    </div>
                {/if}
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['downloadquota']}</label>
            <div class="col-sm-10">
                {if isset($permoverview['b_virtualserver_modify_ft_quotas']) AND empty($permoverview['b_virtualserver_modify_ft_quotas'])}
                    -
                {else}
                    <div class="input-group">
                        <input class="form-control" type="text" name="newsettings[virtualserver_download_quota]" value="{$serverinfo['virtualserver_download_quota']}" />
                        <div class="input-group-addon">MiB</div>
                    </div>
                {/if}
            </div>
        </div>
        <h3 class="text-center">{$lang['logs']}</h3>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['logclient']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="newsettings[virtualserver_log_client]">
                    <option value="1" {if $serverinfo['virtualserver_log_client'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                    <option value="0" {if $serverinfo['virtualserver_log_client'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['logquery']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="newsettings[virtualserver_log_query]">
                    <option value="1" {if $serverinfo['virtualserver_log_query'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                    <option value="0" {if $serverinfo['virtualserver_log_query'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['logchannel']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="newsettings[virtualserver_log_channel]">
                    <option value="1" {if $serverinfo['virtualserver_log_channel'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                    <option value="0" {if $serverinfo['virtualserver_log_channel'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['logpermissions']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="newsettings[virtualserver_log_permissions]">
                    <option value="1" {if $serverinfo['virtualserver_log_permissions'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                    <option value="0" {if $serverinfo['virtualserver_log_permissions'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['logserver']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="newsettings[virtualserver_log_server]">
                    <option value="1" {if $serverinfo['virtualserver_log_server'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                    <option value="0" {if $serverinfo['virtualserver_log_server'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['logfiletransfer']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="newsettings[virtualserver_log_filetransfer]">
                    <option value="1" {if $serverinfo['virtualserver_log_filetransfer'] == 1}selected="selected"{/if}>{$lang['yes']}</option>
                    <option value="0" {if $serverinfo['virtualserver_log_filetransfer'] == 0}selected="selected"{/if}>{$lang['no']}</option>
                </select>
            </div>
        </div>
        <div class="col-sm-12">
            <button class="btn btn-success btn-block" type="submit" name="editserver" title="{$lang['edit']}">{$lang['edit']}</button>
        </div>
    </form>
</div>