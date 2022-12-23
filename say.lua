function say(msg: string)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tostring(msg), "All")
end
