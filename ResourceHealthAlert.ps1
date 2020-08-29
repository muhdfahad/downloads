# Enter ResourceGroup, ActionGroup, multiple Regions if any and multiple services to get alert notifications on
$activityLogAlertName = "ResourceHealthAlert4"
$resourceGroup = "action-rg-mf"
$actionGroupName = "serviceHealthActionGroup"
 
$monitorResourceGroups = @(
                    "action-rg-mf",
                    "nb-test-rg"
                    )      

$currentResourceStatus = @(
                    "Degraded",
                    "Unavailable"
                    )                        
 
$params = @{
    ActivityLogAlertName = $activityLogAlertName
    ActionGroupName = $actionGroupName
    MonitorResourceGroups = $monitorResourceGroups    
    CurrentResourceStatus = $currentResourceStatus
}
 
New-AzResourceGroupDeployment `
    -Name "Azure-Resource-Notification" `
    -ResourceGroupName $resourceGroup `
    -TemplateFile "ResourceHealthAlert.json" `
    -TemplateParameterObject $params