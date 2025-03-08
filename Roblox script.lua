-- Lista degli Admin (Aggiungi i nomi dei giocatori che possono eseguire i comandi)
local Admins = {"R0b3rt_one"}  -- Sostituisci con il tuo nome Roblox e quello degli admin

-- Funzione per eseguire i comandi
local function executeCommand(player, cmd, args)
	if cmd == "fly" then
		-- Esegui il comando Fly
		print(player.Name.." ha attivato il volo.")
	elseif cmd == "god" then
		-- Esegui il comando God mode
		print(player.Name.." ha attivato il God Mode.")
	elseif cmd == "noclip" then
		-- Esegui il comando Noclip
		print(player.Name.." ha attivato il Noclip.")
	elseif cmd == "kick" then
		local target = game.Players:FindFirstChild(args[1])
		if target then
			target:Kick("Sei stato espulso dal server!")
			print(player.Name.." ha espulso "..target.Name)
		else
			player:SendMessage("Giocatore non trovato!")
		end
	elseif cmd == "ban" then
		-- Esegui il comando Ban
		local target = game.Players:FindFirstChild(args[1])
		if target then
			target:Kick("Sei stato bannato!")
			print(player.Name.." ha bannato "..target.Name)
		else
			player:SendMessage("Giocatore non trovato!")
		end
	elseif cmd == "teleport" then
		local target = game.Players:FindFirstChild(args[1])
		if target then
			-- Teletrasporta il giocatore
			print(player.Name.." ha teletrasportato "..target.Name)
		end
	elseif cmd == "cmds" then
		-- Mostra i comandi disponibili in GUI
		print("Comandi disponibili:")
		print("1. fly")
		print("2. god")
		print("3. noclip")
		print("4. kick")
		print("5. ban")
		print("6. teleport")
	else
		print("Comando sconosciuto.")
	end
end

-- Creazione della GUI
game.Players.PlayerAdded:Connect(function(player)
	-- Verifica se è un admin
	if table.find(Admins, player.Name) then
		-- Crea la GUI
		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = player.PlayerGui
		ScreenGui.Name = "AdminToolGui"

		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(0, 300, 0, 500)
		frame.Position = UDim2.new(0.5, -150, 0.5, -250)
		frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		frame.Parent = ScreenGui

		-- Aggiungi un titolo
		local title = Instance.new("TextLabel")
		title.Size = UDim2.new(1, 0, 0, 50)
		title.Text = "Admin Tool"
		title.TextColor3 = Color3.fromRGB(255, 255, 255)
		title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		title.Font = Enum.Font.SourceSans
		title.TextSize = 24
		title.Parent = frame

		-- Creazione della sezione per visualizzare i comandi
		local commandsFrame = Instance.new("Frame")
		commandsFrame.Size = UDim2.new(1, 0, 0, 200)
		commandsFrame.Position = UDim2.new(0, 0, 0, 60)
		commandsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		commandsFrame.Visible = false  -- Nascosto inizialmente
		commandsFrame.Parent = frame

		-- Aggiungi una label per i comandi
		local commandsLabel = Instance.new("TextLabel")
		commandsLabel.Size = UDim2.new(1, 0, 1, 0)
		commandsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		commandsLabel.BackgroundTransparency = 1
		commandsLabel.TextSize = 18
		commandsLabel.TextWrapped = true
		commandsLabel.Text = "Comandi:\n1. fly\n2. god\n3. noclip\n4. kick\n5. ban\n6. teleport"
		commandsLabel.Parent = commandsFrame

		-- Funzione per creare un pulsante
		local function createButton(name, command)
			local button = Instance.new("TextButton")
			button.Size = UDim2.new(1, 0, 0, 50)
			button.Position = UDim2.new(0, 0, 0, 60)
			button.Text = name
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			button.Font = Enum.Font.SourceSans
			button.TextSize = 20
			button.Parent = frame

			button.MouseButton1Click:Connect(function()
				executeCommand(player, command, {})  -- Esegui il comando con il nome del comando (ad esempio "fly")
			end)
		end

		-- Crea i pulsanti per i comandi
		createButton("Fly", "fly")
		createButton("God", "god")
		createButton("Noclip", "noclip")
		createButton("Kick", "kick")  -- Aggiungi la logica per passare il target al comando
		createButton("Ban", "ban")    -- Aggiungi la logica per passare il target al comando
		createButton("Teleport", "teleport")

		-- Pulsante per mostrare tutti i comandi
		local cmdsButton = Instance.new("TextButton")
		cmdsButton.Size = UDim2.new(1, 0, 0, 50)
		cmdsButton.Position = UDim2.new(0, 0, 0, 350)
		cmdsButton.Text = "Show Commands"
		cmdsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		cmdsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		cmdsButton.Font = Enum.Font.SourceSans
		cmdsButton.TextSize = 20
		cmdsButton.Parent = frame

		cmdsButton.MouseButton1Click:Connect(function()
			-- Mostra o nascondi la sezione dei comandi
			commandsFrame.Visible = not commandsFrame.Visible
		end)
	end
end)
