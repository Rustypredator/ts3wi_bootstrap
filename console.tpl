<div class="panel-body">
    <h2>{$lang['queryconsole']}</h2>
    {$lang['outputbox']}:
    <textarea class="form-control"  name="output" cols="80" rows="20" readonly="readonly">{$showOutput}</textarea>
    <form method="post" action="index.php?site=console&amp;sid={$sid}">
        <div class="form-group">
            <label class="col-md-2 label-control" for="command">{$lang['inputbox']}</label>
            <div class="col-md-8"><input class="form-control" type="text" name="command"/></div>
            <div class="col-md-2"><input class="btn btn-success" type="submit" name="execute" value="{$lang['execute']}" /></div>
        </div>
    </form>
</div>