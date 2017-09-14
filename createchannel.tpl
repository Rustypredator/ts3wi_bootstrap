{if isset($permoverview['b_channel_create_permanent']) AND isset($permoverview['b_channel_create_semi_permanent']) AND isset($permoverview['b_channel_create_temporary']) AND empty($permoverview['b_channel_create_permanent']) AND empty($permoverview['b_channel_create_semi_permanent']) AND empty($permoverview['b_channel_create_temporary'])}
    {include file="permerror.tpl"}
{else}
    <div class="panel-body">
        <h2 class="text-center">{$lang['createachannel']}</h2>
        <form class="form-horizontal" method="post" action="index.php?site=createchannel&amp;sid={$sid}">
            <div class="form-group">
                <label class="label-control col-sm-2" for="settings[cpid]">{$lang['pid']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="settings[cpid]">
                        <option value="0">{$lang['mainchannel']}</option>
                        {foreach key=key item=value from=$channellist}
                            <option value="{$value['cid']}">{$value['channel_name']}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['name']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="settings[channel_name]"/>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['topic']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['b_channel_create_with_topic']) AND empty($permoverview['b_channel_create_with_topic'])}
                        -
                    {else}
                        <input class="form-control" type="text" name="settings[channel_topic]" value="" />
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['description']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['b_channel_create_with_description']) AND empty($permoverview['b_channel_create_with_description'])}
                        -
                    {else}
                        <input class="form-control" type="text" name="settings[channel_description]" value="" />
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['codec']}</label>
                <div class="col-sm-10">
                    <select class="form-control" name="settings[channel_codec]">
                        {if !isset($permoverview['b_channel_create_modify_with_codec_speex8']) OR $permoverview['b_channel_create_modify_with_codec_speex8']==1}
                            <option value="0">{$lang['codec0']}</option>
                        {/if}
                        {if !isset($permoverview['b_channel_create_modify_with_codec_speex16']) OR $permoverview['b_channel_create_modify_with_codec_speex16']==1}
                            <option value="1">{$lang['codec1']}</option>
                        {/if}
                        {if !isset($permoverview['b_channel_create_modify_with_codec_speex32']) OR $permoverview['b_channel_create_modify_with_codec_speex32']==1}
                            <option value="2">{$lang['codec2']}</option>
                        {/if}
                        {if !isset($permoverview['b_channel_create_modify_with_codec_celtmono48']) OR $permoverview['b_channel_create_modify_with_codec_celtmono48']==1}
                            <option value="3">{$lang['codec3']}</option>
                        {/if}
                        {if !isset($permoverview['b_channel_create_modify_with_codec_opusvoice']) OR $permoverview['b_channel_create_modify_with_codec_opusvoice']==1}
                            <option value="3">{$lang['codec4']}</option>
                        {/if}
                        {if !isset($permoverview['b_channel_create_modify_with_codec_opusmusic']) OR $permoverview['b_channel_create_modify_with_codec_opusmusic']==1}
                            <option value="3">{$lang['codec5']}</option>
                        {/if}
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['codecquality']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['i_channel_create_modify_with_codec_maxquality']) AND empty($permoverview['i_channel_create_modify_with_codec_maxquality'])}
                        -
                    {else}
                        <select class="form-control" name="settings[channel_codec_quality]">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                        </select>
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['maxclients']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['b_channel_create_with_maxclients']) AND empty($permoverview['b_channel_create_with_maxclients'])}
                        -
                    {else}
                        <input class="form-control" type="text" name="settings[channel_maxclients]" value="-1" />
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['maxfamilyclients']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['b_channel_create_with_maxfamilyclients']) AND empty($permoverview['b_channel_create_with_maxfamilyclients'])}
                        -
                    {else}
                        <input class="form-control" type="text" name="settings[channel_maxfamilyclients]" value="-1" />
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['type']}</label>
                <div class="col-sm-10">
                    {if !isset($permoverview['b_channel_create_semi_permanent']) OR $permoverview['b_channel_create_semi_permanent']==1}
                        <input type="radio" name="chantyp" value="1" checked="checked" />&nbsp;{$lang['semipermanent']}<br/>
                    {/if}
                    {if !isset($permoverview['b_channel_create_permanent']) OR $permoverview['b_channel_create_permanent']==1}
                        <input type="radio" name="chantyp" value="2" />&nbsp;{$lang['permanent']}<br />
                    {/if}
                    {if !isset($permoverview['b_channel_create_with_default']) OR $permoverview['b_channel_create_with_default']==1}
                        <input type="radio" name="chantyp" value="3" />&nbsp;{$lang['default']}
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['maxfamilyclientsinherited']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['b_channel_create_with_maxclients']) AND empty($permoverview['b_channel_create_with_maxclients'])}
                        -
                    {else}
                        <select class="form-control" name="settings[channel_flag_maxfamilyclients_inherited]">
                            <option value="0">0</option>
                            <option value="1">1</option>
                        </select>
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['neededtalkpower']}</label>
                <div class="col-sm-10">
                    {if isset($permoverview['b_channel_create_with_needed_talk_power']) AND empty($permoverview['b_channel_create_with_needed_talk_power'])}
                        -
                    {else}
                        <input class="form-control" type="text" name="settings[channel_needed_talk_power]" value="0" />
                    {/if}
                </div>
            </div>
            <div class="form-group">
                <label class="label-control col-sm-2">{$lang['phoneticname']}</label>
                <div class="col-sm-10">
                    <input class="form-control" type="text" name="settings[channel_name_phonetic]" value="" />
                </div>
            </div>
            <div class="col-sm-12">
                <button class="btn btn-success btn-block" type="submit" name="createchannel" title="{$lang['create']}"><i class="fa fa-lg fa-plus"></i>&nbsp;{$lang['create']}</button>
            </div>
        </form>
    </div>
{/if}