<div class="panel-body">
    <h2 class="text-center">{$lang['iconupload']}</h2>
    <p>
        {$lang['iconupinfo']}
    </p>
    <form class="form-horizontal" enctype="multipart/form-data" action="index.php?site=fileupload&amp;sid={$sid}" method="post">
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['iconupload']}</label>
            <div class="col-sm-10">
                <input type="hidden" name="max_file_size" value="81920" />
                <input class="form-control" name="thefile" type="file" />
            </div>
        </div>
        <button class="btn btn-success" type="submit" name="upload" title="{$lang['iconupload']}"><i class="fa fa-lg fa-upload"></i></button>
    </form>
</div>
<form method="post" action="index.php?site=fileupload&amp;sid={$sid}">
	<table id="2" class="table table-condensed table-hover table-striped">
        <thead>
            <tr>
                <th>{$lang['icon']}</th>
                <th>{$lang['name']}</th>
                <th>{$lang['id']}</th>
                <th>Ma&szlig;e</th>
                <th>Type</th>
                {$lang['delete']} {$lang['selectall']}<input type="checkbox" name="checkall" value="0" onclick="check(2)" /></th>
            </tr>
        </thead>
        <tbody>
            {foreach key=key item=value from=$allicons}
                <tr>
                    <td><img style="border:0"src="site/showfile.php?name=icon_{$value.name}&amp;port={$port}" alt="" /></td>
                    <td>{$key}</td>
                    <td>{$value.id}</td>
                    <td>{$value.info.0}*{$value.info.1}</td>
                    <td>
                        {if $value.info.2 == 1}
                            .gif
                        {elseif $value.info.2 == 2}
                            .jpg
                        {elseif $value.info.2 == 3}
                            .png
                        {/if}
                    </td>
                    <td><input type="checkbox" id="list{$value['virtualserver_id']}" name="delicons[]" value="/{$key}" /></td>
                </tr>
            {/foreach}
        </tbody>
	</table>
    <div class="panel-body"><button class="btn btn-danger btn-block" type="submit" name="delaction" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i>&nbsp;{$lang['selected']}&nbsp;{$lang['delete']}</div>
</form>