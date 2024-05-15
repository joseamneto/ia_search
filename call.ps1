# Define the API endpoint
$apiEndpoint = "http://localhost:1234/v1/chat/completions"

# Define the JSON payload
$jsonPayload = @{
    model = "TheBloke/phi-2-GGUF"
    messages = @(
        @{ role = "system"; content = "Always answer in rhymes." },
        @{ role = "user"; content = "Introduce yourself." }
    )
    temperature = 0.7
    max_tokens = -1
    stream = $true
} | ConvertTo-Json -Compress

# Make the API call
try {
    $response = Invoke-RestMethod -Uri $apiEndpoint -Method Post -ContentType "application/json" -Body $jsonPayload
    # Output the response
    $response
} catch {
    # Handle errors
    Write-Error "Error calling API: $($_)"
}
