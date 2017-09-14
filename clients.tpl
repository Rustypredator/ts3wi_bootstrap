{if isset($permoverview['b_virtualserver_client_list']) AND empty($permoverview['b_virtualserver_client_list']) OR isset($permoverview['b_virtualserver_client_dblist']) AND empty($permoverview['b_virtualserver_client_dblist'])}
	{include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <form class="form-inline" method="post" action="index.php?site=clients&amp;sid={$sid}">
            <label class="label-control col-sm-2">{$lang['searchfor']}{$lang['client']}</label>
            <div class="col-sm-10">
                <div class="input-group">
                    <div class="input-group-addon">
                        <select name="searchby">
                            <option value="uniqueid">{$lang['uniqueid']}</option>
                            <option value="cldbid">{$lang['cldbid']}</option>
                            <option value="name">{$lang['name']}</option>
                        </select>
                    </div>
                    <input class="form-control" type="text" name="search" value="" />
                    <div class="input-group-btn"><button class="btn btn-success" type="submit" name="sendsearch" title="{$lang['search']}"><i class="fa fa-lg fa-search"></i>{$lang['search']}</button></div>
                </div>
            </div>
        </form>
    </div>

    {$lang['clients']}
    {if $pages!=0}
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            {while $print_pages <= $pages}
                {if $print_pages == 1}
                    <li><a href="index.php?site=clients&amp;sid={$sid}&amp;getstart=0{if isset($smarty.get.sortby)}&amp;sortby={$smarty.get.sortby}{/if}{if isset($smarty.get.sorttype)}&amp;sorttype={$smarty.get.sorttype}{/if}">{$print_pages}</a></li>
                {else}
                    <li><a href="index.php?site=clients&amp;sid={$sid}&amp;getstart={$countstarted}{if isset($smarty.get.sortby)}&amp;sortby={$smarty.get.sortby}{/if}{if isset($smarty.get.sorttype)}&amp;sorttype={$smarty.get.sorttype}{/if}">{$print_pages}</a></li>
                {/if}
                {assign var=countstarted value="`$countstarted+$duration`"}
                {assign var=print_pages value="`$print_pages+1`"}
            {/while}
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
{/if}
<table class="table table-condensed table-hover table-striped panel-body">
    <thead>
    <th><a class="" href="index.php?site=clients&amp;sid={$sid}&amp;sortby=cldbid&amp;sorttype={if $sortby == 'cldbid' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['dbid']}</a>&nbsp;{if $sortby == "cldbid"}<i class="fa fa-lg fa-sort-{$sorttype}"></i>{/if}</th>
        <th><a class="" href="index.php?site=clients&amp;sid={$sid}&amp;sortby=unique&amp;sorttype={if $sortby == 'client_unique_identifier' AND $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['uniqueid']}</a>&nbsp;{if $sortby == "uniqueid"}<i class="fa fa-lg fa-sort-{$sorttype}"></i>{/if}</th>
        <th><a class="" href="index.php?site=clients&amp;sid={$sid}&amp;sortby=name&amp;sorttype={if $sortby == 'client_nickname' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['nickname']}</a>&nbsp;{if $sortby == "nickname"}<i class="fa fa-lg fa-sort-{$sorttype}"></i>{/if}</th>
        <th><a class="" href="index.php?site=clients&amp;sid={$sid}&amp;sortby=created&amp;sorttype={if $sortby == 'client_created' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['created']}</a>&nbsp;{if $sortby == "created"}<i class="fa fa-lg fa-sort-{$sorttype}"></i>{/if}</th>
        <th><a class="" href="index.php?site=clients&amp;sid={$sid}&amp;sortby=lastcon&amp;sorttype={if $sortby == 'client_lastconnected' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['lastonline']}</a>&nbsp;{if $sortby == "lastonline"}<i class="fa fa-lg fa-sort-{$sorttype}"></i>{/if}</th>
        <th><a class="" href="index.php?site=clients&amp;sid={$sid}&amp;sortby=status&amp;sorttype={if $sortby == 'clid' AND $sorttype == $smarty.const.SORT_ASC}desc{else}asc{/if}">{$lang['status']}</a>&nbsp;{if $sortby == "status"}<i class="fa fa-lg fa-sort-{$sorttype}"></i>{/if}</th>
        <th>{$lang['option']}</th>
    </thead>
    <tbody>
        {while $showclients <= $duration AND isset($clientdblist[$getstart])}
            <tr>
                <td>{$clientdblist[$getstart]['cldbid']}</td>
                <td>{$clientdblist[{$getstart}]['client_unique_identifier']}</td>
                <td>{$clientdblist[{$getstart}]['client_nickname']}</td>
                <td>{$clientdblist[{$getstart}]['client_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                <td>{$clientdblist[{$getstart}]['client_lastconnected']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                <td>
                    {if isset($clientdblist[{$getstart}]['clid'])}
                        <span class="label label-success">{$lang['online']}</span>
                    {else}
                        <span class="label label-danger">{$lang['offline']}</span>
                    {/if}
                </td>
                <td>
                    <form method="post" action="index.php?site=cleditperm&amp;sid={$sid}&amp;cldbid={$clientdblist[{$getstart}]['cldbid']}">
                        <button class="btn btn-success" type="submit" name="editperms" title="{$lang['editperms']}"><i class="fa fa-lg fa-edit"></i></button>
                    </form>
                    {if !isset($permoverview['b_client_delete_dbproperties']) OR $permoverview['b_client_delete_dbproperties'] == 1}
                        <form method="post" action="index.php?site=clients&amp;sid={$sid}">
                            <input type="hidden" name="cldbid" value="{$clientdblist[{$getstart}]['cldbid']}" />
                            <button class="btn btn-danger" type="submit" name="clientdel" title="{$lang['delete']}" onclick="return confirm('{$lang['deletemsgclient']}')"><i class="fa fa-lg fa-trash"></i></button>
                        </form>
                    {/if}
                </td>
            </tr>
            {assign var=showclients value="`$showclients+1`"}
            {assign var=getstart value="`$getstart+1`"}
        {/while}
    </tbody>
</table>
{/if}