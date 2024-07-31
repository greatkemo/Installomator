figma)
    name="Figma"
    type="zip"
    if [[ $(arch) == "arm64" ]]; then
        downloadURL="$( curl -fsL https://desktop.figma.com/mac-arm/RELEASE.json | sed -E 's/.*(https.*\.zip).*/\1/g' )"
        archiveName="$( basename -a "$downloadURL" )"
        appNewVersion="$( sed -E 's/^Figma-([0-9]+\.[0-9]+\.[0-9]+)\.zip$/\1/' <<< "$archiveName" )"
        
    elif [[ $(arch) == "i386" ]]; then
        downloadURL="$( curl -fsL https://desktop.figma.com/mac/RELEASE.json | sed -E 's/.*(https.*\.zip).*/\1/g' )"
        archiveName="$( basename -a "$downloadURL" )"
        appNewVersion="$( sed -E 's/^Figma-([0-9]+\.[0-9]+\.[0-9]+)\.zip$/\1/' <<< "$archiveName" )"
    fi
    versionKey="CFBundleShortVersionString"
    blockingProcesses=( "Figma" , "Figma Helper" , "FigmaAgent" )
    expectedTeamID="T8RA8NE3B7"
    ;;
