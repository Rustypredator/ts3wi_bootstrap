{if isset($permoverview['b_virtualserver_channelgroup_create']) AND empty($permoverview['b_virtualserver_channelgroup_create'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h2>{$lang['addchannelgroup']}</h2>
        <form class="form-horizontal" method="post" action="index.php?site=cgroupadd&amp;sid={$sid}">
            <div class="form-group">
                <label class="col-sm-2 label-control" for="type">{$lang['type']}</label>
                <div class="col-sm-10">
                    <input type="radio" name="type" value="0" />{$lang['template']}<br/>
                    <input checked="checked" type="radio" name="type" value="1" />{$lang['normal']}
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="name">{$lang['name']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="name" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="copyfrom">{$lang['copypermsfrom']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="copyfrom">
                        <option value="0">-</option>
                        {foreach key=key item=value from=$channelgroups}
                            <option value="{$value['cgid']}">{$value['name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="overwrite">{$lang['overwritegroup']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="overwrite">
                        <option value="0">-</option>
                        {foreach key=key item=value from=$channelgroups}
                            <option value="{$value['cgid']}">{$value['name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <button class="btn btn-success" type="submit" name="addgroup">{$lang['add']}</button>
        </form>
    </div>
{/if}