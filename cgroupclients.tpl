{if isset($permoverview['b_virtualserver_channelgroup_client_list']) AND empty($permoverview['b_virtualserver_channelgroup_client_list'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <form class="form-inline" method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
            <label class="label-control">{$lang['searchfor']}{$lang['client']}</label>
            <div class="input-group">
                <div class="input-group-addon">
                    <select name="searchby">
                        <option value="cldbid">{$lang['cldbid']}</option>
                        <option value="name">{$lang['name']}</option>
                    </select>
                </div>
                <input class="form-control" type="text" name="search" value="" />
                <div class="input-group-btn">
                    <button class="btn btn-success" type="submit" name="sendsearch"><i class="fa fa-lg fa-search"></i>&nbsp;{$lang['search']}</button>
                </div>
            </div>
        </form>
    </div>
    <div class="panel-body">
        <h2>({$cgroupid}) {$cgroupname} {$lang['groupmember']}</h2>
    </div>
	<table class="table table-condensed table-hover table-striped panel-body">
        <thead>
            <tr>
                <th>{$lang['channelid']}</th>
                <th>{$lang['channelname']}</th>
                <th>{$lang['clientdbid']}</th>
                <th>{$lang['clientname']}</th>
                <th>{$lang['created']}</th>
                <th>{$lang['lastonline']}</th>
                <th>{$lang['option']}</th>
            </tr>
        </thead>
		{if !empty($groupclients)}
            <tbody>
                {foreach key=key item=value from=$groupclients}
                    <tr>
                        <td>{$value['cid']}</td>
                        <td>{secure($value['channel_name'])}</td>
                        <td>{$value['cldbid']}</td>
                        <td>{secure($value['client_nickname'])}</td>
                        <td>{$value['client_created']}</td>
                        <td>{$value['client_lastconnected']}</td>
                        <td>
                            <form method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
                                <input type="hidden" name="cid" value="{$value['cid']}" />
                                <input type="hidden" name="cldbid" value="{$value['cldbid']}" />
                                <div class="input-group">
                                    <select class="form-control" name="cgid">
                                        {foreach key=key2 item=value2 from=$channelgroups}
                                            {if $value2['cgid'] != $cgroupid AND $value2['type'] != '0'}
                                                <option value="{$value2['cgid']}">({$value2['cgid']}){$value2['name']}</option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                    <div class="input-group-btn"><button class="btn btn-default" type="submit" name="switchgroup"><i class="fa fa-lg fa-exchange"></i>&nbsp;{$lang['switch']}</button></div>
                                </div>
                            </form>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
		{/if}
	</table>
    <div class="panel-body">
        <h2>{$lang['addclient']}</h2>
        <form class="form-horizontal" method="post" action="index.php?site=cgroupclients&amp;sid={$sid}&amp;cgid={$cgid}">
            <div class="form-group">
                <label class="label-control col-md-2" for="cid">{$lang['channel']}</label>
                <div class="col-md-10">
                    <select class="form-control" name="cid">
                        {foreach key=key item=value from=$channellist}
                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-md-2" for="cid">{$lang['cldbid']}</label>
                <div class="col-md-10">
                    <input class="form-control" type="text" name="cldbid" value="" />
                </div>
            </div>
            <button class="btn btn-success" type="submit" name="addclient"><i class="fa fa-lg fa-plus"></i>&nbsp;{$lang['add']}</button>
        </form>
    </div>
{/if}