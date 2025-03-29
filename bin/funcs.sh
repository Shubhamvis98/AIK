banner()
{
cat <<'EOF' 
   _     _____                     _    _                 _   _                 
  /_\    \_   \/\ /\     _ __ ___ | | _| |__   ___   ___ | |_(_)_ __ ___   __ _ 
 //_\\    / /\/ //_/____| '_ ` _ \| |/ / '_ \ / _ \ / _ \| __| | '_ ` _ \ / _` |
/  _  \/\/ /_/ __ \_____| | | | | |   <| |_) | (_) | (_) | |_| | | | | | | (_| |
\_/ \_/\____/\/  \/     |_| |_| |_|_|\_\_.__/ \___/ \___/ \__|_|_| |_| |_|\__, |
                                                               by fossfrog|___/ 
twitter/git: shubhamvis98
web: https://fossfrog.in
________________________________________________________________________________

EOF
}

usage()
{
    echo -e "Usage:"
    echo -e "\t./unpackimg <boot.img>\t\t#unpack boot.img"
    echo -e "\t./repackimg\t\t\t#repack new-boot.img"
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

chkcmds() {
    printf "%-40s" '[+]Checking for required commands'
    local commands=("mkbootimg" "unpack_bootimg" "zstd" "cpio" "gzip")
    local missing=()

    for cmd in "${commands[@]}"; do
        if ! command -v "$cmd" &> /dev/null; then
            missing+=("$cmd")
        fi
    done

    if [ ${#missing[@]} -gt 0 ]; then
        echo -e "\n[!]Error: Please install following required commands:"
        for cmd in "${missing[@]}"; do
            echo "  - $cmd"
        done
        exit 1
    fi

    echo "Done"
}
