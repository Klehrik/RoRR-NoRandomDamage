-- No Random Damage v1.0.2
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")

local damage_real = nil



-- ========== Main ==========

gm.pre_script_hook(gm.constants.damager_calculate_damage, function(self, other, result, args)
    damage_real = args[4].value
end)

gm.pre_script_hook(gm.constants.damage_inflict, function(self, other, result, args)
    damage_real = args[2].value
end)

gm.pre_script_hook(gm.constants.draw_damage, function(self, other, result, args)
    if damage_real then
        args[3].value = damage_real
        damage_real = nil
    end
end)