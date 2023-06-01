Param (
    [string] $FoundryDataPath = "$env:LOCALAPPDATA\FoundryVTT\Data"
)

$srcPath = "$FoundryDataPath\systems\alienrpg"
$destPath = "$FoundryDataPath\systems\thewalkingdeadrpg-fromalien"

if (!(Test-Path $srcPath)) {
    throw "The FoundryVTT alienrpg system must be installed at $srcPath"
}

#
# Start from a clean copy of the alienrpg system
#

& robocopy.exe $srcPath $destPath /MIR /NFL /NDL /NP /NJH /NJS

#
# Make changes...
#

$filename = "$destPath\system.json"
$j = Get-Content $filename -Raw | ConvertFrom-Json
$j.id = 'thewalkingdeadrpg-fromalien'
$j.title = 'The Walking Dead RPG (Alien conversion)'
$j.authors += [PSCustomObject]@{ name = 'Jeremy Hurren (conversion script from alienrpg)' }
$j | ConvertTo-Json -Depth 32 | Set-Content $filename

$filename = "$destPath\lang\en.json"
$j = Get-Content $filename -Raw | ConvertFrom-Json -AsHashtable
$j.ALIENRPG.Career = 'Archetype'
$j.ALIENRPG.Medic = 'Doctor'
$j.ALIENRPG.Roughneck = 'Criminal'
$j.ALIENRPG.ColonialMarine = 'Farmer'
$j.ALIENRPG.ColonialMarshal = 'Homemaker'
$j.ALIENRPG.CompanyAgent = 'Nobody'
$j.ALIENRPG.Mercenary = 'Outcast'
$j.ALIENRPG.Officer = 'Politician'
$j.ALIENRPG.Pilot = 'Preacher'
$j.ALIENRPG.Synthetic = 'Law Enforcer'
$j.ALIENRPG.Homebrew = 'Soldier'
$j.ALIENRPG.SkillheavyMach = 'Force'
$j.ALIENRPG.Skillstamina = 'Endure'
$j.ALIENRPG.Skillpiloting = 'Stealth'
$j.ALIENRPG.Skillobservation = 'Scout'
$j.ALIENRPG.Skillcomtech = 'Tech'
$j.ALIENRPG.SkillmedicalAid = 'Medicine'
$j.ALIENRPG.SignatureItem = 'Drive'
$j.ALIENRPG.PersonalAgenda = 'Issues'
$j.ALIENRPG.Skillcommand = 'Leadership'
$j.ALIENRPG.Relationships = 'Anchors'
$j.ALIENRPG.relOne = 'PC Anchor'
$j.ALIENRPG.relTwo = 'NPC Anchor'
$j.ALIENRPG.Black = 'Skill'
$j.ALIENRPG.Yellow = 'Stress'
$j.ALIENRPG.Items = 'Gear'
$j.ALIENRPG.InventoryItemsHeader = 'Gear'
$j.ALIENRPG.Ones = 'Walkers: '
$j.ALIENRPG.rollStress = 'Walker'
$j | ConvertTo-Json -Depth 32 | Set-Content $filename

$filename = "$destPath\module\actor\actor-sheet.js"
$c = Get-Content $filename
$c = $c.Replace("'system.header.health.max': (aData.attributes.str.value + aData.header.health.mod)", "'system.header.health.max': 3")
$c = $c.Replace("'system.header.health.calculatedMax': (aData.header.health.calculatedMax = aData.attributes.str.value + aData.header.health.mod)", "'system.header.health.calculatedMax': 3")
$c | Set-Content $filename
