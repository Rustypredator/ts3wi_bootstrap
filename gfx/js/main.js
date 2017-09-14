function Klappen(Id) {

    if (Id == 0) {
        var i = 1;
        var jetec_Minus = "gfx/images/minus.png"
            , jetec_Plus = "gfx/images/plus.png";

        if (document.getElementById('Pic0').name == 'plus') {
            document.getElementById('Pic0').src = jetec_Minus;
            document.getElementById('Pic0').name = 'minus';
            var openAll = 1;
        } else {
            document.getElementById('Pic0').src = jetec_Plus;
            document.getElementById('Pic0').name = 'plus';
            var openAll = 0;
        }
        while (i < 100) {
            if (document.getElementById('Pic' + i) != null) {
                var KlappText = document.getElementById('Lay' + i);
                var KlappBild = document.getElementById('Pic' + i);
                if (openAll == 1) {
                    KlappText.style.display = 'block';
                    KlappBild.src = jetec_Minus;
                } else {
                    KlappText.style.display = 'none';
                    KlappBild.src = jetec_Plus;
                }
                i++;
            } else {
                break;
            }
        }
    }
    var KlappText = document.getElementById('Lay' + Id);
    var KlappBild = document.getElementById('Pic' + Id);
    var jetec_Minus = "gfx/images/minus.png"
        , jetec_Plus = "gfx/images/plus.png";
    if (KlappText.style.display == 'none') {
        KlappText.style.display = 'block';
        KlappBild.src = jetec_Minus;
    } else {
        KlappText.style.display = 'none';
        KlappBild.src = jetec_Plus;
    }
}

function oeffnefenster(url) {
    fenster = window.open(url, "fenster1", "width=350,height=150,status=no,scrollbars=yes,resizable=no");
    fenster.opener.name = "opener";
    fenster.focus();
}

function hide_select(selectId) {
    if (selectId == 0) {
        document.getElementById("groups").style.display = "";
        document.getElementById("servergroups").style.display = "";
        document.getElementById("channelgroups").style.display = "none";
        document.getElementById("channel").style.display = "none";
    } else if (selectId == 1) {
        document.getElementById("groups").style.display = "";
        document.getElementById("servergroups").style.display = "none";
        document.getElementById("channelgroups").style.display = "";
        document.getElementById("channel").style.display = "";
    } else {
        document.getElementById("groups").style.display = "none";
        document.getElementById("servergroups").style.display = "none";
        document.getElementById("channelgroups").style.display = "none";
        document.getElementById("channel").style.display = "none";
    }
}

var checkflag = "false";
function check(form) {
    if (checkflag == "false") {
        for (i = 0; i < document.forms[form].elements.length; i++) {
            if (document.forms[form].elements[i].name != 'checkall') {
                document.forms[form].elements[i].checked = true;
            }
        }
        checkflag = "true";
        return checkflag;
    } else {
        for (i = 0; i < document.forms[form].elements.length; i++) {
            document.forms[form].elements[i].checked = false;
        }
        checkflag = "false";
        return checkflag;
    }
}

var conf_arr = new Array();
function confirmArray(sid, name, port, action) {
    conf_arr[sid] = new Object();
    conf_arr[sid]['name'] = name;
    conf_arr[sid]['port'] = port;
    if (document.getElementById("caction" + sid).options.selectedIndex == 0) {
        conf_arr[sid]['action'] = '';
    } else if (document.getElementById("caction" + sid).options.selectedIndex == 1) {
        conf_arr[sid]['action'] = 'start';
    } else if (document.getElementById("caction" + sid).options.selectedIndex == 2) {
        conf_arr[sid]['action'] = 'stop';
    } else if (document.getElementById("caction" + sid).options.selectedIndex == 3) {
        conf_arr[sid]['action'] = 'del';
    }
}

function confirmAction() {
    var text = "Möchtest du folgende Aktion wirklich ausführen?\n\n";
    for (var i in conf_arr) {
        if (conf_arr[i]['action'] == 'start') {
            text = text + "***Starten*** " + conf_arr[i]['name'] + " " + conf_arr[i]['port'] + "\n";
        } else if (conf_arr[i]['action'] == 'stop') {
            text = text + "***Stoppen*** " + conf_arr[i]['name'] + " " + conf_arr[i]['port'] + "\n";
        } else if (conf_arr[i]['action'] == 'del') {
            text = text + "***Löschen*** " + conf_arr[i]['name'] + " " + conf_arr[i]['port'] + "\n";
        }
    }
    return text;
}

function themeinfomodal() {
    //Close Sidebar
    $('.overlay').hide();
    $('.hamburger').removeClass('is-open');
    $('.hamburger').addClass('is-closed');
    $('#wrapper').toggleClass('toggled');
    //Open Modal
    setTimeout(function() {
        $('#themeinfomodal').modal('show');
    }, 1000);

}

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function changeskin(form) {
    //skin is a form, we want the field "bootstrapskin"
    var skin = form.elements.bootstrapskin.value;
    setCookie('bootstrapskin',skin,32);
    //reload site
    var site = form.elements.site.value;
    location.reload(true);
}