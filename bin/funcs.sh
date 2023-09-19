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

    if [[ "$arch" == "arm"* || "$arch" == "aarch"* ]]; then
        MAGISKBOOT=`pwd`/'bin/magiskboot_arm'
    elif [[ "$arch" == "x86_64" ]]; then
        MAGISKBOOT=`pwd`/'bin/magiskboot_x86'
    else
        echo "[!]Unknown architecture"
        exit
    fi
}

usage()
{
    echo -e "Usage:"
    echo -e "\t./unpack <android_boot.img>\t#unpack boot.img"
    echo -e "\t./repack\t\t\t#repack new-boot.img"
    echo -e "\t./cleanup\t\t\t#clean workspace\n"
}

chkrdtype() {
    file="$1"
    file_type=$(file -b "$file" | tr '[:upper:]' '[:lower:]')

    if [[ $file_type == *"gzip"* ]]; then
        echo 'gzip'
    elif [[ $file_type == *"xz"* ]]; then
        echo 'xz'
    elif [[ $file_type == *"zst"* ]]; then
        echo 'zst'
    elif [[ $file_type == *"cpio"* ]]; then
        echo 'cpio'
    else
        echo 'Unknown'
    fi
}

