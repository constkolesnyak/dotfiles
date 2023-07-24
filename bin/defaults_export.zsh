#!/usr/bin/env zsh

# Original: https://gist.github.com/inoperable/6041a6cc9426043bb830f4f4ed658449


outdir="$HOME/Desktop"
[ -n "$1" ] && outdir="$1"

if [ ! -d "$outdir" ]; then
    echo "Directory '$outdir' does not exist"
    exit 1
fi

outdir="$outdir/Defaults"


function exportDefaults {
    local outdirApple="$outdir/Apple"
    local outdirUser="$outdir/User"
    local outdirGlobal="$outdir/Global"
    local filesdone=0
    local filecount=0
    local filestotal=0
    local globals=0

    function cleanOutdirs {
        [[ ! -d "$outdir" ]] && mkdir "$outdir" 
        if [[ -d "$outdirApple" ]]; then
            echo "removing all files in $outdirApple"
            rm -rf "${outdirApple/*}"
        else
            mkdir "$outdirApple"
        fi

        if [[ -d $outdirUser ]]; then
            echo "removing all files in $outdirUser"
            rm -rf "${outdirUser/*}"
        else
            mkdir "$outdirUser"
        fi

        if [[ -d $outdirGlobal ]]; then
            echo "removing all files in $outdirGlobal"
            rm -rf "${outdirGlobal/*}"
        else
            mkdir "$outdirGlobal"
        fi
    }

    function exportDomains {
        filesdone=0
        filecount=0
        for domain in "${domains[@]}"; do
            plist="${domain//,/}.plist"
            domain="${domain%?}"
            
            if [[ $globals == 0 ]]; then
                if [[ $domain =~ com.apple ]]; then
                    defaults export "$domain" "$outdirApple/$plist"
                else
                    defaults export "$domain" "$outdirUser/$plist"
                fi
            else
                sudo defaults export "$domain" "$outdirGlobal/$plist"
            fi

            filecount=$((filecount+1))
            filesleft=$((filesleft-1))
            filesdone=$((filesdone+1))
            echo -ne "[ Done: $filesdone; Left: $filesleft ] \r"
        done
    }

    cleanOutdirs

    local domains=($(defaults domains))
    local filesleft=${#domains[@]}
    echo "USER namespace has ${#domains[@]} domains, exporting..."
    exportDomains
    echo "written $filecount files in $outdir"
    local filestotal=$((filestotal+filecount))

    globals=1

    local domains=($(sudo defaults domains))
    local filesleft=${#domains[@]}
    echo "GLOBAL namespace has ${#domains[@]} domains, exporting..."
    exportDomains
    echo "written $filecount files in $outdir"
    local filestotal=$((filestotal+filecount))

    sudo chown -R "$(whoami)":staff "$HOME/defaults"
    local timed="$((SECONDS / 3600))hrs $(((SECONDS / 60) % 60))min $((SECONDS % 60))sec"

    echo "exported $filestotal files in $timed"
}

exportDefaults
