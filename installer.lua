local w,h = term.getSize()

local function download(fileName)
    local content = http.get(repo..branch..fileName).readAll()
    local f = fs.open(fileName, "w")
    f.write(content)
    f.close()
end

term.setBackgroundColor(colors.lightBlue)
term.clear()
term.setCursorPos(1,1)
paintutils.drawLine(1,1,w,1,colors.blue)
paintutils.drawFilledBox(2,3,w-1,h-1,colors.blue)
term.setCursorPos(w / 2 - string.len("SoarOS Installer") / 2, 1)
write("SoarOS Installer")
term.setCursorPos(w / 2 - string.len("Username:") / 2, h / 2 - 1)
print("Username:")
paintutils.drawLine(w / 2 - 10, h / 2, w / 2 + 10, h / 2)
term.setCursorPos(w / 2 - string.len("Password:") / 2, h / 2 + 1)
print("Password:")
paintutils.drawLine(w / 2 - 10, h / 2 + 2, w / 2 + 10, h / 2 + 2)

