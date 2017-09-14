<div class="row">
    <div class="col-md-3 col-sm-12">
        {if $loginstatus === true}
            <a class="btn btn-warning form-control" href="index.php?site=logout"><i class="fa fa-lg fa-sign-out"></i>&nbsp;{$smarty.session.loginuser}&nbsp;{$lang['logout']}</a>
        {/if}
    </div>
    <div class="col-md-6 col-sm-12">
        {if $fastswitch == true AND $hoststatus === true}
            <form method="get" action="index.php?site=serverview">
                {if strpos($site, 'edit') == false OR $site == serveredit}
                    <input type="hidden" name="site" value="{$site}" />
                {else}
                    <input type="hidden" name="site" value="serverview" />
                {/if}
                <select class="form-control" name="sid" onchange="submit()">
                    {foreach key=key item=server from=$serverlist}
                        {if $sid == $server['virtualserver_id']}
                            <option selected="selected" value="{$server['virtualserver_id']}">{$server['virtualserver_name']}-{$server['virtualserver_port']}</option>
                        {else}
                            <option value="{$server['virtualserver_id']}">{$server['virtualserver_name']}-{$server['virtualserver_port']}</option>
                        {/if}
                    {/foreach}
                </select>
            </form>
        {/if}
    </div>
    <div class="col-md-3 col-sm-12">
        <form method="get" action="" onchange="changeskin(this)">
            <input type="hidden" name="site" value="{$site}"/>
            <input type="hidden" name="sid" value="{$sid}"/>
            <select class="form-control" name="bootstrapskin">
                <option {if $bootstrapskin === 'bootstrap'}selected{/if} value="bootstrap">Bootstrap (Default)</option>
                <option {if $bootstrapskin === 'cerulean'}selected{/if} value="cerulean">Cerulean</option>
                <option {if $bootstrapskin === 'cosmo'}selected{/if} value="cosmo">Cosmo</option>
                <option {if $bootstrapskin === 'cyborg'}selected{/if} value="cyborg">Cyborg</option>
                <option {if $bootstrapskin === 'darkly'}selected{/if} value="darkly">Darkly</option>
                <option {if $bootstrapskin === 'flatly'}selected{/if} value="flatly">Flatly</option>
                <option {if $bootstrapskin === 'journal'}selected{/if} value="journal">Journal</option>
                <option {if $bootstrapskin === 'lumen'}selected{/if} value="lumen">Lumen</option>
                <option {if $bootstrapskin === 'paper'}selected{/if} value="paper">Paper</option>
                <option {if $bootstrapskin === 'readable'}selected{/if} value="readable">Readable</option>
                <option {if $bootstrapskin === 'sandstone'}selected{/if} value="sandstone">Sandstone</option>
                <option {if $bootstrapskin === 'simplex'}selected{/if} value="simplex">Simplex</option>
                <option {if $bootstrapskin === 'slate'}selected{/if} value="slate">Slate</option>
                <option {if $bootstrapskin === 'solar'}selected{/if} value="solar">Solar</option>
                <option {if $bootstrapskin === 'spacelab'}selected{/if} value="spacelab">Spacelab</option>
                <option {if $bootstrapskin === 'superhero'}selected{/if} value="superhero">Superhero</option>
                <option {if $bootstrapskin === 'united'}selected{/if} value="united">United</option>
                <option {if $bootstrapskin === 'yeti'}selected{/if} value="yeti">Yeti</option>
            </select>
        </form>
    </div>
</div>
<div class="spacer"></div>
<div class="row messages">
    {if !empty($motd)}
        <div class="alert alert-info alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <i class="fa fa-lg fa-info-circle"></i>&nbsp;{$motd}
        </div>
    {/if}
    {if !empty($error) OR !empty($noerror)}
        {if !empty($error)}
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <i class="fa fa-lg fa-times-circle"></i>&nbsp;{$error}
            </div>
        {/if}
        {if !empty($noerror)}
            <div class="alert alert-info alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <i class="fa fa-lg fa-info-circle"></i>&nbsp;{$noerror}
            </div>
        {/if}
    {/if}
</div>