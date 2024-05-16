# Define the number of times to run the script
$iterations = 100
# Define the path to the script you want to run
$scriptPath = "C:\projects\calltolmstudio1.ps1"

# Array to hold job objects
$jobs = @()

# Start the jobs
for ($i = 1; $i -le $iterations; $i++) {
    $jobs += Start-Job -ScriptBlock {
        try {
            # Run the script
            & $using:scriptPath
        } catch {
            Write-Error "Error during job:"
        }
    }
}

# Wait for all jobs to complete
$jobs | ForEach-Object { $_ | Wait-Job }

# Retrieve job results
$jobs | ForEach-Object {
    if ($_.State -eq 'Completed') {
        Receive-Job -Job $_
    } else {
        Write-Error "Job failed: "
    }
}

