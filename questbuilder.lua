-- Quest Generator
--

function printquest(quest, id)
	local text = "--------\nQUEST ID: "..id.."\n"..quest[1].." \nREWARD: "..quest[2].."\n STATUS: "..(quest[3] and "COMPLETED" or "INCOMPLETE\n--------\n")
	io.write(text)
end

function buildrandomquest()
	local qtype = getrandom(questtypes)
	local task
	local reward = getrandom(items)
	if qtype == "find" then
		task = "Find a missing "..getrandom({passivetypes, items}).."."
	elseif qtype == "rescue" then
		task = "Rescue a "..getrandom(passivetypes).." from a "..getrandom(enemytypes).."!"
	elseif qtype == "defeat" then
		task = "Defeat a "..getrandom(enemytypes).."."
	else -- collect
		task = "Collect "..math.random(10).." "..getrandom(items).."(s)."
	end

	return {task, reward, false}
end

function getrandom(tab)
	return tab[math.random(#tab)]
end

questtypes={"find", "rescue", "defeat", "collect"}
enemytypes={"goblin", "troll", "skeleton", "zombie", "ogre", "demon", "dragon", "slime", "golem", "bug"}
passivetypes={"goat", "dog", "frog", "merchant", "noble"}
items={"gold coin", "apple", "shovel", "sword", "ring", "hat!"}
running = true
questlog = {} -- contains quests :P

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
		for i, v in pairs(questlog) do
			printquest(v, i)
		end
	end
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
