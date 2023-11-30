
$string = "123456111234AppleBananaBlueberryGrapeOrangeStrawberry133334123456BlueGreenOrangePurpleRedYellow1234561234BushrunnerTreeVine1234FallSpringSummerWinter"
 
#get sha-256 hash of string
$sha256 = [System.Security.Cryptography.HashAlgorithm]::Create("sha256")
$hash = $sha256.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($string))
$hashString = [System.BitConverter]::ToString($hash).Replace("-", "")
write-host "Hash: $hashString"
