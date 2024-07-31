githubdesktop)
    name="GitHub Desktop"
    type="zip"
    appNewVersion=$( curl -fs https://central.github.com/deployments/desktop/desktop/changelog.json | awk -F '{' '/"version"/ { print $2 }' | sed -E 's/.*,\"version\":\"([0-9.]*)\".*/\1/g' )
    if [[ $(arch) == "arm64" ]]; then
        downloadURL="$( curl -fsIL https://central.github.com/deployments/desktop/desktop/latest/darwin-arm64 | grep -i "^location" | sed -E 's/.*(https.*\.zip).*/\1/g' )"
        archiveName="$( basename -a "$downloadURL" )"
    elif [[ $(arch) == "i386" ]]; then
        downloadURL="$( curl -fsIL https://central.github.com/deployments/desktop/desktop/latest/darwin | grep -i "^location" | sed -E 's/.*(https.*\.zip).*/\1/g' )"
        archiveName="$( basename -a "$downloadURL" )"
    fi
    versionKey="CFBundleShortVersionString"
    blockingProcesses=( "GitHub Desktop" , "GitHub Desktop Helper" )
    expectedTeamID="VEKTX9H2N7"
    ;;
