local libraryList = {
	"bit32", "coroutine", "debug", "math", "os", "string", "table", "utf8",

	--"Axes", "BrickColor", "CFrame", "Color3", "ColorSequence", "ColorSequenceKeypoint", "DateTime",
	--"DockWidgetPluginGuiInfo", "Faces", "Instance", "NumberRange", "NumberSequence", "NumberSequenceKeypoint", 
	--"PathWaypoint", "PhysicalProperties", "Random", "Ray", "RaycastParams", "Rect", "Region3", "Region3int16",
	--"TweenInfo", "UDim", "UDim2", "Vector2", "Vector2int16", "Vector3", "Vector3int16"
}

local LIBRARY_FORMAT_STRING = [[%s\\.(?:%s)]]
local SCOPE_FORMAT_STRING = [[\\b(%s)\\b]]

local constantsList = {}
local namesList = {}

for _, libraryName in ipairs(libraryList) do
	local library = loadstring("return "..libraryName)()
	if not library then
		print(libraryName)
		return
	end
	
	local names = {}
	local consts = { libraryName }

	for name, thing in pairs(library) do
		if type(thing) == "function" then
			names[#names + 1] = name
		else
			consts[#consts + 1] = string.format([[%s\\.%s]], libraryName, name)
		end
	end
	
	table.sort(names)
	table.sort(consts)	
	
	constantsList[#constantsList + 1] = table.concat(consts, "|")
	namesList[#namesList + 1] = string.format(LIBRARY_FORMAT_STRING, libraryName, table.concat(names, "|"))
end

local namesScript = Instance.new("ModuleScript")
namesScript.Name = "NAMES_LIST"
namesScript.Source = string.format(SCOPE_FORMAT_STRING, table.concat(namesList, "|"))
--namesScript.Parent = workspace

local constScript = Instance.new("ModuleScript")
constScript.Name = "CONST_LIST"
constScript.Source = string.format(SCOPE_FORMAT_STRING, table.concat(constantsList, "|"))
--constScript.Parent = workspace

local plugin = PluginManager():CreatePlugin()
plugin:OpenScript(namesScript)
plugin:OpenScript(constScript)