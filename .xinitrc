xbindkeys &
udiskie&
#python2 /home/cheukyin/google_appengine/goagent/local/proxy.py &
$ export XDG_MENU_PREFIX=gnome-
case $1 in
openbox)
        exec openbox-session
        ;;
awesome)
        xcompmgr &
        exec awesome
        ;;
twm)
        exec twm
        ;;
enlightenment17|*)
        exec enlightenment_start
        ;;
esac
#exec fvwm2
#exec enlightenment_start
export OPERAPLUGINWRAPPER_PRIORITY=0
export OPERA_KEEP_BLOCKED_PLUGIN=0
