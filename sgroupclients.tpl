{if isset($permoverview['b_virtualserver_servergroup_client_list']) AND empty($permoverview['b_virtualserver_servergroup_client_list'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h3>{$lang['searchfor']}{$lang['client']}</h3>
        <form class="form-inline" method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
            <div class="input-group">
                <div class="input-group-addon">
                    <select name="searchby">
                        <option value="cldbid">{$lang['cldbid']}</option>
                        <option value="name">{$lang['name']}</option>
                    </select>
                </div>
                <input class="form-control" type="text" name="search"/>
                <div class="input-group-btn"><button class="btn btn-success" type="submit" name="sendsearch" title="{$lang['search']}"><i class="fa fa-lg fa-search"></i>&nbsp;{$lang['search']}</button></div>
            </div>
        </form>
    </div>
    <div class="panel-body"><h3>({$sgroupid}) {$sgroupname} {$lang['groupmember']}</h3></div>
    <table class="table table-condensed table-hover table-striped panel-body">
        <thead>
            <tr>
                <th>{$lang['uniqueid']}</th>
                <th>{$lang['dbid']}</th>
                <th>{$lang['name']}</th>
                <th>{$lang['created']}</th>
                <th>{$lang['lastonline']}</th>
                <th>{$lang['option']}</th>
            </tr>
        </thead>
        {if !empty($groupclients)}
            <tbody>
                {foreach key=key item=value from=$groupclients}
                    <tr>
                        <td>{$value['client_unique_identifier']}</td>
                        <td>{$value['cldbid']}</td>
                        <td>{secure($value['client_nickname'])}</td>
                        <td>{date("d.m.Y", $value['client_created'])}</td>
                        <td>{date("d.m.Y", $value['client_lastconnected'])}</td>
                        <td>
                            <form method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
                                <input type="hidden" name="cldbid" value="{$value['cldbid']}" />
                                <button type="submit" class="btn btn-danger btn-block" name="kickclient" title="kick"><i class="fa fa-lg fa-trash"></i>&nbsp;{$lang['kick']}</button>
                            </form>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        {/if}
    </table>
    <div class="panel-body">
        <h3>{$lang['addclient']}</h3>
        <form class="form-inline" method="post" action="index.php?site=sgroupclients&amp;sid={$sid}&amp;sgid={$sgid}">
            <div class="input-group">
                <div class="input-group-addon">{$lang['cldbid']}</div>
                <input class="form-control" type="text" name="cldbid" value="" />
                <div class="input-group-btn"><button class="btn btn-success" type="submit" name="addclient" title="{$lang['add']}"><i class="fa fa-lg fa-plus"></i>&nbsp;{$lang['add']}</button></div>
            </div>
        </form>
    </div>
{/if}