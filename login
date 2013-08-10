local TGB
for _,side in pairs(redstone.getSides()) do
  if peripheral.getType(side)=="glassesbridge" or peripheral.getType(side)=="terminal_glasses_bridge" then
        TGB = peripheral.wrap(side)
		break
  end
end
if TGB==nil then
  print("Can't find Glasses Bridge!")
end
os.sleep(.001)
TGB.clear()
login = false
local border = TGB.addBox(5,3,200,2,gray,1)
local border = TGB.addBox(5,83,200,2,gray,1)
local border = TGB.addBox(3,3,2,82,gray,1)
local border = TGB.addBox(203,3,2,82,gray,1)
local object1 = TGB.addBox(5, 5, 198, 78, lightGray, 0.85)
local header = TGB.addText(9, 9, "Login", aqua)
local name = TGB.addText(9, 30, "Name - $$name", black)
name.setZIndex(1)
header.setZIndex(1)
header.setScale(2)
while not login do
local e, msg = os.pullEvent()
if e == "chat_command" then
lname = msg
if fs.exists("red/glass/usr/"..lname) then
local password = TGB.addText(9, 48, "Password - $$password", black)
password.setZIndex(1)
local f, msg1 = os.pullEvent()
if f == "chat_command" then
lpass = msg1
end
file = io.open("red/glass/usr/"..lname)
cpass = file : read()
file : close()
if cpass == lpass then
login = true
shell.run("red/glass/loggedin")
else
local message = TGB.addText(9, 39, "Wrong password!", red)
os.sleep(1)
shell.run("red/glass/login")
end
else
local message = TGB.addText(9, 39, "User not found!", red)
os.sleep(1)
shell.run("red/glass/login")
end
end
end
