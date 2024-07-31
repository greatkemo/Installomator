rstudio)
    name="RStudio"
    type="dmg"
    archiveName=$( curl -sfL https://posit.co/download/rstudio-desktop/ | grep -ioE 'rstudio-[^"]+\.dmg' | head -n 1 )
    downloadURL="https://download1.rstudio.org/electron/macos/$archiveName"
    appNewVersion=$( sed -E 's/^RStudio-([0-9]+\.[0-9]+\.[0-9]+)-[0-9]+\.dmg$/\1/I' <<< "$archiveName" )
    versionKey=$( defaults read /Applications/RStudio.app/Contents/Info.plist CFBundleShortVersionString | sed -E 's/\+[0-9]+//' )
    blockingProcesses=( "RStudio" , "RStudio Helper" )
    expectedTeamID="FYF2F5GFX4"
    ;;
