## save this script in the same directory as the file into which UUIDs are being replaced
## adjust input and output filenames

## run script:

## powershell -noexit .\x.ps1

$inputFilename = "x.js"
$outputFilename = "y.js"

$text = [string]::join([environment]::newline, (get-content -path $inputFilename))

$sbNew = new-object system.text.stringBuilder

$lastStart = 0

$null = ([regex]::matches($text, "[a-fA-F0-9]{8}-([a-fA-F0-9]{4}-){3}[a-fA-F0-9]{12}") | %{
    $sbNew.Append($text.Substring($lastStart, $_.Index - $lastStart))
    $guid = [system.guid]::newguid()
    $sbNew.Append($guid)
    $lastStart = $_.Index + $_.Length
})

$null = $sbNew.Append($text.Substring($lastStart))

$sbNew.ToString() | out-file -encoding ASCII $outputFilename
