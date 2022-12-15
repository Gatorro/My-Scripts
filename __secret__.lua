if not game:IsLoaded()then game.Loaded:Wait()end
ownerUser = game.HttpService:JSONDecode(readfile("OWNER.name"))[1]

-- test ver 2

--#################--
---- RUN CHECKER ----
if game.Players.LocalPlayer.Name == ownerUser then return script:Destroy() end
---- RUN CHECKER ----
--#################--
--Antiafk
local vu = game:GetService("VirtualUser")game:GetService("Players").LocalPlayer.Idled:connect(function()vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)wait(1)vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)end)
--
function ChatEvent(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(msg), "All")
end
print("BOTS.lua")
whitelist = {ownerUser}
repeat wait(0.1) until game.Players[whitelist[1]]
repeat wait(0.1) until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[whitelist[1]].Character.HumanoidRootPart.CFrame
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("[Signum] Bot Loaded.", "All")
local players, replicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage");
local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents");
local onMessageDoneFiltering = defaultChatSystemChatEvents:FindFirstChild("OnMessageDoneFiltering");

local permWhitelist = {}
local HTTP = game:FindService("HttpService")
writefile("permwhitelist.json", game.HttpService:JSONEncode({ownerUser}))
if isfile("permwhitelist.json") then permWhitelist = HTTP:JSONDecode(readfile("permwhitelist.json")) end
local casinowl = {ownerUser}
local owner = game.Players[whitelist[1]].DisplayName
local money = 0
local canChat=true
local prefix = "."
local commandThreads = {}
local threadLoops = {["SaySpam"]=true,["Jump"]=true,["Orbit"]=true,["Follow"]=true,["Test"]=true}
--------------------------
local manualIndexes = {["CpBJm"]=1,["PtlBC"]=2,["cqpkY"]=3,["DWbNZ"]=4,["VtZoD"]=5}
local BotIndex : number = manualIndexes[game.Players.LocalPlayer.Name]
-------------------------Type A      Type A      Type P      Type P      Type P
function countBots()
    local count = 0
    for i,v in pairs(game:GetService('Players'):GetChildren()) do
        for i,_ in pairs(manualIndexes) do
            if i == v.Name then
                count+=1
            end
        end
    end
    return count
end

function predictname(NameVariable : string)
    local Table = game.Players:GetChildren()
    for i,v in pairs (Table) do
        if NameVariable == "me" then
            return ownerUser;
        elseif string.find(string.lower(v.Name), string.lower(NameVariable)) then
            return v.Name
        elseif string.find(string.lower(v.DisplayName), string.lower(NameVariable)) then
            return v.Name
        end
    end
end
function playAnimation(id)
    local animation = Instance.new("Animation")
    animation.AnimationId = "http://www.roblox.com/asset/?id="..tostring(id)
    local animationTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)
    animationTrack:Play()
end
function r15(player : userdata)
    if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        return true
    else
        return false
    end
end
function r6(player : userdata)
    if player.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        return true
    else
        return false
    end
