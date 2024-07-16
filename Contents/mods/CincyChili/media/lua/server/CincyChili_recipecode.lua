require "recipecode"

function Recipe.OnCreate.MakeCincyChiliPlate(items, result, player)
    local addType = "Base.Pot"
    local condition = 10;
	local canCount = 1;
    for i=0,items:size() - 1 do
        local item = items:get(i)
        if item:getType() == "WaterPotPasta" or item:getType() == "WaterSaucepanPasta" or item:getType() == "PastaPan" or item:getType() == "PastaPot" or item:getType() == "PastaBowl" then
            condition = item:getCondition()
            if string.contains(item:getType(), "Pan") or string.contains(item:getType(), "Saucepan") then
                addType = "Base.Saucepan"
			elseif string.contains(item:getType(), "Bowl") then
				addType = "Base.Bowl"
			end
        elseif item:getType() == "OpenBeans" then
			canCount = canCount + 1
		end
    end
	--give player the cooking item that contained the pasta
    local pot = player:getInventory():AddItem(addType);
    pot:setCondition(condition)
	
	--give player the empty cans
	for i=1,canCount,1 do
		player:getInventory():AddItem("Base.TinCanEmpty");
	end
end
