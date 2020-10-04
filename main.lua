local LostHope = RegisterMod("Lost Hope", 1)

function LostHope:Debug(message)
    if message == nil then
        message = "received nil"
    end

    local msg = "[Lost Hope]: " .. message
	-- Isaac.DebugString(msg)
end

-- returns true if the player is The Lost
function LostHope:IsTheLost()
    local player = Isaac.GetPlayer(0)
    if player:GetPlayerType() == PlayerType.PLAYER_THELOST then
        --LostHope:Debug("I'm The Lost")
        return true
    end

    --	LostHope:Debug("I'm not The Lost")
    return false
end

-- MC_POST_UPDATE callback support
function LostHope:OnUpdate()

    -- we only care about The Lost
    if LostHope:IsTheLost() == false then
        return
    end

    -- Beginning of run initialization, modify Lost's items
    if Game():GetFrameCount() == 1 then
        local player = Isaac.GetPlayer(0)

	if player:GetActiveItem() == CollectibleType.COLLECTIBLE_D4 then
	    player:RemoveCollectible(CollectibleType.COLLECTIBLE_D4)
	end
    end
end
LostHope:AddCallback(ModCallbacks.MC_POST_UPDATE, LostHope.OnUpdate)
