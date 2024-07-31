vlc)
    name="VLC"
    type="dmg"
    archiveName=$( curl -sf https://get.videolan.org/vlc/last/macosx/ | grep -o 'href="vlc-.*-universal\.dmg"' | awk -F '"' '{print $2}' )
    downloadURL="https://get.videolan.org/vlc/last/macosx/${archiveName}"
    appNewVersion=$(awk -F'[-.]' '{print $2"."$3"."$4}' <<< "$archiveName")
    versionKey="CFBundleShortVersionString"
    blockingProcesses=( "VLC" )
    expectedTeamID="75GAHG3SZQ"
    ;;
