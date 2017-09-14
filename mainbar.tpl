{if $loginstatus === true AND $site !==login}
	<div class="overlay"></div>

	<!-- Sidebar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
		<ul class="nav sidebar-nav">
			<li class="sidebar-brand"><a href="index.php">Ts3Wi</a></li>
            {if $hoststatus === true}
                <li class=""><a href="index.php?site=server"><i class="fa fa-fw fa-server"></i>&nbsp;{$lang['serverlist']}</a></li>
            {/if}
            {if !isset($sid) AND $hoststatus === true}
                <li class="{if $site === "createserver"}active{/if}"><a href="index.php?site=createserver"><i class="fa fa-fw fa-plus"></i>&nbsp;{$lang['createserver']}</a></li>
                <li class="{if $site === "servertraffic"}active{/if}"><a href="index.php?site=servertraffic"><i class="fa fa-fw fa-exchange"></i>&nbsp;{$lang['instancetraffic']}</a></li>
                <li class="{if $site === "instanceedit"}active{/if}"><a href="index.php?site=instanceedit"><i class="fa fa-fw fa-edit"></i>&nbsp;{$lang['instanceedit']}</a></li>
                <li class="{if $site === "logview"}active{/if}"><a href="index.php?site=logview"><i class="fa fa-fw fa-history"></i>&nbsp;{$lang['logview']}</a></li>
                <li class="{if $site === "iserverbackup"}active{/if}"><a href="index.php?site=iserverbackup"><i class="fa fa-fw fa-hdd-o"></i>&nbsp;{$lang['instancebackup']}</a></li>
            {/if}
            {if isset($sid)}
                <li class="dropdown open">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-server"></i>&nbsp;Server&nbsp;<i class="fa fa-fw fa-caret"></i></a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "serverview"}active{/if}"><a href="index.php?site=serverview&amp;sid={$sid}"><i class="fa fa-fw fa-eye"></i>&nbsp;{$lang['serverview']}</a></li>
                        <li class="{if $site === "servertraffic"}active{/if}"><a href="index.php?site=servertraffic&amp;sid={$sid}"><i class="fa fa-fw fa-exchange"></i>&nbsp;{$lang['virtualtraffic']}</a></li>
                        <li class="{if $site === "serveredit"}active{/if}"><a href="index.php?site=serveredit&amp;sid={$sid}"><i class="fa fa-fw fa-edit"></i>&nbsp;{$lang['serveredit']}</a></li>
                        <li class="{if $site === "temppw"}active{/if}"><a href="index.php?site=temppw&amp;sid={$sid}"><i class="fa fa-fw fa-lock"></i>&nbsp;{$lang['temppw']}</a></li>
                        <li class="{if $site === "fileupload"}active{/if}"><a href="index.php?site=fileupload&amp;sid={$sid}"><i class="fa fa-fw fa-upload"></i>&nbsp;{$lang['iconupload']}</a></li>
                        <li class="{if $site === "logview"}active{/if}"><a href="index.php?site=logview&amp;sid={$sid}"><i class="fa fa-fw fa-calendar"></i>&nbsp;{$lang['logview']}</a></li>
                        <li class="{if $site === "filelist"}active{/if}"><a href="index.php?site=filelist&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['filelist']}</a></li>
                        <li class=""><a href="javascript:oeffnefenster('site/interactive.php?sid={$sid}&amp;action=action');"><i class="fa fa-fw fa-copy"></i>&nbsp;{$lang['massaction']}</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-comments-o"></i>&nbsp;{$lang['channel']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "channel"}active{/if}"><a href="index.php?site=channel&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['channellist']}</a></li>
                        <li class="{if $site === "createchannel"}active{/if}"><a href="index.php?site=createchannel&amp;sid={$sid}"><i class="fa fa-fw fa-plus"></i>&nbsp;{$lang['createchannel']}</a></li>
                        {if isset($cid)}
                            <li class="{if $site === "channelview"}active{/if}"><a href="index.php?site=channelview&amp;sid={$sid}&amp;cid={$cid}"><i class="fa fa-fw fa-eye"></i>&nbsp;{$lang['channelview']}</a></li>
                            <li class="{if $site === "channeledit"}active{/if}"><a href="index.php?site=channeledit&amp;sid={$sid}&amp;cid={$cid}"><i class="fa fa-fw fa-edit"></i>&nbsp;{$lang['channeledit']}</a></li>
                        {/if}
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-users"></i>&nbsp;{$lang['clients']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "counter"}active{/if}"><a href="index.php?site=counter&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['clientcounter']}</a></li>
                        <li class="{if $site === "clients"}active{/if}"><a href="index.php?site=clients&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['clientlist']}</a></li>
                        <li class="{if $site === "complainlist"}active{/if}"><a href="index.php?site=complainlist&amp;sid={$sid}"><i class="fa fa-fw fa-warning"></i>&nbsp;{$lang['complainlist']}</a></li>
                        <li class="{if $site === "chanclienteditperm"}active{/if}"><a href="index.php?site=chanclienteditperm&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['chanclientperms']}</a></li>
                        <li class="{if $site === "clientcleaner"}active{/if}"><a href="index.php?site=clientcleaner&amp;sid={$sid}"><i class="fa fa-fw fa-paint-brush"></i>&nbsp;{$lang['clientcleaner']}</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-times-circle"></i>&nbsp;{$lang['bans']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "banlist"}active{/if}"><a href="index.php?site=banlist&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['banlist']}</a></li>
                        <li class="{if $site === "banadd"}active{/if}"><a href="index.php?site=banadd&amp;sid={$sid}"><i class="fa fa-fw fa-plus"></i>&nbsp;{$lang['addban']}</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-users"></i>&nbsp;{$lang['groups']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "sgroups"}active{/if}"><a href="index.php?site=sgroups&amp;sid={$sid}"><i class="fa fa-fw fa-users"></i>&nbsp;{$lang['servergroups']}</a></li>
                        <li class="{if $site === "sgroupadd"}active{/if}"><a href="index.php?site=sgroupadd&amp;sid={$sid}"><i class="fa fa-fw fa-plus"></i>&nbsp;{$lang['addservergroup']}</a></li>
                        <li class="{if $site === "cgroups"}active{/if}"><a href="index.php?site=cgroups&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['channelgroups']}</a></li>
                        <li class="{if $site === "cgroupadd"}active{/if}"><a href="index.php?site=cgroupadd&amp;sid={$sid}"><i class="fa fa-fw fa-plus"></i>&nbsp;{$lang['addchannelgroup']}</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-ticket"></i>&nbsp;{$lang['token']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "token"}active{/if}"><a href="index.php?site=token&amp;sid={$sid}"><i class="fa fa-fw fa-ticket"></i>&nbsp;{$lang['token']}</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-hdd-o"></i>&nbsp;{$lang['backup']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "backup"}active{/if}"><a href="index.php?site=backup&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['chanbackups']}</a></li>
                        <li class="{if $site === "serverbackup"}active{/if}"><a href="index.php?site=serverbackup&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['serverbackups']}</a></li>
                        <li class="{if $site === "permexport"}active{/if}"><a href="index.php?site=permexport&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['permexport']}</a></li>
                        <li class="{if $site === "clientsexport"}active{/if}"><a href="index.php?site=clientsexport&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['clientsexport']}</a></li>
                        <li class="{if $site === "bansexport"}active{/if}"><a href="index.php?site=bansexport&amp;sid={$sid}"><i class="fa fa-fw fa-list"></i>&nbsp;{$lang['bansexport']}</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-terminal"></i>&nbsp;{$lang['queryconsole']}</a>
                    <ul class="dropdown-menu" role="menu">
                        <li class="{if $site === "console"}active{/if}"><a href="index.php?site=console&amp;sid={$sid}"><i class="fa fa-fw fa-terminal"></i>&nbsp;{$lang['queryconsole']}</a></li>
                    </ul>
                </li>
            {/if}
        </ul>
        <button type="button" class="btn btn-info btn-block" onclick="themeinfomodal()" style="position:absolute;bottom:0;left:0;"><i class="fa fa-lg fa-info-circle"></i>&nbsp;Theme Info</button>
        <div class="modal fade" id="themeinfomodal" tabindex="-1" role="dialog" aria-labelledby="themeinfomodallabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="themeinfomodallabel">Theme Informations</h4>
                    </div>
                    <div class="modal-body">
                        Theme Author: <a>Rustypredator</a><br/>
                        <hr/>
                        Sources:<br/>
                        Sidebar Template by: <a href="http://codepen.io/j_holtslander/pen/XmpMEp">Jay Holtslander</a><br/>
                        Background Images by: <a href="http://thepatternlibrary.com/">ThePatternLibrary</a>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
	</nav>
	<!-- /#sidebar-wrapper -->
{/if}
