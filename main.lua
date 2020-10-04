local LostNoD4	 = RegisterMod("Lost No D4", 1)

function LostNoD4:Debug(message)
    if message == nil then
        message = "received nil"
    end

    local msg = "[Lost Hope]: " .. message
	-- Isaac.DebugString(msg)
end

-- returns true if the player is The Lost
function LostNoD4:IsTheLost()
    local player = Isaac.GetPlayer(0)
    if player:GetPlayerType() == PlayerType.PLAYER_THELOST then
        --LostNoD4:Debug("I'm The Lost")
        return true
    end

    --	LostNoD4:Debug("I'm not The Lost")
    return false
end

-- MC_POST_UPDATE callback support
function LostNoD4:OnUpdate()

    -- we only care about The Lost
    if LostNoD4:IsTheLost() == false then
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
LostNoD4:AddCallback(ModCallbacks.MC_POST_UPDATE, LostNoD4.OnUpdate)
