{if isset($permoverview['b_client_complain_list']) AND empty($permoverview['b_client_complain_list'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h2 class="text-center">{$lang['complainlist']}</h2>
    </div>
    <table class="table table-condensed table-hover table-striped panel-body">
        <thead>
            <tr>
                <th>{$lang['targetnick']}</th>
                <th>{$lang['sourcenick']}</th>
                <th>{$lang['reason']}</th>
                <th>{$lang['option']}</th>
            </tr>
        </thead>
        <tbody>
            {assign var=i value="1"}
            {foreach key=key item=value from=$newcomplainlist}
                {foreach key=key2 item=value2 from=$value}
                    <tr>
                        <td><a href="javascript:Klappen('{$i}')"><img src="gfx/images/plus.png" id="Pic{$i}" border="0" alt="aus/ein-klappen" /></a> {$key2}</td>
                        <td>&nbsp;</td>
                        <td>{sprintf($lang['countcomplain'], count($value2))}</td>
                        <td>
                            {if !isset($permoverview['b_client_complain_delete']) OR $permoverview['b_client_complain_delete'] == 1}
                                <form method="post" action="index.php?site=complainlist&amp;sid={$sid}">
                                    <input type="hidden" name="tcldbid" value="{$key}" />
                                    <button class="btn btn-danger" type="submit" name="delall" title="{$lang['delall']}"><i class="fa fa-lg fa-trash"></i></button>
                                </form>
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <table class="table table-condensed table-hover table-striped" id="Lay{$i}">
                                <thead>
                                    <tr>
                                        <th>{$lang['time']}</th>
                                        <th>{$lang['sourcenick']}</th>
                                        <th>{$lang['reason']}</th>
                                        <th>{$lang['option']}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach key=key3 item=value3 from=$value2}
                                        <tr>
                                            <td>{date("d.m.Y - H:i", $value3['timestamp'])}</td>
                                            <td>{secure($value3['fname'])}</td>
                                            <td>{secure($value3['message'])}</td>
                                            <td>
                                                {if !isset($permoverview['b_client_complain_delete']) OR $permoverview['b_client_complain_delete'] == 1}
                                                    <form method="post" action="index.php?site=complainlist&amp;sid={$sid}">
                                                        <input type="hidden" name="tcldbid" value="{$key}" />
                                                        <input type="hidden" name="fcldbid" value="{$key3}" />
                                                        <button class="btn btn-danger" type="submit" name="delete" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                                                    </form>
                                                {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </td>
                    </tr>
                {/foreach}
                {assign var=i value="`$i+1`"}
            {/foreach}
        </tbody>
    </table>
{/if}