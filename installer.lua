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
paintutils.drawLine(w / 2 - 10, h / 2 - 1, w / 2 + 10, h / 2 - 1)
paintutils.drawLine(w / 2 - 10, h / 2 + 1, w / 2 + 10, h / 2 + 1)

