{if isset($permoverview['b_virtualserver_log_view']) AND empty($permoverview['b_virtualserver_log_view'])}
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <i class="fa fa-lg fa-times-circle"></i>&nbsp;<strong>{$lang['error']}</strong><br/>{$lang['nopermissions']}
    </div>
{else}
    <table class="table table-striped table-hover table-sm">
        <thead>
            <tr>
                <form method="post" action="index.php?site=logview&amp;sid={$sid}">
                    <input type="hidden" name="boottheme" value="{$boostraptheme}"/>
                    <input type="hidden" name="begin_pos" value="{$begin_pos}"/>
                    <input class="btn btn-success" type="submit" name="showmore" value="{$lang['showmoreentrys']}" />
                </form>
            </tr>
            <tr>
                <th>{$lang['date']}</th>
                <th>{$lang['level']}</th>
                <th>{$lang['type']}</th>
                <th>{$lang['serverid']}</th>
                <th>{$lang['message']}</th>
            </tr>
        </thead>
    {if !empty($serverlog)}
        <tbody>
            {foreach key=key item=value from=$serverlog}
                {if empty($smarty.post.type.error) AND empty($smarty.post.type.warning) AND empty($smarty.post.type.debug) AND empty($smarty.post.type.info) OR $smarty.post.type.error == $value['level'] OR $smarty.post.type.warning == $value['level'] OR $smarty.post.type.debug == $value['level'] OR $smarty.post.type.info == $value['level']}
                    {if $change_col % 2} {assign var=td_col value="green1"} {else} {assign var=td_col value="green2"} {/if}
                    <tr>
                        <td class="{$td_col}">{$value[0]}</td>
                        <td class="{$td_col}">{$value[1]}</td>
                        <td class="{$td_col}">{$value[2]}</td>
                        <td class="{$td_col}">{$value[3]}</td>
                        <td class="{$td_col}">{$value[4]}</td>
                    </tr>

                    {assign var=change_col value="`$change_col+1`"}
                {/if}
            {/foreach}
        </tbody>
    {/if}
        <tfoot>
            <tr>
                <td>
                    <form method="post" action="index.php?site=logview&amp;sid={$sid}">
                        <input type="hidden" name="boottheme" value="{$boostraptheme}"/>
                        <input type="hidden" name="begin_pos" value="{$begin_pos}"/>
                        <input class="btn btn-success" type="submit" name="showmore" value="{$lang['showmoreentrys']}" />
                    </form>
                </td>
            </tr>
        </tfoot>
    </table>
{/if}