end
local OnClientEvent
__main = onMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
    local speaker, message = players[messageData.FromSpeaker], messageData.Message
    
    function AddCmd(commandV)
        local firstStr = string.sub(message,1,1)
        if string.match(firstStr,"%p") then
            return string.match(message,"^%"..prefix..tostring(commandV))
        else
            return string.match(message,"^"..prefix..tostring(commandV))
        end
    end
    --whole_whitelist = {table.unpack(whitelist),table.unpack(permWhitelist)}
    whole_whitelist={}
    for _,v1 in pairs(whitelist) do
        for _,v2 in pairs(permWhitelist) do
            for _,v3 in pairs(casinowl) do
                table.insert(whole_whitelist,v1)
                table.insert(whole_whitelist,v2)
                table.insert(whole_whitelist,v3)
                break
            end
        end
    end
    for _,v in pairs(whole_whitelist) do
        if speaker.Name == v then
            if AddCmd("follow") then
                local cmd0 = string.split(message," ")[2]
                if cmd0 ~= "random" and cmd0 ~= nil then
                    cmd = predictname(cmd0)
                elseif cmd0=="random" then
                    local Table = game.Players:GetChildren()
                    cmd = tostring(Table[math.random(1,#Table)])
                elseif cmd0 == nil then
                    cmd = speaker.Name
                end
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Following: "..cmd, "All")
                threadLoops["Follow"] = false
                local thread = coroutine.create(function()
                    while true do 
                        local Target = game.Players[cmd]
                        local Humanoid = game.Players.LocalPlayer.Character.Humanoid;
                        Humanoid.MoveTo(Humanoid, Target.Character.HumanoidRootPart.Position);
                        if threadLoops["Follow"] == true then coroutine.yield() end;task.wait(0.06)
                    end
                end)
                coroutine.resume(thread)
            end
            if AddCmd("unfollow") then
                threadLoops["Follow"]=true
            end
            if AddCmd("speed") then
                local Args = string.split(message," ")[2]
                if tonumber(Args) then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Args)
                end
            end
            if AddCmd("reset") then
                game.Players.LocalPlayer.Character.Head:Destroy()
            end
            if AddCmd("hre") then
                game.Players.LocalPlayer.Character.Humanoid:Destroy()
            end
            if AddCmd("copychat") then
                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Copychat is Toggled..", "All")
                local Args = string.split(message," ")[2]
                if canChat then
                    CopyChatListener=onMessageDoneFiltering.OnClientEvent:Connect(function(messageData2)
                        local speaker2, message2 = players[messageData2.FromSpeaker], messageData2.Message
                        for _,v2 in pairs(whole_whitelist) do
                            if speaker2.Name == v2 and speaker2.Name ~= game.Players.LocalPlayer.Name then
                                --game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(v), "All")
                                print("copychat on")
                                game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(message2), "All")
                                break
                            end
                        end
                    end)
                    canChat=false
                    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("CanChat: True", "All")
                else
                    CopyChatListener:Disconnect()
                    canChat=true
                end
            end
            if AddCmd("bring") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[speaker.Name].Character.HumanoidRootPart.CFrame
            end
            if AddCmd("to") or AddCmd("goto") then --to command
                local Args = predictname(tostring(string.split(message," ")[2]))
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[Args].Character.HumanoidRootPart.CFrame
            end                
            if AddCmd("rj") or AddCmd("rejoin") or AddCmd("upgrade") then
                game.Players.LocalPlayer.Character.Parent = nil
                local Players = game.Players
                local GetPlayers=Players.GetPlayers
                local TeleportService = game:GetService("TeleportService")
                ChatEvent("Rejoining!")
                if (#GetPlayers(Players) == 1) then
                    LocalPlayer:Kick();
                    TeleportService.Teleport(TeleportService, game.PlaceId);
                else
                    TeleportService.TeleportToPlaceInstance(TeleportService, game.PlaceId, game.JobId)
                end
            end
            if AddCmd("jump") then
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
            if AddCmd("sit") then
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
            end
            if AddCmd("noclip") then
                local Noclip = nil
                local Clip = nil
                
                function noclip()
                	Clip = false
                	local function Nocl()
                		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                					v.CanCollide = false
                				end
                			end
                		end
                		wait(0.21) -- basic optimization
                	end
                	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
                end
                
                function clip()
                	if Noclip then Noclip:Disconnect() end
                	Clip = true
                end
                
                noclip() -- to toggle noclip() and clip()
            end
            if AddCmd("antifling") then
            end
            if AddCmd("antiragdoll") then
                game.Players.LocalPlayer.Character["Falling down"]:Destroy()
                game.Players.LocalPlayer.Character.Swimming:Destroy()
                game.Players.LocalPlayer.Character.StartRagdoll:Destroy()
                game.Players.LocalPlayer.Character.FirstPerson:Destroy()
                game.Players.LocalPlayer.Character.Pushed:Destroy()
                game.Players.LocalPlayer.Character.KillScript:Destroy()
                game.Players.LocalPlayer.Character.RagdollMe:Destroy()
                game.Players.LocalPlayer.Character["RagdollConstraints"]:Destroy()
                game.Players.LocalPlayer.Character["Ragdoll fall-StarterCharacterScripts"]:Destroy()
            end
            if AddCmd("whitelist") then -- whitelist command
                if speaker.Name == whitelist[1] then
                    local Args = tostring(string.split(message," ")[2])
                    local Args1 = predictname(tostring(string.split(message," ")[3]))
                    if Args == "add" then
                        table.insert(whitelist,Args1)
                        ChatEvent(Args1..' Added to whitelist. Say ".cmds" ', "All")
                    elseif Args == "list" then
                        local thelist = tostring(table.concat(whitelist,", "))
                        local thepermlist = tostring(table.concat(permWhitelist,", "))
                        local thecasinolist = tostring(table.concat(casinowl,", "))
                        ChatEvent("Whitelisted Users: "..thelist, "All")
                        ChatEvent("Perm Whitelisted Users: "..thepermlist, "All")
                        ChatEvent("Casino Access Users: "..thecasinolist, "All")
                    elseif Args == "permadd" then
                        table.insert(permWhitelist, Args1)
                        ChatEvent("Perm Whitelisted: "..Args1)
                        writefile("permwhitelist.json", HTTP:JSONEncode(permWhitelist))
                    elseif Args == "clear" then
                        writefile("permwhitelist.json",'["'..ownerUser..'"]')
                        whitelist = {ownerUser}
                        permWhitelist = {ownerUser}
                        ChatEvent("Whitelist Cleared.")
                    end
                end
            end
            if AddCmd("blacklist") then
                local Args = predictname(tostring(string.split(message," ")[2]))
                local find = table.find(whitelist,Args)
                local find2 = table.find(permWhitelist,Args)
                if tostring(find2) ~= "nil" or tostring(find) ~= "nil" then
                    table.remove(whitelist,find)
                    table.remove(permWhitelist,find2)
                end
                writefile("permwhitelist.json", HTTP:JSONEncode(permWhitelist))
                print(table.concat(permWhitelist,", "))
                ChatEvent("Removed "..Args..' from the whitelist.')
            end
            if AddCmd("spin") then
                ArgsSpin = tonumber(string.split(message," ")[2])
                if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then
                    local Spin = Instance.new("BodyAngularVelocity");
                    Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart;
                    Spin.MaxTorque = Vector3.new(0, math.huge, 0);
                    Spin.AngularVelocity = Vector3.new(0, ArgsSpin, 0);
                else
                    game.Players.LocalPlayer.Character.HumanoidRootPart.BodyAngularVelocity.AngularVelocity = Vector3.new(0, ArgsSpin, 0);
                end
            end
            if AddCmd("unspin") then
                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity"):Destroy()
                end
            end
            if AddCmd("freeze") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            end
            if AddCmd("unfreeze") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            end
            if AddCmd("loopjump") then
                threadLoops["Jump"] = false
                local thread = coroutine.create(function()
                    while true do 
                        print(threadLoops["Jump"])
                        game.Players.LocalPlayer.Character.Humanoid.Jump = true
                        if threadLoops["Jump"] == true then coroutine.yield() end;wait()
                    end
                end)
                coroutine.resume(thread)
            end
            if AddCmd("unloopjump") then
                threadLoops["Jump"]=true
            end
            if AddCmd("say%s") then
                if string.match(message,"^%"..prefix.."say%s?(.+)") then
                    local Args = string.match(message,"^%"..prefix.."say%s?(.+)")
                    ChatEvent(Args)
                elseif string.match(message,"^"..prefix.."say%s?(.+)") then
                    local Args = string.match(message,"^"..prefix.."say%s?(.+)")
                    ChatEvent(Args)
                end
            end
            if AddCmd("cmds") or AddCmd("help") then
                function ChatEvent(msg)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(msg),"All")
                end
                ChatEvent("\194\187 Signum Bot Commands \194\171 - By "..tostring(owner))
                ChatEvent(".follow <username> \194\166 .unfollow \194\166 .sit \194\166 .jump \194\166 .to <username>")
                ChatEvent(".noclip \194\166 .antifling \194\166 .loopjump \194\166 .unloopjump \194\166 .freeze \194\166 .unfreeze")
                ChatEvent(".spin <number> \194\166 .unspin \194\166 .say <message> \194\166 .copychat \194\166 .bring \194\166 .reset")
                ChatEvent(".speed <number> \194\166 .swim \194\166 .unswim \194\166 .anim <carpet/stop> \194\166 .cmds")
            end
            if AddCmd("anim") then -- anim script
                local Args = tostring(string.split(message," ")[2])
                if Args == "carpet" then
                    playAnimation(282574440)
                elseif Args == "stop" then
                    game.Players.LocalPlayer.Character.Animate.Disabled = true
                    task.wait(0.01)
                    game.Players.LocalPlayer.Character.Animate.Disabled = false
                elseif Args == "head" then
                    playAnimation(121572214)
                elseif Args == "sleep" then
                    playAnimation(181526230)
                elseif Args == "dance" then
                    playAnimation(429703734)
                elseif Args == "dance2" then
                    playAnimation("180436148") -- Fall
                    playAnimation("182491248") -- dance2
                    playAnimation("182436935") -- dance3
                elseif Args == "dinowalk" then
                    playAnimation(204328711)
                elseif Args == "insane" then
                    playAnimation(33796059)
                    for i,v in next, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    	v:AdjustSpeed(tonumber(10))
                    end
                end
            end
            if AddCmd("math") then
                local Args = tostring(string.split(message," ")[2])
                if string.match(Args,"sqrt") then
                    intArgs = string.gsub(Args, "%D", "")
                    ChatEvent(tostring(math.sqrt(tonumber(intArgs))) .. " pesos")
                else
                    local solve = loadstring("return "..Args)()
                    ChatEvent(solve .. " pesos")
                end
            end
            if AddCmd("nolimbs") then
                game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
                game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
                game.Players.LocalPlayer.Character["Left Leg"]:Destroy()
                game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
            elseif AddCmd("noarms") then
                game.Players.LocalPlayer.Character["Left Arm"]:Destroy()
                game.Players.LocalPlayer.Character["Right Arm"]:Destroy()
            elseif AddCmd("nolegs") then
                game.Players.LocalPlayer.Character["Left Leg"]:Destroy()
                game.Players.LocalPlayer.Character["Right Leg"]:Destroy()
            end
            if AddCmd("blockhead") then
                game.Players.LocalPlayer.Character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
            end
            if AddCmd("orbit") then
                local Args = tostring(string.split(message," ")[2])
                if Args == "help" then
                    ChatEvent(".orbit optional:<username> <speed> <radius>")
                elseif not string.match(Args,"^.*%a") then
                    threadLoops["Orbit"]=true
                    task.wait(0.05)
                    threadLoops["Orbit"]=false
                    local Speed = tonumber(string.split(message," ")[2])
                    local Radius = tonumber(string.split(message," ")[3])
                    local Root, TRoot = game.Players.LocalPlayer.Character.HumanoidRootPart, game.Players[speaker.Name].Character.HumanoidRootPart;
                    local thread = coroutine.create(function()
                        while true do 
                            Root.CFrame = CFrame.new(TRoot.Position + Vector3.new(math.sin(tick() * Speed) * Radius, 0, math.cos(tick() * Speed) * Radius), TRoot.Position);
                            if threadLoops["Orbit"] == true then coroutine.yield() end;task.wait()
                        end
                    end)
                    coroutine.resume(thread)
                else
                    threadLoops["Orbit"]=true
                    task.wait(0.001)
                    threadLoops["Orbit"]=false
                    local Target = predictname(tostring(string.split(message," ")[2]))
                    local Speed = tonumber(string.split(message," ")[3])
                    local Radius = tonumber(string.split(message," ")[4])
                    local Root, TRoot = game.Players.LocalPlayer.Character.HumanoidRootPart, game.Players[Target].Character.HumanoidRootPart;
                    local thread = coroutine.create(function()
                        while true do 
                            Root.CFrame = CFrame.new(TRoot.Position + Vector3.new(math.sin(tick() * Speed) * Radius, 0, math.cos(tick() * Speed) * Radius), TRoot.Position);
                            if threadLoops["Orbit"] == true then coroutine.yield() end;task.wait()
                        end
                    end)
                    coroutine.resume(thread)
                end
            end
            if AddCmd("unorbit") or AddCmd("unorbit") then
                threadLoops["Orbit"]=true
            end
            if AddCmd("credits") then
                ChatEvent("- Signum Bot -")
                ChatEvent("Script by REDACTED/"..ownerUser)
            end
            if AddCmd("lucky") then
                local Args = tostring(string.split(message," ")[2])
                local characters = {"💵","⬛"}
                local result = {}
                if Args == "nil" then
                    for i = 1,3 do
                        table.insert(result,characters[math.random(1,#characters)])
                    end
                    if result[1]=="💵" and result[2]=="💵" and result[3]=="💵" then
                        money=money+3
                        ChatEvent(table.concat(result," ").." - U win $3 ($"..money..")")
                    else
                        ChatEvent(table.concat(result," ").." - Failed ($"..money..")")
                    end
                elseif Args == "ez" then
                    for i = 1,1 do
                        table.insert(result,characters[math.random(1,#characters)])
                    end
                    if result[1]=="💵" then
                        money=money+100
                        ChatEvent(table.concat(result," ").." - U win $100 ($"..money..")")
                    else
                        ChatEvent(table.concat(result," ").." - Failed (Worst Lucky Ever) ($"..money..")")
                    end
                elseif Args == "easy" then
                    for i = 1,2 do
                        table.insert(result,characters[math.random(1,#characters)])
                    end
                    if result[1]=="💵" and result[2]=="💵" then
                        money=money+1500
                        ChatEvent(table.concat(result," ").." - U win $1.5k ($"..money..")")
                    else
                        ChatEvent(table.concat(result," ").." - Failed ($"..money..")")
                    end
                elseif Args == "hard" then
                    for i = 1,4 do
                        table.insert(result,characters[math.random(1,#characters)])
                    end
                    if result[1]=="💵" and result[2]=="💵" and result[3]=="💵" and result[4]=="💵" then
                        money=money+5000
                        ChatEvent(table.concat(result," ").." - U win $5k ($"..money..")")
                    else
                        ChatEvent(table.concat(result," ").." - Failed ($"..money..")")
                    end
                elseif Args == "impossible" then
                    for i = 1,6 do
                        table.insert(result,characters[math.random(1,#characters)])
                    end
                    if result[1]=="💵" and result[2]=="💵" and result[3]=="💵" and result[4]=="💵" and result[5]=="💵" and result[6]=="💵" then
                        money=money+50000
                        ChatEvent(table.concat(result," ").." - U win $50k ($"..money..")")
                    else
                        ChatEvent(table.concat(result," ").." - Failed ($"..money..")")
                    end
                elseif Args == "extreme" then
                    for i = 1,10 do
                        table.insert(result,characters[math.random(1,#characters)])
                    end
                    if result[1]=="💵" and result[2]=="💵" and result[3]=="💵" and result[4]=="💵" and result[5]=="💵" and result[6]=="💵" and result[7]=="💵" and result[8]=="💵" and result[9]=="💵" and result[10]=="💵" then
                        money=money+1000000
                        ChatEvent(table.concat(result," ").." - U win $1Million ($"..money..")")
                    else
                        ChatEvent(table.concat(result," ").." - Failed ($"..money..")")
                    end
                end
            end
            if AddCmd("bet") then
                local Args = tonumber(string.split(message," ")[2])
                local Args1 = tostring(string.split(message," ")[3])
                if Args > money then
                    ChatEvent("You don't have enough money!")     
                else
                    if Args1 == "nil" then
                        local characters = {"💵","⬛"}
                        local result = {}
                        for i = 1,3 do
                            table.insert(result,characters[math.random(1,#characters)])
                        end
                        if result[1]=="💵" and result[2]=="💵" and result[3]=="💵" then
                            local towin=Args*5
                            money=money+towin
                            ChatEvent(table.concat(result," ").." - U win $"..towin.." ($"..money..")")
                        else
                            money=money-Args
                            ChatEvent(table.concat(result," ").." - Failed, you lost $"..Args.." (Money: $"..money..") ")
                        end
                    elseif Args1 == "hard" then
                        local characters = {"💵","⬛"}
                        local result = {}
                        for i = 1,4 do
                            table.insert(result,characters[math.random(1,#characters)])
                        end
                        if result[1]=="💵" and result[2]=="💵" and result[3]=="💵" and result[4]=="💵" then
                            local towin2 = Args*15
                            money=money+towin2
                            ChatEvent(table.concat(result," ").." - U win $"..towin2.." ($"..money..")")
                        else
                            money=money-Args
                            ChatEvent(table.concat(result," ").." - Failed, you lost $"..Args.." (Money: $"..money..") ")
                        end
                    end
                end
            end
            if AddCmd("money") then
                local Args = tostring(string.split(message," ")[2])
                local Args1 = tonumber(string.split(message," ")[3])
                if Args == "add" then
                    money=money+Args1
                    ChatEvent("Added $"..Args1.." ("..money..")")
                elseif Args == "ammount" or Args == "m" then
                    ChatEvent("$"..money.." pesos")
                elseif Args == "reset" then
                    money=0
                    ChatEvent("Money set to 0")
                end
            end
            if AddCmd("casino") then
                local Args = tostring(string.split(message," ")[2])
                local Args1 = predictname(tostring(string.split(message," ")[3]))
                if Args == "help" then
                    ChatEvent("\194\187 Casino \194\171")
                    task.wait(0.08)
                    ChatEvent("1. ¿How to get Money?: .lucky <ez,easy,<blank>,hard,impossible,extreme>")
                    task.wait(0.08)
                    ChatEvent("2. ¿How to Bet?: .bet <ammount> hard/<blank>")
                elseif Args == "add" then
                    local thelist = casinowl
                    casinowl = casinowl
                    table.insert(thelist,Args1)
                    table.insert(whole_whitelist,Args1)
                    whole_whitelist = whole_whitelist
                    ChatEvent(Args1..' Added to Casino.', "All")
                elseif Args == "remove" then
                    local find = table.find(casinowl,Args)
                    if find ~= "nil" then
                        table.remove(casinowl,find)
                        ChatEvent(Args1.." Removed from Casino.")
                    end
                end
            end
            if AddCmd("mcdonalds") then
                local Args = tostring(string.split(message," ")[2])
                if Args == "menu" then
                    ChatEvent("🍔🍔 McDonalds 🍔🍔")
                    task.wait(0.8)
                    ChatEvent("1. Burger and Fries 🍔🍟 ($4.99)")
                    task.wait(2)
                    ChatEvent("2. French Fries (Chips) 🍟 ($1.4)")
                    task.wait(2)
                    ChatEvent("3. Chicken 🍗 ($3.99)")
                    task.wait(2.30)
                    ChatEvent("\226\184\187Drinks\226\184\187")
                    task.wait(3)
                    ChatEvent("2. Water 🥤 ($ \206\181)")
                    task.wait(4.15)
                    ChatEvent("\226\184\187Appliances\226\184\187")
                    task.wait(1.9)
                    ChatEvent("1. Microwave 🔬 ($254.99)")
                end
            end
            if AddCmd("sayspam") then
                threadLoops["SaySpam"] = true
                task.wait(0.001)
                threadLoops["SaySpam"] = false
                local SpamThread = coroutine.create(function()
                    local Args = string.match(message,"%"..prefix.."sayspam%s?(.+)")
                    local DELAY = 2.175
                    while true do
                        ChatEvent(Args)
                        task.wait(DELAY)
                        if threadLoops["SaySpam"] == true then coroutine.yield() end
                    end
                end)
                coroutine.resume(SpamThread)
            end
            if AddCmd("unspam") then
                threadLoops["SaySpam"] = true
            end
            if AddCmd("rickroll") then
                local delay = 2.14
                ChatEvent("♪ Never gonna give you up ♪")
                task.wait(delay)
                ChatEvent("♪ Never gonna let you down ♪")
                task.wait(delay)
                ChatEvent("♪ Never gonna run around and desert you ♪")
                task.wait(delay)
                ChatEvent("♪ Never gonna make you cry ♪")
                task.wait(delay)
                ChatEvent("♪ Never gonna say goodbye ♪")
                task.wait(delay)
                ChatEvent("♪ Never gonna tell a lie and hert you ♪")
                task.wait(delay)
                ChatEvent("♪ Your heart's been aching, but you're too shy to say it (say it) ♪")
                task.wait(delay)
                ChatEvent("♪ Inside, we both know what's been going on (going on) ♪")
                task.wait(delay)
                ChatEvent("♪ We know the game and we're gonna play it ♪")
                task.wait(delay)
                ChatEvent("♪ And if you ask me how I'm feeling ♪")
                task.wait(delay)
                ChatEvent("♪ Don't tell me you're too blind to see ♪")
            end
            if AddCmd("fling") then
                local Args = predictname(tostring(string.split(message," ")[2]))
                local Spin = Instance.new("BodyAngularVelocity");
                Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart;
                Spin.MaxTorque = Vector3.new(0, math.huge, 0);
                Spin.AngularVelocity = Vector3.new(0, 99999, 0);
                Clip = false
                local noclipLoop = nil
                local function noclipV()
                	if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                		for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                			if child:IsA("BasePart") and child.CanCollide == true then
                				child.CanCollide = false
                			end
                		end
                	end
                end
                noclipLoop = game:GetService("RunService").Stepped:Connect(noclipV)
                for i = 1,300 do
                    local botPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    task.wait(0.001)
                    for i,v in pairs() do
                        if botPos and game.Players[Args].Character then
                            botPos.CFrame = game.Players[Args].Character:WaitForChild("HumanoidRootPart",math.huge).CFrame
                        end
                        if i >= 300 then
                            if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyAngularVelocity"):Destroy()
                            end
                            spawn(function()
                                for e = 1,100 do
                                    task.wait(0.0001)
                                    Character = game.Players.LocalPlayer.Character
                                    Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                                    Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                                    Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                    botPos.CFrame = game.Players[speaker.Name].Character.HumanoidRootPart.CFrame + Vector3.new(0,0,5)
                                    Character = game.Players.LocalPlayer.Character
                                    Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                                end
                            end)
                            if noclipLoop then
                            	noclipLoop:Disconnect()
                            end
                            Clip = true
                        end
                    end
                end
            end
            if AddCmd("hh") or AddCmd("hipheight") or AddCmd("hiph") then
                local Args = tonumber(string.split(message," ")[2])
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = Args
            end
            if AddCmd("pick") then
                local Args = tostring(string.split(message," "))
                Args = string.split(message," ")
                ChatEvent("Xenon Selected: "..Args[math.random(2,#Args)])
            end
            if AddCmd("changeprefix") or AddCmd("cf") then
                local Args = tostring(string.split(message," ")[2])
                prefix=Args
            end
            if AddCmd("coinflip") then
                local faces = {"TAILS","HEADS"}
                ChatEvent("You Got...")
                task.wait(2)
                ChatEvent(faces[math.random(1,#faces)])
            end
            if AddCmd("lua") then
                local Args = tostring('return '..string.match(message,prefix.."lua%s(.*)"))
                local code,err = pcall(function()loadstring(Args)()end)
                if not code then
                    ChatEvent("- Error -")
                    ChatEvent(err)
                else
                    ChatEvent("- Success -")
                    pcall(function()
                        ChatEvent(tostring(loadstring(Args)()))
                    end)
                end
            end 
            if AddCmd("re$") then
                loadstring(readfile("Lib/re.lua"))()
            end 
            if AddCmd("bang") then
                local targetname = predictname(tostring(string.split(message," ")[2]))
                local bangspeed = tostring(string.split(message," ")[3])
                local bangAnim = Instance.new("Animation")
                if not r15(game.Players.LocalPlayer) then
                    bangAnim.AnimationId = "rbxassetid://148840371"
                else
                    bangAnim.AnimationId = "rbxassetid://5918726674"
                end
                local bang = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(bangAnim)
                bang:Play(.1, 1, 1)
                if not bangspeed ~= "nil" or bangspeed == " " then
                    bang:AdjustSpeed(tonumber(bangspeed))
                else
                    bang:AdjustSpeed(5)
                end
                local bangOffet = CFrame.new(0, 0, 1.1)
                local bangLoop = game:GetService("RunService").Stepped:Connect(function()
                    pcall(function()
                        local otherRoot = game.Players[targetname].Character.Torso
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = otherRoot.CFrame * bangOffet
                    end)
                end)
                bangDied = game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
                    bangLoop:Disconnect()
                    bang:Stop()
                    bangAnim:Destroy()
                    bangDied:Disconnect()
                end)
            end
            if AddCmd("reload") or AddCmd("update") or AddCmd("upgrade") then
                local myScript = readfile("BOTS.lua")
                __main:Disconnect()
                if CopyChatListener then
                    CopyChatListener:Disconnect()
                end
                for i,v in pairs(commandThreads) do
                    v:Disconnect()
                    commandThreads = {}
                end
                for i, v in pairs(threadLoops) do
                    if v == false then
                        threadLoops[i] = true
                        threadscount += 1
                    end
                end
                loadstring(myScript)()
                script:Destroy()
            end
            if AddCmd("setfpscap") or AddCmd("fpslimit") or AddCmd("setfps") then
                local Args = tonumber(string.split(message," ")[2])
                setfpscap(Args)
            end
            if AddCmd("sphere") then
                local Args = string.split(message," ")
                pcall(function()
                    rotationfunc:Disconnect()
                end)
                if Args[2] == "help" then
                    ChatEvent(".sphere optional:<name> <speed> <distance>")
                elseif not string.match(Args[2],"^.*%a") then
                    local HRP = game.Players[speaker.Name].Character.HumanoidRootPart
                    local CYCLE_DURATION = Args[2]/3
                    local DISTANCE = Args[3]
                    local orbitPart = game.Players.LocalPlayer.Character.HumanoidRootPart
                    local i = 0
                    local randomMode = 0
                    randomMode = math.random(0,1)
                    local rotationfunc = game:GetService("RunService").Heartbeat:Connect(function(dt)
                        i = (i + dt*CYCLE_DURATION) % 1
                        local alpha = 2 * math.pi * i
                        if randomMode == 1 then
                            orbitPart.CFrame = CFrame.Angles(80, alpha, alpha)
                            * CFrame.new(0, 0, DISTANCE)
                            + HRP.Position
                        else
                            orbitPart.CFrame = CFrame.Angles(alpha, 0, alpha)
                            * CFrame.new(0, 0, DISTANCE)
                            + HRP.Position
                        end
                    end)
                    table.insert(commandThreads,rotationfunc)
                else
                    local HRP = game.Players[predictname(Args[2])].Character.HumanoidRootPart
                    local CYCLE_DURATION = Args[3]/3
                    local DISTANCE = Args[4]
                    local orbitPart = game.Players.LocalPlayer.Character.HumanoidRootPart
                    local i = 0
                    local randomMode = 0
                    randomMode = math.random(0,1)
                    local rotationfunc = game:GetService("RunService").Heartbeat:Connect(function(dt)
                        i = (i + dt*CYCLE_DURATION) % 1
                        local alpha = 2 * math.pi * i
                        if randomMode == 1 then
                            orbitPart.CFrame = CFrame.Angles(80, alpha, alpha)
                            * CFrame.new(0, 0, DISTANCE)
                            + HRP.Position
                        else
                            orbitPart.CFrame = CFrame.Angles(alpha, 0, alpha)
                            * CFrame.new(0, 0, DISTANCE)
                            + HRP.Position
                        end
                    end)
                    table.insert(commandThreads,rotationfunc)
                end
            end
            if AddCmd("oofspam") then
                _G.enabled = true
                _G.speed = 100
                local RunService = game:GetService("RunService");
                local Players = game:GetService("Players");
                local LocalPlayer = game:GetService("Players").LocalPlayer;
                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
                local Humanoid = Character:WaitForChild("Humanoid") or Character:FindFirstChildOfClass("Humanoid");
                local HRP = Humanoid.RootPart or Humanoid:FindFirstChild("HumanoidRootPart")
                if not Humanoid or not _G.enabled then
                if Humanoid and Humanoid.Health <= 0 then
                    Humanoid:Destroy()
                end
                return
                end
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                Humanoid.BreakJointsOnDeath = false
                local con; con = RunService.Stepped:Connect(function()
                if not Humanoid then return con:Disconnect() end
                Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end)
                LocalPlayer.Character = nil
                LocalPlayer.Character = Character
                task.wait(Players.RespawnTime + 0.1)
                while task.wait(1/_G.speed) do
                    Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
                end
            end
            if AddCmd("count") then
                ChatEvent("Bots: "..countBots())
            end
            if AddCmd("index") then
                ChatEvent(BotIndex)
            end
            if AddCmd("test") then
                --- Toggle
                    threadLoops["Test"]=true
                    task.wait(0.05)
                    threadLoops["Test"]=false
                --- Toggle
                local Speed = 5
                local Radius = 5
                local Root, TRoot = game.Players.LocalPlayer.Character.HumanoidRootPart, game.Players[speaker.Name].Character.HumanoidRootPart;
                local oldTick = tick()
                local bots : number = countBots()
                local thread = coroutine.create(function()
                    while true do
                        print("orbit",threadLoops["Test"])
                        for i = 1,360/bots*BotIndex do
                            Root.CFrame = CFrame.new(TRoot.CFrame.Position)*CFrame.Angles(0, math.rad((360/Bots*botIndex)+((tick()-oldTick)*Speed*50)), 0)*CFrame.new(0, 0, Radius)
                            if threadLoops["Test"] == true then print("Disabling") coroutine.yield() end;task.wait()
                        end
                    end
                end)
                coroutine.resume(thread)
            end
            if AddCmd("stop") then
                local threadscount = 0
                for i,v in pairs(commandThreads) do
                    threadscount+=1
                    print(v)
                    v:Disconnect()
                end
                commandThreads = {}
                -----------------------------
                for i, v in pairs(threadLoops) do
                    if v == false then
                        threadLoops[i] = true
                        print(i)
                        threadscount += 1
                    end
                end
                ChatEvent("Stopped "..threadscount.." Commands.")
            end
            break
        end
    end
end)
