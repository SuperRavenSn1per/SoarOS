local w,h = term.getSize()

local repo = "https://raw.githubusercontent.com/SuperRavenSn1per/SoarOS/"
local branch = "main/"

local d = true

local dirs = {}
local files = {"startup.lua"}

local function download(fileName)
    local content = http.get(repo..branch..fileName).readAll()
    local f = fs.open(fileName, "w")
    f.write(content)
    f.close()
end


fs.makeDir("SoarOS")
fs.makeDir("SoarOS/Accounts")
term.setBackgroundColor(colors.lightBlue)
term.clear()
term.setCursorPos(1,1)
paintutils.drawLine(1,1,w,1,colors.blue)
paintutils.drawFilledBox(2,3,w-1,h-1,colors.blue)
term.setCursorPos(w / 2 - string.len("SoarOS Installer") / 2, 1)
write("SoarOS Installer")
paintutils.drawLine(w / 2 - 10, h / 2, w / 2 + 10, h / 2, colors.lightBlue)
paintutils.drawLine(w / 2 - 10, h / 2 + 3, w / 2 + 10, h / 2 + 3, colors.lightBlue)
term.setBackgroundColor(colors.blue)
term.setCursorPos(w / 2 - string.len("Account Creation") / 2, 4)
write("Account Creation")
term.setCursorPos(w / 2 - string.len("Username:") / 2, h / 2 - 1)
write("Username:")
term.setCursorPos(w / 2 - string.len("Password:") / 2, h / 2 + 2)
write("Password:")
term.setBackgroundColor(colors.green)
term.setCursorPos(w / 2 - string.len(" Create Account ") / 2, h / 2 + 5)
write(" Create Account ")
term.setBackgroundColor(colors.lightBlue)
term.setCursorPos(w / 2 - 10, h / 2)
local username = read()
term.setCursorPos(w / 2 - 10, h / 2 + 3)
local password = read("*")
term.setBackgroundColor(colors.lime)
term.setCursorPos(w / 2 - string.len(" Create Account ") / 2, h / 2 + 5)
write(" Create Account ")

while true do
    local _, _, x, y = os.pullEvent("mouse_click")
    if x >= w / 2 - string.len(" Create Account ") / 2 - 1 and x <= w / 2 + string.len(" Create Account ") / 2 - 1 and y == math.floor(h / 2) + 5 then
       local u = fs.open("SoarOS/Accounts/"..username, "w")
       u.write(password)
       u.close()
       break
    end
end

term.setBackgroundColor(colors.lightBlue)
term.clear()
term.setCursorPos(1,1)
paintutils.drawLine(1,1,w,1,colors.blue)
paintutils.drawFilledBox(2,3,w-1,h-1,colors.blue)
term.setCursorPos(w / 2 - string.len("SoarOS Installer") / 2, 1)
write("SoarOS Installer")
term.setBackgroundColor(colors.blue)
term.setCursorPos(w / 2 - string.len("Installing...") / 2, 4)
write("Installing...")
for i,f in pairs(files) do
   download(f)
    term.setCursorPos(w / 2 - string.len("Current file: "..f) / 2, h / 2 + 1)
    print("Current file: "..f.." "..i.."/"..#files)
end
