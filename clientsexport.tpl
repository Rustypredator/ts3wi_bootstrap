<div class="panel-body">
    <h2 class="text-center">{$lang['clientsexport']}</h2>
    <p>{$lang['clientsexportdesc']}</p>
    <form class="form-inline" method="post" action="site/clientsexport.php" target="_blank">
        <div class="form-group">
            <label class="label-control col-sm-2">{$lang['serverid']}</label>
            <div class="col-sm-10">
                <div class="input-group">
                    <input class="form-control" type="text" name="sid"/>
                    <input type="hidden" name="sid" value="{$sid}" />
                    <div class="input-group-btn">
                        <button class="btn btn-success" type="submit" name="give" title="{$lang['clientsexport']}">{$lang['clientsexport']}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
