-- Quest Generator
--

function printhelp()
	local line = "--------\n"
	local a = "a or add - add in a new quest.\n"
	local c = "c or complete - complete quest by id.\n"
	local r = "r or remove - remove quest by id.\n"
	local q = "q or quit - exit program.\n"
	local h = "h or help - print help menu.\n"
	io.write(line..h..a..c..r..q..line);
end

function printquest(quest, id)
	local line = "--------\n"
	local idtext = "QUEST ID: "..id.."\n"
	local questtext = quest[1].."\n"
	local rewardtext = "REWARD: "..quest[2].."\n"
	local statustext = "STATUS: "..(quest[3]).."\n"
	local text = line..idtext..questtext..rewardtext..statustext..line
	--"--------\nQUEST ID: " ..id.."\n" ..quest[1].."\n" .."REWARD: "..quest[2].."\n" .."STATUS: "..(quest[3] and "COMPLETED" or "INCOMPLETE\n--------\n"
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

	return {task, reward, "INCOMPLETE"}
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

printhelp()

while(running)
do
	local input = io.read()
	if(input == "quit" or input == "q") then
		running = false
		return
	elseif(input == "add" or input == "a") then
		local q = buildrandomquest()
		questlog[#questlog + 1] = q
		for i, v in pairs(questlog) do
			printquest(v, i)
		end
	elseif(input == "remove" or input == "r") then
		io.write("Remove which quest? ID: ")
		input = io.read()
		local num = tonumber(input)
		table.remove(questlog, num)
		for i, v in pairs(questlog) do
			printquest(v, i)
		end
	elseif(input == "complete" or input == "c") then
		io.write("Complete which quest? ID: ")
		input = io.read()
		local num = tonumber(input)
		questlog[num][3] = "COMPLETE"
		for i, v in pairs(questlog) do
			printquest(v, i)
		end
	elseif(input == "help" or input == "h") then
		printhelp()
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
