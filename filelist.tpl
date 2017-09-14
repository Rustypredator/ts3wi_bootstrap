<div class="panel-body">
    <h2 class="text-center">{if !empty($smarty.get.cid)}{$lang['channel']} ({$smarty.get.cid} {$chaninfo['channel_name']}){else}{$lang['filelist']}{/if}</h2>
</div>
<table class="table table-condensed table-hover table-striped panel-body">
    <thead>
        <tr>
            <th>{$lang['name']}</th>
            <th>{$lang['size']}</th>
            <th>{$lang['date']}</th>
            <th>{$lang['channel']}</th>
            <th>{$lang['delete']}</th>
        </tr>
    </thead>
    <tbody>
		{if $smarty.get.path != "/" AND !empty($smarty.get.path)}
			<tr>
				<td><a href="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$cid}&amp;path={$newpath}">..</a></td>
			</tr>
		{/if}
		{if !empty($getallfiles)}
			{foreach key=key item=value from=$getallfiles}	
				{if $key !== 'totalsize'}
				<tr>
					<td>{if $value['type'] == 0} <img src='gfx/images/folder.png' alt="" /> <a href="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}/{$value['name']}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}">{$value['name']}</a>{else}<img src='gfx/images/file.png' alt="" /> <a href="site/filetransfer.php?sid={$smarty.get.sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if $smarty.get.path != "/"}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;getfile=1" target="_blank">{$value['name']}</a>{/if}</td>
					<td>{$value['size']} Mb</td>
					<td>{$value['datetime']|date_format:"%d.%m.%Y - %H:%M:%S"}</td>
					<td>{$value['cname']}</td>
					<td><a href="index.php?site=filelist&amp;sid={$sid}&amp;cid={if isset($value['cid'])}{$value['cid']}{else}{$smarty.get.cid}{/if}&amp;path={if empty($smarty.get.path)}/{else}{$smarty.get.path}{/if}&amp;name={$value['name']}&amp;deletefile=1">{$lang['delete']}</a></td>
				</tr>
				{elseif $key === 'totalsize'}
				<tr>
					<td>{$lang['totalsize']}</td>
					<td>{$value} Mb</td>
				</tr>
				{/if}
			{/foreach}
		{else}
			<tr><td colspan="5" class="text-center">Keine Dateien gefunden!</td></tr>
		{/if}
    </tbody>
</table>
<div class="panel-body">
    <h2>{$lang['upload']}</h2>
    <form class="form-horizontal" enctype="multipart/form-data" method="post" action="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
        {if empty($smarty.get.cid)}
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['channel']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="cid">
                        {foreach key=key item=value from=$channellist}
                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
        {/if}
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['upload']}</label>
            <div class="col-sm-10">
                <input type="hidden" name="max_file_size" value="8388603" />
                <input class="form-control" name="thefile" type="file" />
            </div>
        </div>
        <button class="btn btn-success" type="submit" name="upload" title="{$lang['upload']}"><i class="fa fa-lg fa-upload"></i></button>
    </form>
    <h2>{$lang['createfolder']}</h2>
    <form class="form-horizontal" method="post" action="index.php?site=filelist&amp;sid={$smarty.get.sid}&amp;cid={$smarty.get.cid}&amp;cpw={$smarty.get.cpw}&amp;path={$smarty.get.path}">
        {if empty($smarty.get.cid)}
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['channel']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="cid">
                        {foreach key=key item=value from=$channellist}
                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
        {/if}
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['name']}</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" name="fname" value="" />
            </div>
        </div>
        <button class="btn btn-success" type="submit" name="createdir" title="{$lang['create']}"><i class="fa fa-lg fa-folder"></i></button>
    </form>
</div>