<div class="panel-body">
    <h2 class="text-center">{$lang['temppw']}</h2>
</div>
<table class="table table-condensed table-hover table-striped panel-body">
    <thead>
        <tr>
            <th>Nickname</th>
            <th>Uid</th>
            <th>Desc</th>
            <th>Passwort</th>
            <th>Start</th>
            <th>Ende</th>
            <th>Channel</th>
            <th>Option</th>
        </tr>
    </thead>
    {if !empty($temppwlist)}
        <tbody>
            {foreach key=id item=temppw from=$temppwlist}
                <tr>
                    <td>{$temppw.nickname}</td>
                    <td>{$temppw.uid}</td>
                    <td>{$temppw.desc}</td>
                    <td>{$temppw.pw_clear}</td>
                    <td>{$temppw.start}</td>
                    <td>{$temppw.end}</td>
                    <td>{$temppw.tcid}</td>
                    <td>
                        <form method="post" action="index.php?site=temppw&amp;sid={$sid}">
                            <input name="pw" value="{$temppw.pw_clear}" type="hidden">
                            <button class="btn btn-danger" type="submit" name="temppwdel" title="{$lang['delete']}"><i class="fa fa-lg fa-trash"></i></button>
                        </form>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    {/if}
</table>
<div class="panel-body">
    <h3 class="center">{$lang['create']} {$lang['temppw']}</h3>
    <form class="form-horizontal" method="post" action="index.php?site=temppw&amp;sid={$sid}">
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['password']}</label>
            <div class="col-sm-10"><input class="form-control" type="text" name="password" value="" /></div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['duration']}</label>
            <div class="col-sm-10"><input class="form-control" type="text" name="duration" value="" /></div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['description']}</label>
            <div class="col-sm-10"><input class="form-control" type="text" name="description" value="" /></div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['channel']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="tcid">
                    {foreach key=id item=channel from=$channellist}
                        <option value="{$channel.cid}">{$channel.channel_name}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="col-sm-12">
            <button class="btn btn-success btn-block" type="submit" name="create" title="{$lang['create']}"><i class="fa fa-lg fa-magic"></i>&nbsp;{$lang['create']}</button>
        </div>
    </form>
</div>