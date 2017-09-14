{if isset($permoverview['b_virtualserver_token_list']) AND empty($permoverview['b_virtualserver_token_list'])}
	{include file="permerror.tpl"}
{else}
    <div class="panel-body"><h2 class="text-center">{$lang['tokenlist']}</h2></div>
	<form method="post" action="index.php?site=token&amp;sid={$sid}">
		<table class="table table-condensed table-hover table-striped panel-body">
            <thead>
                <tr>
                    <th>{$lang['token']}</th>
                    <th>{$lang['type']}</th>
                    <th>{$lang['id1']}</th>
                    <th>{$lang['id2']}</th>
                    <th>{$lang['created']}</th>
                    <th>{$lang['description']}</th>
                    <th>{$lang['selectall']}&nbsp;<input type="checkbox" name="checkall" value="0" onclick="check(1)" /></th>
                </tr>
            </thead>
            {if !empty($tokenlist)}
                <tbody>
                    {foreach key=key item=value from=$tokenlist}
                        <tr>
                            <td>{$value['token']}</td>
                            <td>
                                {if $value['token_type']==0}
                                    {$lang['servergroup']}
                                {elseif $value['token_type'] == 1}
                                    {$lang['channelgroup']}
                                {/if}
                            </td>
                            <td>
                                {if $value['token_type'] == 0}
                                    {foreach key=key2 item=value2 from=$sgrouplist}
                                        {if $value2['sgid'] == $value['token_id1']}
                                            {$value2['name']}
                                        {/if}
                                    {/foreach}
                                {elseif $value['token_type'] == 1}
                                    {foreach key=key2 item=value2 from=$cgrouplist}
                                        {if $value2['cgid'] == $value['token_id1']}
                                            {$value2['name']}
                                        {/if}
                                    {/foreach}
                                {/if}
                            </td>
                            <td>
                                {if $value['token_type']==1}
                                    {foreach key=key2 item=value2 from=$channellist}
                                        {if $value2['cid'] == $value['token_id2']}
                                            {$value2['channel_name']}
                                        {/if}
                                    {/foreach}
                                {/if}
                            </td>
                            <td>{$value['token_created']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
                            <td>{$value['token_description']}</td>
                            <td>
                                {if !isset($permoverview['b_virtualserver_token_delete']) OR $permoverview['b_virtualserver_token_delete']==1}
                                    <input type="checkbox" name="token[]" value="{$value['token']}" />
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                    <tr><td colspan="7"><button class="btn btn-danger pull-right" type="submit" name="deltoken" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i>&nbsp;{$lang['delete']}&nbsp;{$lang['selected']}</button></td></tr>
                </tbody>
            {/if}
		</table>
	</form>
{/if}
{if isset($permoverview['b_virtualserver_token_add']) AND empty($permoverview['b_virtualserver_token_add'])}
	{include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h3>{$lang['createtoken']}</h3>
        <form class="form-inline" method="post" action="index.php?site=token&amp;sid={$sid}">
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['type']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="tokentype" onchange="hide_select(this.value)">
                        <option value="">{$lang['type']}</option>
                        <option value="0">(0){$lang['servergroup']}</option>
                        <option value="1">(1){$lang['channelgroup']}</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['groups']}</label>
                <div class="col-sm-10">
                    <select class="form-control" id="servergroups" style="display:none" name="tokenid1_1">
                        <optgroup label="{$lang['servergroups']}">
                            {foreach key=key item=value from=$sgrouplist}
                                {if $value['type'] != 0}
                                    <option value="{$value['sgid']}">({$value['sgid']}) {$value['name']}</option>
                                {/if}
                            {/foreach}
                        </optgroup>
                    </select>
                    <select class="form-control" id="channelgroups" style="display:none" name="tokenid1_2">
                        <optgroup label="{$lang['channelgroups']}">
                            {foreach key=key item=value from=$cgrouplist}
                                {if $value['type'] != 0}
                                    <option value="{$value['cgid']}">({$value['cgid']}) {$value['name']}</option>
                                {/if}
                            {/foreach}
                        </optgroup>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['channel']}</label>
                <div class="col-sm-10">
                    <select class="form-control" id="channel" style="display:none" name="tokenid2">
                        <option value="0">{$lang['channel']}</option>
                        {foreach key=key item=value from=$channellist}
                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['description']}</label>
                <div class="col-sm-10"><input class="form-control" type="text" name="description" value="" /></div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['number']}</label>
                <div class="col-sm-10"><input class="form-control" type="text" name="number" size="3" value="1" /></div>
            </div>
            <button class="btn btn-success" type="submit" name="addtoken" title="{$lang['create']}"><i class="fa fa-lg fa-magic"></i>&nbsp;{$lang['create']}</button>
        </form>
    </div>
{/if}