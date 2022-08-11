local w,h = term.getSize()

local function download(fileName)
    local content = http.get(repo..branch..fileName).readAll()
    local f = fs.open(fileName, "w")
    f.write(content)
    f.close()
end

term.clear()
term.setCursorPos(1,1)

