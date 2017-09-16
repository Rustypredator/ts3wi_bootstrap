{if isset($permoverview['b_client_ban_create']) AND empty($permoverview['b_client_ban_create'])}
    {include file="permerror.tpl"}
{else}
	<div class="panel-body">
		<h2>{$lang['addban']}</h2>
        <form class="form-horizontal" method="post" action="index.php?site=banadd&amp;sid={$sid}">
            <div class="form-group">
                <label class="col-sm-2 label-control" for="banip">{$lang['ip']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="banip" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="banname">{$lang['name']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="banname" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="banuid">{$lang['uniqueid']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="banuid" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="reason">{$lang['reason']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="reason" value="" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 label-control" for="bantime">{$lang['bantime']}</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <input class="form-control" type="text" name="bantime" value="" />
                        <div class="input-group-addon">{$lang['seconds']}</div>
                    </div>
                </div>
            </div>
            <button class="btn btn-warning btn-block" type="submit" name="addban">
                <span class="fa-stack fa-lg">
                    <i class="fa fa-user fa-stack-1x"></i>
                    <i class="fa fa-ban fa-stack-2x text-danger"></i>
                </span>
                {$lang['ban']}
            </button>
        </form>
    </div>
{/if}