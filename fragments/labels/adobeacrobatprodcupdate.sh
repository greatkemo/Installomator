adobeacrobatprodcupdate)
    name="Adobe Acrobat Pro DC Update"
    type="pkgInDmg"
    releaseContext=$( curl -sfL https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/index.html | awk -F 'class="reference internal" href="' '{for (i=2; i<=NF; i++) print $i}' | awk -F '">' '{print $1}' | grep "continuous/dccontinuous" | head -1 )
    releaseURL="https://www.adobe.com/devnet-docs/acrobatetk/tools/ReleaseNotesDC/${releaseContext}"
    downloadURL=$( curl -sfL "$releaseURL" | awk -F 'href="' '/https:\/\/[^"]*\/pub\/adobe\/acrobat\/mac\/AcrobatDC\/[0-9]+\/AcrobatDCUpd[0-9]+\.dmg/ {print $2}' | awk -F '"' '{print $1}' )
    archiveName=$(basename "$downloadURL")
    pkgName="$( sed 's/\.dmg$//' <<< $archiveName )/$( sed 's/\.dmg$/\.pkg/' <<< $archiveName )"
    appNewVersion=$( sed -E 's/AcrobatDCUpd([0-9]{2})([0-9]{3})([0-9]{5})\.dmg/\1.\2.\3/' <<< "$archiveName" )
    expectedTeamID="JQ525L2MZD"
    versionKey="CFBundleShortVersionString"
    blockingProcesses=( "Acrobat" , "Distiller" )
    ;;