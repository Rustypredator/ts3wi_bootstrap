{if !isset($sid)}
	<!--InstanzTraffic-->
	{if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
	<meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic" />
	{/if}
	<table class="table table-sm table-striped table-hover panel-body">
        <thead>
            <tr>
                <th colspan="3">{$lang['instancetraffic']}</th>
            </tr>
        </thead>
		<tbody>
            <tr>
                <td style="width:33%" class="thead">{$lang['description']}</td>
                <td style="width:33%" class="thead">{$lang['incoming']}</td>
                <td style="width:33%" class="thead">{$lang['outgoing']}</td>
            </tr>
            <tr>
                <td class="green1">{$lang['packetstransfered']}</td>
                <td class="green1 center">{$hostinfo['connection_packets_received_total']}</td>
                <td class="green1 center">{$hostinfo['connection_packets_sent_total']}</td>
            </tr>
            <tr>
                <td class="green2">{$lang['bytestransfered']}</td>
                <td class="green2 center">{$hostinfo['connection_bytes_received_total']}</td>
                <td class="green2 center">{$hostinfo['connection_bytes_sent_total']}</td>
            </tr>
            <tr>
                <td class="green1">{$lang['bandwidthlastsecond']}</td>
                <td class="green1 center">{$hostinfo['connection_bandwidth_received_last_second_total']} /s</td>
                <td class="green1 center">{$hostinfo['connection_bandwidth_sent_last_second_total']} /s</td>
            </tr>
            <tr>
                <td class="green2">{$lang['bandwidthlastminute']}</td>
                <td class="green2 center">{$hostinfo['connection_bandwidth_received_last_minute_total']} /s</td>
                <td class="green2 center">{$hostinfo['connection_bandwidth_sent_last_minute_total']} /s</td>
            </tr>
            <tr>
                <td class="green1">{$lang['filetransferbandwidth']}</td>
                <td class="green1 center">{$hostinfo['connection_filetransfer_bandwidth_received']} /s</td>
                <td class="green1 center">{$hostinfo['connection_filetransfer_bandwidth_sent']} /s</td>
            </tr>
            <tr>
                <td colspan="3">
                    {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
                        <a class="btn btn-warning btn-block" href="index.php?site=servertraffic&amp;refresh=off">{$lang['stoprefresh']}</a>
                    {else}
                        <a class="btn btn-success btn-block" href="index.php?site=servertraffic&amp;refresh=on">{$lang['autorefresh']}</a>
                    {/if}
                </td>
            </tr>
        </tbody>
	</table>
{else}
    <!--VServerTraffic-->
	{if isset($permoverview['b_virtualserver_info_view']) AND empty($permoverview['b_virtualserver_info_view'])}
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <i class="fa fa-lg fa-times-circle"></i>&nbsp;<strong>{$lang['error']}</strong><br/>{$lang['nopermissions']}
        </div>
	{else}
	    {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
		    <meta http-equiv="refresh" content="3; URL=index.php?site=servertraffic&amp;sid={$sid}" />
	    {/if}
        <table class="table table-sm table-hover table-striped panel-body">
            <tr>
                <td style="width:100%" class="thead" colspan="3">{$lang['virtualtraffic']}</td>
            </tr>
            <tr>
                <td style="width:33%" class="thead">{$lang['description']}</td>
                <td style="width:33%" class="thead">{$lang['incoming']}</td>
                <td style="width:33%" class="thead">{$lang['outgoing']}</td>
            </tr>
            <tr>
                <td class="green1">{$lang['packetstransfered']}</td>
                <td class="green1 center">{$serverinfo['connection_packets_received_total']}</td>
                <td class="green1 center">{$serverinfo['connection_packets_sent_total']}</td>
            </tr>
            <tr>
                <td class="green2">{$lang['bytestransfered']}</td>
                <td class="green2 center">{$serverinfo['connection_bytes_received_total']}</td>
                <td class="green2 center">{$serverinfo['connection_bytes_sent_total']}</td>
            </tr>
            <tr>
                <td class="green1">{$lang['bandwidthlastsecond']}</td>
                <td class="green1 center">{$serverinfo['connection_bandwidth_received_last_second_total']} /s</td>
                <td class="green1 center">{$serverinfo['connection_bandwidth_sent_last_second_total']} /s</td>
            </tr>
            <tr>
                <td class="green2">{$lang['bandwidthlastminute']}</td>
                <td class="green2 center">{$serverinfo['connection_bandwidth_received_last_minute_total']} /s</td>
                <td class="green2 center">{$serverinfo['connection_bandwidth_sent_last_minute_total']} /s</td>
            </tr>
            <tr>
                <td class="green1">{$lang['filetransferbandwidth']}</td>
                <td class="green1 center">{$serverinfo['connection_filetransfer_bandwidth_received']} /s</td>
                <td class="green1 center">{$serverinfo['connection_filetransfer_bandwidth_sent']} /s</td>
            </tr>
            <tr>
                <td colspan="3">
                    {if !isset($smarty.get.refresh) OR $smarty.get.refresh == on}
                        <a class="btn btn-warning btn-block" href="index.php?site=servertraffic&amp;sid={$sid}&amp;refresh=off">{$lang['stoprefresh']}</a>
                    {else}
                        <a class="btn btn-success btn-block" href="index.php?site=servertraffic&amp;sid={$sid}&amp;refresh=on">{$lang['autorefresh']}</a>
                    {/if}
                </td>
            </tr>
        </table>
    {/if}
{/if}