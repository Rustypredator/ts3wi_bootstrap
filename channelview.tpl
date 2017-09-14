{if isset($permoverview['b_channel_info_view']) AND empty($permoverview['b_channel_info_view'])}
	{include file="permerror.tpl"}
{else}
	<div class="panel-body">
        <h2 class="text-center">{$lang['channelinfo']}</h2>
    </div>
	<table class="table table-condensed table-hover table-striped panel-body">
        <thead>
            <tr>
                <th>{$lang['option']}</th>
                <th>{$lang['value']}</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>{$lang['name']}:</td>
                <td>{$channelinfo['channel_name']}</td>
            </tr>
            <tr>
                <td>{$lang['topic']}:</td>
                <td>{if isset($channelinfo['channel_topic'])}{$channelinfo['channel_topic']}{/if}</td>
            </tr>
            <tr>
                <td>{$lang['description']}:</td>
                <td>{if isset($channelinfo['channel_description'])}{$channelinfo['channel_description']}{/if}</td>
            </tr>
            <tr>
                <td>{$lang['passwordset']}:</td>
                <td>
                {if $channelinfo['channel_flag_password'] == '1'}
                    {$lang['yes']}
                {else}
                    {$lang['no']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['default']}:</td>
                <td>
                {if $channelinfo['channel_flag_default'] == '1'}
                    {$lang['yes']}
                {else}
                    {$lang['no']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['maxclients']}:</td>
                <td>
                {if $channelinfo['channel_maxclients'] == '-1'}
                    {$lang['unlimited']}
                {else}
                    {$channelinfo['channel_maxclients']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['maxfamilyclients']}:</td>
                <td>
                {if $channelinfo['channel_flag_maxfamilyclients_inherited'] == '1'}
                    {$lang['inherited']}
                {elseif $channelinfo['channel_flag_maxfamilyclients_unlimited'] == '1'}
                    {$lang['unlimited']}
                {else}
                    {$channelinfo['channel_maxfamilyclients']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['codec']}:</td>
                <td>
                {if $channelinfo['channel_codec'] == '0'}
                    {$lang['codec0']}
                {elseif $channelinfo['channel_codec'] == '1'}
                    {$lang['codec1']}
                {elseif $channelinfo['channel_codec']=='2'}
                    {$lang['codec2']}
                {elseif $channelinfo['channel_codec']=='3'}
                    {$lang['codec3']}
                {elseif $channelinfo['channel_codec']=='4'}
                    {$lang['codec4']}
                {elseif $channelinfo['channel_codec']=='5'}
                    {$lang['codec5']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['codecquality']}:</td>
                <td>{$channelinfo['channel_codec_quality']}</td>
            </tr>
            <tr>
                <td>{$lang['codecunencrypted']}</td>
                <td>
                {if $channelinfo['channel_codec_is_unencrypted']=='1'}
                {$lang['yes']}
                {elseif $channelinfo['channel_codec_is_unencrypted']=='0'}
                {$lang['no']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['neededtalkpower']}:</td>
                <td>{$channelinfo['channel_needed_talk_power']}</td>
            </tr>
            <tr>
                <td>{$lang['forcedsilence']}:</td>
                <td>
                {if $channelinfo['channel_forced_silence'] == '1'}
                    {$lang['yes']}
                {else}
                    {$lang['no']}
                {/if}
                </td>
            </tr>
            <tr>
                <td>{$lang['iconid']}</td>
                <td>{$channelinfo['channel_icon_id']}</td>
            </tr>
            <tr>
                <td>{$lang['phoneticname']}</td>
                <td>{if isset($channelinfo['channel_name_phonetic'])}{$channelinfo['channel_name_phonetic']}{/if}</td>
            </tr>
        </tbody>
	</table>
    <div class="panel-body">
        <a class="btn btn-success btn-block" href="index.php?site=channeledit&cid={$cid}&sid={$sid}">{$lang['channel']} {$lang['edit']}</a>
    </div>
{/if}