local LostNoD4	 = RegisterMod("Lost No D4", 1)

-- returns true if the player is The Lost
function LostNoD4:IsTheLost()
    local player = Isaac.GetPlayer(0)
    if player:GetPlayerType() == PlayerType.PLAYER_THELOST then
        return true
    end

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
