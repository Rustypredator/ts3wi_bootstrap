<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
*Copyright (C) 2012-2013  Psychokiller
*
*This program is free software; you can redistribute it and/or modify it under the terms of 
*the GNU General Public License as published by the Free Software Foundation; either 
*version 3 of the License, or any later version.
*
*This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
*without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
*See the GNU General Public License for more details.
*
*You should have received a copy of the GNU General Public License along with this program; if not, see http://www.gnu.org/licenses/. 
-->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="de">
	<head>
        {if isset($smarty.cookies.bootstrapskin)}
            {assign var=bootstrapskin value=$smarty.cookies.bootstrapskin}
        {else}
            {assign var=bootstrapskin value="bootstrap"}
        {/if}
		<title>Teamspeak 3 - Webinterface</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="templates/{$tmpl}/gfx/css/themes/{$bootstrapskin}.min.css"/>
        <link rel="stylesheet" type="text/css" href="templates/{$tmpl}/gfx/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="templates/{$tmpl}/gfx/css/sidebar.css"/>
        <link rel="stylesheet" type="text/css" href="templates/{$tmpl}/gfx/css/style.css" media="screen"/>
		<!--<link rel="stylesheet" href="templates/{$tmpl}/gfx/css/tsview.css" type="text/css" media="screen" />-->
	</head>
	<body>
        {if $site !== "login"}
            <div id="wrapper">
                {include file="{$tmpl}/mainbar.tpl"}
                <!-- Page Content -->
                <div id="page-content-wrapper">
                    <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
                        <span class="hamb-top"></span>
                        <span class="hamb-middle"></span>
                        <span class="hamb-bottom"></span>
                    </button>
                    <div class="container">
                        {include file="{$tmpl}/head.tpl"}
                        <div class="panel panel-primary">
                            <div class="panel-heading">{$site}</div>
                            {include file="{$tmpl}/{$site}.tpl"}
                            <div class="panel-footer text-center">
                                {$footer}
                                powered by <a href='http://www.ts-rent.de'>www.TS-Rent.de</a>&nbsp;|&nbsp;
                                This interface contains images from <a href='http://www.teamspeak.com'>www.teamspeak.com</a>.&nbsp;|&nbsp;
                                <a href='http://www.psychoscripts.de/donate.php'><img alt="donate" border="0" src="https://www.paypalobjects.com/de_DE/DE/i/btn/btn_donate_SM.gif" width="86" height="21"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#page-content-wrapper -->
            </div>
            <!-- /#wrapper -->
        {else}
            {include file="{$tmpl}/login.tpl"}
        {/if}
		<script type="text/javascript" language="JavaScript" src="templates/{$tmpl}/gfx/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" language="JavaScript" src="templates/{$tmpl}/gfx/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="JavaScript" src="templates/{$tmpl}/gfx/js/sidebar.js"></script>
        <script type="text/javascript" language="JavaScript" src="templates/{$tmpl}/gfx/js/main.js"></script>
        <script type="text/javascript" language="JavaScript" src="gfx/js/wz_tooltip.js"></script>
    </body>
</html>