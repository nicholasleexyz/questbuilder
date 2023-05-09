function printhelp()
	local line = "--------*--------*--------\n"
	local a = "a or add - add in a new quest.\n"
	local r = "r or remove - remove quest by id.\n"
	local q = "q or quit - exit program.\n"
	local total = {line, a, r, q}

	for i=1,#total do
		io.write(total[i])
	end
end

function printquest(quest, id)
	local line = "--------*--------*--------\n"
	local idtext = "QUEST ID: "..id.."\n"
	local questtext = quest
	local total = {line,idtext,questtext}
	for i=1, #total do
		io.write(total[i])
	end
end

function buildrandomquest()
	local qtype = getrandom(questtypes)
	local task = {}
	local reward = tostring(math.random(10)).." "..getrandom(items).."(s)"

	local passive = getrandom(passivetypes)
	local enemy = getrandom(enemytypes)
	local item = getrandom(items)
	local num = tostring(math.random(10))
	local passiveoritem = (math.random(2) % 2 == 0 and passive or item)

	if qtype == "find" then
		task = {"Find a missing ", passiveoritem, ".\n"}
	elseif qtype == "rescue" then
		task = {"Rescue a ", passive, " from a ", enemy, "!\n"}
	elseif qtype == "defeat" then
		task = {"Defeat a ", enemy, ".\n"}
	else -- collect
		task ={"Collect ", num, " ", getrandom(items), "(s).\n"}
	end
	table.insert(task,"REWARD: ")
	table.insert(task,reward)
	table.insert(task,"\n")
	local val = table.concat(task)

	return val
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

os.execute("clear")
printhelp()

while(running)
do
	local input = io.read()
	if(input == "quit" or input == "q") then
		running = false
		return
	elseif(input == "add" or input == "a") then
		os.execute("clear")
		local q = buildrandomquest()
		questlog[#questlog + 1] = q
		for i=1, #questlog do
			printquest(questlog[i], i)
		end
	elseif(input == "remove" or input == "r") then
		io.write("Remove which quest? ID: ")
		input = io.read("*n")
		os.execute("clear")
		local num = tonumber(input)
		table.remove(questlog, num)
		for i, v in pairs(questlog) do
			printquest(v, i)
		end
	end
	printhelp()
end
