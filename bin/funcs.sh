banner()
{
cat <<'EOF' 
   _     _____                                 _     _
  /_\    \_   \/\ /\     _ __ ___   __ _  __ _(_)___| | __
 //_\\    / /\/ //_/____| '_ ` _ \ / _` |/ _` | / __| |/ /
/  _  \/\/ /_/ __ \_____| | | | | | (_| | (_| | \__ \   < 
\_/ \_/\____/\/  \/     |_| |_| |_|\__,_|\__, |_|___/_|\_\
                                         |___/ by fossfrog
twitter/git: shubhamvis98

EOF
}

chkarch()
{
    arch=`uname -m`

    if [[ "$arch" == "arm"* ]]; then
        MAGISKBOOT=`pwd/`'bin/magiskboot_arm'
    elif [[ "$arch" == "x86_64" ]]; then
        MAGISKBOOT=`pwd`/'bin/magiskboot_x86'
    else
        echo "[!]Unknown architecture"
        exit
    fi
}
