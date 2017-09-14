{if isset($permoverview['b_virtualserver_servergroup_create']) AND empty($permoverview['b_virtualserver_servergroup_create'])}
	{include file="permerror.tpl"}
{else}
	<div class="panel-body">
        <h2 class="text-center">{$lang['addservergroup']}</h2>
        <form class="form-horizontal" method="post" action="index.php?site=sgroupadd&amp;sid={$sid}">
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['type']}</label>
                <div class="col-sm-10">
                    <input type="radio" name="type" value="0" />{$lang['template']}<br/>
                    <input checked="checked" type="radio" name="type" value="1" />{$lang['normal']}<br/>
                    <input type="radio" name="type" value="2" />{$lang['query']}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['name']}</label>
                <div class="col-sm-10"><input class="form-control" type="text" name="name" value="" /></div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['copypermsfrom']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="copyfrom">
                        <option value="0">-</option>
                        {foreach key=key item=value from=$servergroups}
                            <option value="{$value['sgid']}">{$value['name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['overwritegroup']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="overwrite">
                        <option value="0">-</option>
                        {foreach key=key item=value from=$servergroups}
                            <option value="{$value['sgid']}">{$value['name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="col-sm-12">
                <button class="btn btn-success btn-block" type="submit" name="addgroup" value="{$lang['add']}"><i class="fa fa-lg fa-plus"></i>&nbsp;{$lang['add']}</button>
            </div>
        </form>
    </div>
{/if}