# Ref: https://stackoverflow.com/questions/20108886/scheduled-task-with-daily-trigger-and-repetition-interval/34365268

# Review question 3. Reference solution
### TYPE THESE COMMANDS MANUALLY IN YOUR POWERSHELL ###

# 3.1 Create a task named MyDailyRoutine 

# Location of Scripts(!!!change the location to yours!!!):
$psscript = "C:\Users\$env:USERNAME\Documents\its372\lab04\backup.ps1"

# Create New Scheduled Task: MyDailyRoutine
$name = "MyDailyRoutine"
$action = New-ScheduledTaskAction -Execute "Powershell" -Argument "-WindowStyle Hidden `"$psscript`""
$trigger = New-ScheduledTaskTrigger -Once -At $(Get-Date)  -RepetitionInterval  (New-TimeSpan -Minutes 1) # -RepetitionDuration  (New-TimeSpan -Days 36500) 
$settings = New-ScheduledTaskSettingsSet -Hidden -Disable
$ST = New-ScheduledTask -Action $action -Trigger $trigger -Settings $settings

# Register task MyDailyRoutine in Task Scheduler
Register-ScheduledTask  $name -InputObject $ST

# Get MyDailyRoutine status
 Get-ScheduledTask -TaskName $name

# Enable  MyDailyRoutine, find it in Task Scheduler
Enable-ScheduledTask -TaskName $name

# 3.2 verify the scheduled task is triggered as expected, 
# pay attention to the backup folder to see archives generate every minute

# 3.3 delete the scheduled task
Disable-ScheduledTask -TaskName $name
Unregister-ScheduledTask -TaskName $name

# check it is deleted from Task scheduler, and NOT found by the following command
get-ScheduledTask -TaskName $name