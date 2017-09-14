{if isset($permoverview['b_virtualserver_client_list']) AND empty($permoverview['b_virtualserver_client_list']) OR isset($permoverview['b_virtualserver_client_dblist']) AND empty($permoverview['b_virtualserver_client_dblist'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h2 class="text-center">{$lang['clientcounter']}</h2>
    </div>
    <table class="table table-condensed table-hover table-striped panel-body">
        <tbody>
            <tr>
                <td>{$lang['total']}</td>
                <td>{$totalclients} {$lang['clients']}</td>
            </tr>
            <tr>
                <td>{$lang['online']}</td>
                <td>
                    <img src="templates/default/gfx/images/stats.png"  height="10" width="{$perc_online}" alt="" />
                    {$count_online} {$lang['clients']} | {$perc_online}%
                </td>
            </tr>
            <tr>
                <td>{$lang['today']}</td>
                <td>
                    <img src="templates/default/gfx/images/stats.png"  height="10" width="{$perc_today}" alt="" />
                    {$count_today} {$lang['clients']} | {$perc_today}%
                </td>
            </tr>
            <tr>
                <td>{$lang['thisweek']}</td>
                <td>
                    <img src="templates/default/gfx/images/stats.png"  height="10" width="{$perc_week}" alt="" />
                    {$count_week} {$lang['clients']} | {$perc_week}%
                </td>
            </tr>
            <tr>
                <td>{$lang['thismonth']}</td>
                <td>
                    <img src="templates/default/gfx/images/stats.png"  height="10" width="{$perc_month}" alt="" />
                    {$count_month} {$lang['clients']} | {$perc_month}%
                </td>
            </tr>
        </tbody>
    </table>
{/if}