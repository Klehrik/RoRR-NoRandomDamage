-- No Random Damage
-- Klehrik

local damage_real = nil



-- ========== Main ==========

-- gm.pre_script_hook(gm.constants.damager_calculate_damage, function(self, other, result, args)
--     damage_real = args[4].value
-- end)

-- Contribution by @randomcatdude (kris)
local ptr = gm.get_script_function_address(gm.constants.damager_calculate_damage)
memory.dynamic_hook_mid("NoRandomDamage", {"xmm0", "xmm1"}, {"double", "double"}, 0, ptr:add(0x481), function(args)
    args[1]:set(1.0)
    args[2]:set(1.0)
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