{if !isset($smarty.post.sendlogin) AND $loginstatus !== true OR $loginstatus !== true}
    <div class="col-md-4 col-md-offset-4 loginbox">
        <div class="panel panel-default">
            <div class="panel-heading">{$lang['login']}</div>
            {if !empty($error)}
                <div class="panel-body alert alert-danger">
                    <i class="fa fa-lg fa-times-circle"></i>&nbsp;{$error}
                </div>
            {/if}
            {if !empty($motd)}
                <div class="panel-body alert alert-info">
                    <i class="fa fa-lg fa-info-circle"></i>&nbsp;{$lang['motd']}<br/>{$motd}
                </div>
            {/if}
            <div class="panel-body">
                <form class="form-horizontal" method="post" action="index.php?site=login">
                    <div class="form-group">
                        <label for="skey" class="col-sm-2 control-label">Server</label>
                        <div class="col-sm-10">
                            {if count($instances) == 1}
                                {foreach key=skey item=sdata from=$instances}
                                    <input type="hidden" name="skey" value="{$skey}" />	{$sdata['alias']}
                                {/foreach}
                            {else}
                                <select class="form-control" name="skey">
                                    {foreach key=skey item=sdata from=$instances}
                                        <option value="{$skey}">{$sdata['alias']}</option>
                                    {/foreach}
                                </select>
                            {/if}
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="loginUser" class="col-sm-2 label-control">Username</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="text" name="loginUser" value="serveradmin" placeholder="Username"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="loginPw" class="col-sm-2 label-control">Password</label>
                        <div class="col-sm-10">
                            <input class="form-control" type="password" name="loginPw" placeholder="Password"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10 col-sm-offset-2">
                            <input class="btn btn-success btn-block" type="submit" name="sendlogin" value="{$lang['login']}"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="panel-footer text-center">
                {$footer}
                powered by <a href='http://www.ts-rent.de'>www.TS-Rent.de</a>&nbsp;|&nbsp;
                This interface contains images from <a href='http://www.teamspeak.com'>www.teamspeak.com</a>.&nbsp;|&nbsp;
                <a href='http://www.psychoscripts.de/donate.php'><img alt="donate" border="0" src="https://www.paypalobjects.com/de_DE/DE/i/btn/btn_donate_SM.gif" width="86" height="21"></a>
            </div>
        </div>
    </div>
{/if}