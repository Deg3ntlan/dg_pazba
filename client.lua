local blockMelee = true

RegisterCommand("pažba", function()
    blockMelee = not blockMelee
    if blockMelee then
    lib.notify({
        id = 'degentlan_pazba',
        title = 'Pažba',
        description = 'Útok pažbou je zakázán!',
        showDuration = false,
        position = 'top-right',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
             color = '#909296'
            }
        },
        icon = 'gun',
        iconColor = 'FF6820A3'
    })
    else
    lib.notify({
        id = 'degentlan_pazba',
        title = 'Pažba',
        description = 'Útok pažbou je povolen!',
        showDuration = false,
        position = 'top-right',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
             color = '#909296'
            }
        },
        icon = 'gun',
        iconColor = 'FF6820A3'
    })
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if blockMelee then
            local playerPed = PlayerPedId()
            if IsPedArmed(playerPed, 4) then
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
            end
        end
    end
end)
