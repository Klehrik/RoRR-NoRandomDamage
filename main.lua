-- No Random Damage v1.0.0
-- Klehrik

log.info("Successfully loaded ".._ENV["!guid"]..".")

local damage_real = 0.0



-- ========== Main ==========

gm.pre_script_hook(gm.constants.damager_calculate_damage, function(self, other, result, args)
    damage_real = args[4].value
end)

gm.pre_script_hook(gm.constants.draw_damage, function(self, other, result, args)
    args[3].value = damage_real
end)