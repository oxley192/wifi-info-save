i = 1
i2 = "01"

x = 0
y = 20

hi1 = {}
hi2 = {}


if files.exists("host0:") then
path = "host0:/network_info.txt"
else if files.exists("uma0:") then
path = "uma0:/network_info.txt"
else
path = "ux0:/network_info.txt"
end
end

file = io.open(path,"w")

file:write("UTF-8")
file:write("\n")

while os.getreg("/CONFIG/NET/"..i2.."/WIFI/","ssid",2) != "" do

hi1[i] = os.getreg("/CONFIG/NET/"..i2.."/WIFI/","ssid",2)
hi2[i] = os.getreg("/CONFIG/NET/"..i2.."/WIFI/","wpa_key",2)

screen.print(0,x,hi1[i],1)
screen.print(0,y,hi2[i],1)

file:write("Name : "..hi1[i].."\n")

if hi2[i] == "" then
file:write("Not Password, Free Network\n")
else
file:write("Password : "..hi2[i].."\n")
end

file:write("\n")

i = i + 1

if i < 10 then
i2 = "0"..i
else
i2 = i
end

screen.flip()

if os.getreg("/CONFIG/NET/"..i2.."/WIFI/","ssid",2) == "" then
file:close()

while true do
buttons.read()

screen.print(0,0,"Save File : "..path,1)
screen.print(0,20,"Press Start to exit",1)
screen.flip()

if buttons.start then
os.exit()
end

end

end

end
