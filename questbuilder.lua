-- Quest Generator

local questtypes = { "find", "rescue", "defeat", "collect" }
local enemytypes = { "goblin", "troll", "skeleton", "zombie", "ogre", "demon", "dragon", "slime", "golem", "bug" }
local passivetypes = { "goat", "dog", "frog", "merchant", "noble" }
local items = { "gold coin", "apple", "shovel", "sword", "ring", "hat!" }
local questlog = {} -- contains quests :P

local running = true
while(running)
do
	local input = io.read()
	if(input == 'q') then
		running = false
		return
	end
	if(input == 'a') then
		local q = buildrandomquest()
		questlog[#questlog + 1] = q
		printquest(q)
		return
	end
end

function printquest(quest)
	return quest[1].." \nREWARD: "..quest[2].."\n STATUS: "..(quest[3] and "COMPLETED" or "INCOMPLETE")
end

function buildrandomquest()
	local qtype = getrandom(questtypes)
	local task = ""
	local reward = getrandom(items)
	if qtype == "find" then
		task = "Find a missing "..getrandom({passivetypes, items}).."."
	elseif qtype == "rescue" then
		task = "Rescue a "..getrandom(passivetypes).." from a "..getrandom(enemytypes).."!"
	elseif qtype == "defeat" then
		task = "Defeat a "..getrandom(enemytypes).."."
	else -- collect
		task = "Collect "..math.random(100).." "..getrandom(enemytypes).."(s)."
	end

	return {task, reward, false}
end

function getrandom(tab)
	return tab[math.random(#tab)]
end

-- defeat a...
-- save a...
-- find a...
-- collect X...

-- Enemy Modifiers: Giant, Scary, Enraged, Monsterous, Perceptive, Lame, Man-Eating
-- Enemies: Goblin, Troll, Skeleton, Zombie, Ogre, Demon, Dragon, Slime, Golem, Bug
-- NPCs: Princess, Goat, Dog, Frog, Merchant
-- Items: Gold, Apple, Shovel, Sword, Mysterious Ring, Really Cool Hat

-- Quest System
-- Quest log:
--     Quest:
--         Description:
--         Task(s):
--         completion status
--            complete
--            incomplete
--         Reward:
--     Quest:
--         Description:
--         Task(s):
--         completion status
--            complete
--            incomplete
--         Reward:


-- add/remove/edit Quests

-- io.write("Hello, what is your name? ")
-- local name = io.read()
-- io.write("Nice to meet you, ", name, "!\n")
