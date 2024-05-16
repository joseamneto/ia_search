$body = @{
    model = "model-identifier"
    messages = @(
        @{ role = "system"; content = "Always answer in rhymes." }
        @{ role = "user"; content = "Introduce yourself." }
    )
    temperature = 0.7
    max_tokens = -1
    stream = $true
}

$bodyJson = $body | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:1234/v1/chat/completions" `
    -Method Post `
    -ContentType "application/json" `
    -Body $bodyJson
