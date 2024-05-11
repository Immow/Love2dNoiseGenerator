LoveFrames = require("loveframes")
local Sliders = require("sliders")

local tileSize = 16
local ridgeCanvas
WW = love.graphics.getWidth()
WH = love.graphics.getHeight()
local saveButton
RidgeMap = {}

function GenerateRidgeMap(width, height, frequency, threshold, octaves, amp, drawThreshold, offsetX, offsetY)
	ridgeCanvas = love.graphics.newCanvas(width, height)

	love.graphics.setCanvas(ridgeCanvas)
	for x = 0, width / tileSize - 1 do
		for y = 0, height / tileSize - 1 do
			local nx = x * frequency
			local ny = y * frequency

			local value = 0
			local currentAmp = amp

			for i = 1, octaves do
				value = value + love.math.noise(nx + offsetX, ny + offsetY) * currentAmp
				nx = nx * 2
				ny = ny * 2
				currentAmp = currentAmp * 0.5
			end

			value = math.abs(value)
			value = threshold - value
			value = value * value

			value = math.max(0, value)

			if value > drawThreshold then
				love.graphics.setColor(value, value, value)
				love.graphics.rectangle("fill", x * tileSize, y * tileSize, tileSize, tileSize)
			end
		end
	end
	love.graphics.setCanvas()

	return ridgeCanvas
end

function love.load()
	local sliders = Sliders:createSliders()

	RidgeMap = GenerateRidgeMap(sliders[1], sliders[2], sliders[3], sliders[4], sliders[5], sliders[6],
		sliders[7], sliders[8], sliders[9])

	saveButton = LoveFrames.Create("button")
	saveButton:SetWidth(100)
	saveButton:SetPos(10, WH - 40)
	saveButton:SetText("Save Image")
	saveButton.OnClick = function()
		local imagedata = ridgeCanvas:newImageData()
		imagedata:encode("png", "ridge_map.png")
		local data =
			"width: " .. Sliders.frequencySlider:GetValue() .. "\n" ..
			"height: " .. Sliders.thresholdSlider:GetValue() .. "\n" ..
			"frequency: " .. Sliders.octavesSlider:GetValue() .. "\n" ..
			"threshold: " .. Sliders.ampSlider:GetValue() .. "\n" ..
			"octaves: " .. Sliders.drawThresholdSlider:GetValue() .. "\n" ..
			"amp: " .. Sliders.offsetXSlider:GetValue() .. "\n" ..
			"drawThreshold: " .. Sliders.offsetYSlider:GetValue() .. "\n" ..
			"offsetX: " .. Sliders.widthSlider:GetValue() .. "\n" ..
			"offsetY: " .. Sliders.heightSlider:GetValue() .. "\n"

		love.filesystem.write("ridgeMap.txt", data)
	end
end

function love.keypressed(key, scancode)
	LoveFrames.keypressed(key, scancode)
end

function love.textinput(text)
	LoveFrames.textinput(text)
end

function love.mousepressed(x, y, button)
	LoveFrames.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	LoveFrames.mousereleased(x, y, button)
end

function love.update(dt)
	LoveFrames.update(dt)
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(RidgeMap, 0, 0)

	LoveFrames.draw()
end
