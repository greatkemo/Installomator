jetbrainsphpstorm)
    name="PHPStorm"
    type="dmg"
    downloadURL="https://download.jetbrains.com/product?code=PS&latest&distribution=mac"
    appNewVersion=$( curl -fsIL "${downloadURL}" | grep -i "location" | tail -1 | sed -E 's/.*\/[a-zA-Z-]*-([0-9.]*).*[-.].*dmg/\1/g' )
    expectedTeamID="2ZEFAR8TH3"
    ;;