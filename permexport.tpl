<div class="panel-body">
    <h2 class="text-center">{$lang['permexport']}</h2>
    <p>{$lang['permexdesc']}</p>
</div>
<div class="panel-body">
    <form class="form-horizontal" method="post" action="index.php?site=permexport&amp;sid={$sid}">
        <div class="form-group">
            <label class="label-control col-sm-2" for="">{$lang['sourcetype']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="sourcemode">
                    <option value="1">{$lang['servergroup']}</option>
                    <option value="2">{$lang['channelgroup']}</option>
                    <option value="3">{$lang['channel']}</option>
                    <option value="4">{$lang['client']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2" for="">{$lang['sourceid']}</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" name="sourceid" value="" />
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2" for="">{$lang['targettype']}</label>
            <div class="col-sm-10">
                <select class="form-control" name="targetmode">
                    <option value="1">{$lang['servergroup']}</option>
                    <option value="2">{$lang['channelgroup']}</option>
                    <option value="3">{$lang['channel']}</option>
                    <option value="4">{$lang['client']}</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="label-control col-sm-2" for="">{$lang['targetid']}</label>
            <div class="col-sm-10">
                <input class="form-control" type="text" name="targetid" value="" />
            </div>
        </div>
        <div class="col-sm-12">
            <button class="btn btn-success btn-block" type="submit" name="showcommands" label="{$lang['view']}"><i class="fa fa-lg fa-eye"></i>{$lang['view']}</button>
        </div>
    </form>
    {if isset($smarty.post.showcommands) AND empty($error)}
        <textarea name="showfield" cols="50" rows="10" readonly="readonly">{$permexport}</textarea>
    {/if}
</div>