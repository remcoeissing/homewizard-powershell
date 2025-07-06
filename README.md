# HomeWizard PowerShell

This repository contains PowerShell scripts to interact with the HomeWizard devices via the [Local API](https://api-documentation.homewizard.com/docs/introduction).

## Authorization

In order to create a local user and get an authorization token you can utilize `New-HomeWizardLocalUser.ps1 -DeviceIP 'IP address of HomeWizard device' -Username 'your local username'`. A local user can only be created by pressing the button on the device. In order to allow time to press the button on the device the code will loop and try every 5 seconds till the request succeeds. Store the returned Bearer token safely as you use it for all the other operations.

## Set-HomeWizardLightBrightness

One of my personal annoyances is that the P1 meter always has the green ring turned on. Its within the electricity cupboard which is closed anyway, so it doesn't offer any value. Luckily we can turn it off via the API by setting the brightness level to 0. `Set-HomeWizardLightBrightness -DeviceIP 'IP address of P1 meter' -Bearer 'Token of your local user' -LightBrightness 0`
