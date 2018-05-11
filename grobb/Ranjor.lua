function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18790)) then
		e.other:Message(15,"As your eyes adjust to the darkness, a large troll decked out in grimy metal armor turns towards you. 'I be Ranjor. You look weak now but mebbe me can make you strong! You read note in inventory and hand to me to start training!'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ya wanna be a member a Da Bashers. duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya. ya big. ugly peece o' meet.  Ya [willin ta test] or duz I just eats ya now?");
	elseif(e.message:findi("willin ta test")) then
		e.self:Say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18790})) then -- Tattered Note
		e.self:Say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
		e.other:Ding();
		e.other:SummonItem(13528);  -- Mud Covered Tunic
		e.other:Faction(66,100,0);  	-- Da Basher
		e.other:Faction(22,-15,0);  -- Broken Skull Clan
		e.other:AddEXP(100);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13187, item2 = 13187, item3 = 13409})) then -- Now correctly taking two tadpole flesh and 1 froglok meat -cr0ss
		-- Whoever made this fucking sucked at it. Was giving absurd rewards for nothing. -cr0ss
		e.self:Say("Raar.. Ranjor give yous a good weapon...");
		e.other:Ding();
		e.other:AddEXP(10);
		e.other:SummonItem(5025); -- Rusty Two Handed Battle Axe -- correct now -cr0ss
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:grobb  ID:40024 -- Ranjor 

