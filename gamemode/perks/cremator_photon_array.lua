PERK.PrintName = "Photon Array"
PERK.Description = "Immune to Fire damage.\nAbsorb {1} of Fire damage taken as health."
PERK.Icon = "materials/perks/photon_array.png"
PERK.Params = {
    [1] = {value = 0.06, percent = true},
}

PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("cremator_photon_array")  then return end
    if dmginfo:GetDamageType() == DMG_BURN or dmginfo:GetDamageType() == DMG_SLOWBURN then
        bonus.resistance = bonus.resistance + 1.00
        if dmginfo:GetDamage() > 0 then
            HORDE:OnPlayerHeal(ply, HealInfo:New({amount=dmginfo:GetDamage() * 0.06, healer=ply}))
        end
    end
end