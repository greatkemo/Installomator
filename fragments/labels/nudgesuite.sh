nudgesuite)
    name="Nudge Suite"
    appName="Nudge.app"
    type="pkg"
    appNewVersion=$( curl -sLI https://github.com/macadmins/Nudge/releases/latest | grep -i "^location" | tr "/" "\n" | tail -1 | sed 's/[^0-9\.]//g' )
    archiveName="Nudge_Suite-$appNewVersion.pkg"
    downloadURL="https://github.com/macadmins/nudge/releases/download/v$appNewVersion/$archiveName"
    expectedTeamID="T4SK8ZXCXG"
    versionKey="CFBundleShortVersionString"
    blockingProcesses=( "Nudge" )
    ;;
