local loveframes = require("loveframes")

local tileSize = 16
local sliderDrawThresholdValue = 0.5
local sliderWidth = 200
local setPosLabelX = 10
local setPosSliderX = 120
local setPosSliderValueX = setPosSliderX + sliderWidth + 10
local ridgeCanvas
local saveImage = false
local width
local height
local widthSlider
local heightSlider
local saveButton
local frequencySlider
local thresholdSlider
local gainSlider
local octavesSlider
local ampSlider
local drawThresholdSlider
local ridgeMap

local function generateRidgeMap(width, height)
	ridgeCanvas = love.graphics.newCanvas(width, height)

	local frequency = frequencySlider:GetValue()
	local threshold = thresholdSlider:GetValue()
	local gain = gainSlider:GetValue()
	local octaves = octavesSlider:GetValue()
	local amp = ampSlider:GetValue() -- Get the value from the amp slider

	love.graphics.setCanvas(ridgeCanvas)
	for x = 0, width / tileSize - 1 do
		for y = 0, height / tileSize - 1 do
			local nx = x * frequency
			local ny = y * frequency

			local value = 0
			local currentAmp = amp -- Reset current amplitude for each tile

			for i = 1, octaves do
				value = value + love.math.noise(nx, ny) * currentAmp
				nx = nx * 2
				ny = ny * 2
				currentAmp = currentAmp * 0.5 -- Reduce amplitude for each octave
			end

			-- Apply ridge algorithm
			value = math.abs(value) -- Create creases
			value = threshold - value -- Invert so creases are at top
			value = value * value -- Sharpen creases

			value = math.max(0, value)

			if value > sliderDrawThresholdValue then
				love.graphics.setColor(value, value, value)
				love.graphics.rectangle("fill", x * tileSize, y * tileSize, tileSize, tileSize)
			end
		end
	end
	love.graphics.setCanvas()
	if saveImage then
		local imagedata = ridgeCanvas:newImageData()
		imagedata:encode("png", "ridge_map.png")
		saveImage = false
	end

	return ridgeCanvas
end


local function createSliders()
	local y_offset = 10

	local frequencyLabel = loveframes.Create("text")
	frequencyLabel:SetText("Frequency:")
	frequencyLabel:SetPos(setPosLabelX, y_offset)

	frequencySlider = loveframes.Create("slider")
	frequencySlider:SetPos(setPosSliderX, y_offset)
	frequencySlider:SetWidth(sliderWidth)
	frequencySlider:SetMinMax(0.001, 0.1)
	frequencySlider:SetDecimals(3)
	frequencySlider:SetValue(0.01)
	frequencySlider.OnValueChanged = function(object, value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local frequencyValueLabel = loveframes.Create("text")
	frequencyValueLabel:SetPos(setPosSliderValueX, y_offset)
	frequencyValueLabel.Update = function(object)
		object:SetText(tostring(frequencySlider:GetValue()))
	end

	y_offset = y_offset + 40

	local thresholdLabel = loveframes.Create("text")
	thresholdLabel:SetText("Threshold:")
	thresholdLabel:SetPos(setPosLabelX, y_offset)

	thresholdSlider = loveframes.Create("slider")
	thresholdSlider:SetPos(setPosSliderX, y_offset)
	thresholdSlider:SetWidth(sliderWidth)
	thresholdSlider:SetMinMax(0, 1)
	thresholdSlider:SetDecimals(2)
	thresholdSlider:SetValue(0.5)
	thresholdSlider.OnValueChanged = function(object, value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local thresholdValueLabel = loveframes.Create("text")
	thresholdValueLabel:SetPos(setPosSliderValueX, y_offset)
	thresholdValueLabel.Update = function(object)
		object:SetText(tostring(thresholdSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local gainLabel = loveframes.Create("text")
	gainLabel:SetText("Gain:")
	gainLabel:SetPos(setPosLabelX, y_offset)

	gainSlider = loveframes.Create("slider")
	gainSlider:SetPos(setPosSliderX, y_offset)
	gainSlider:SetWidth(sliderWidth)
	gainSlider:SetMinMax(0.1, 5)
	gainSlider:SetDecimals(1)
	gainSlider:SetValue(2)
	gainSlider.OnValueChanged = function(object, value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local gainValueLabel = loveframes.Create("text")
	gainValueLabel:SetPos(setPosSliderValueX, y_offset)
	gainValueLabel.Update = function(object)
		object:SetText(tostring(gainSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local octavesLabel = loveframes.Create("text")
	octavesLabel:SetText("Octaves:")
	octavesLabel:SetPos(setPosLabelX, y_offset)

	octavesSlider = loveframes.Create("slider")
	octavesSlider:SetPos(setPosSliderX, y_offset)
	octavesSlider:SetWidth(sliderWidth)
	octavesSlider:SetMinMax(1, 10)
	octavesSlider:SetValue(6)
	octavesSlider.OnValueChanged = function(object, value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local octavesValueLabel = loveframes.Create("text")
	octavesValueLabel:SetPos(setPosSliderValueX, y_offset)
	octavesValueLabel.Update = function(object)
		object:SetText(tostring(octavesSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local ampLabel = loveframes.Create("text")
	ampLabel:SetText("Amplitude:")
	ampLabel:SetPos(setPosLabelX, y_offset)

	ampSlider = loveframes.Create("slider")
	ampSlider:SetPos(setPosSliderX, y_offset)
	ampSlider:SetWidth(sliderWidth)
	ampSlider:SetMinMax(0.1, 5)
	ampSlider:SetDecimals(1)
	ampSlider:SetValue(1)
	ampSlider.OnValueChanged = function(object, value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local ampValueLabel = loveframes.Create("text")
	ampValueLabel:SetPos(setPosSliderValueX, y_offset)
	ampValueLabel.Update = function(object)
		object:SetText(tostring(ampSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local drawThresholdLabel = loveframes.Create("text")
	drawThresholdLabel:SetText("Draw Threshold:")
	drawThresholdLabel:SetPos(setPosLabelX, y_offset)

	drawThresholdSlider = loveframes.Create("slider")
	drawThresholdSlider:SetPos(setPosSliderX, y_offset)
	drawThresholdSlider:SetWidth(sliderWidth)
	drawThresholdSlider:SetMinMax(0, 1)
	drawThresholdSlider:SetDecimals(2)
	drawThresholdSlider:SetValue(0.5)
	drawThresholdSlider.OnValueChanged = function(object, value)
		sliderDrawThresholdValue = value
		ridgeMap = generateRidgeMap(width, height)
	end

	local drawThresholdValueLabel = loveframes.Create("text")
	drawThresholdValueLabel:SetPos(setPosSliderValueX, y_offset)
	drawThresholdValueLabel.Update = function(object)
		object:SetText(tostring(drawThresholdSlider:GetValue()))
	end

	y_offset = y_offset + 40

	-- Slider for adjusting the width of the noise map
	local widthLabel = loveframes.Create("text")
	widthLabel:SetText("Width:")
	widthLabel:SetPos(setPosLabelX, y_offset)

	widthSlider = loveframes.Create("slider")
	widthSlider:SetPos(setPosSliderX, y_offset)
	widthSlider:SetWidth(sliderWidth)
	widthSlider:SetMinMax(100, 10000) -- Adjust the min and max as needed
	widthSlider:SetValue(width)
	widthSlider.OnValueChanged = function(object, value)
		width = math.floor(value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local widthValueLabel = loveframes.Create("text")
	widthValueLabel:SetPos(setPosSliderValueX, y_offset)
	widthValueLabel.Update = function(object)
		object:SetText(tostring(widthSlider:GetValue()))
	end

	y_offset = y_offset + 40

	-- Slider for adjusting the height of the noise map
	local heightLabel = loveframes.Create("text")
	heightLabel:SetText("Height:")
	heightLabel:SetPos(setPosLabelX, y_offset)

	heightSlider = loveframes.Create("slider")
	heightSlider:SetPos(setPosSliderX, y_offset)
	heightSlider:SetWidth(sliderWidth)
	heightSlider:SetMinMax(100, 10000) -- Adjust the min and max as needed
	heightSlider:SetValue(height)
	heightSlider.OnValueChanged = function(object, value)
		height = math.floor(value)
		ridgeMap = generateRidgeMap(width, height)
	end

	local heightValueLabel = loveframes.Create("text")
	heightValueLabel:SetPos(setPosSliderValueX, y_offset)
	heightValueLabel.Update = function(object)
		object:SetText(tostring(heightSlider:GetValue()))
	end
end


function love.load()
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()

	createSliders()

	ridgeMap = generateRidgeMap(width, height)

	saveButton = loveframes.Create("button")
	saveButton:SetWidth(100)
	saveButton:SetPos(10, height - 40)
	saveButton:SetText("Save Image")
	saveButton.OnClick = function()
		saveImage = true
		generateRidgeMap(width, height)
	end
end

function love.draw()
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(ridgeMap, 0, 0)

	loveframes.draw()
end

function love.update(dt)
	loveframes.update(dt)
end

function love.mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end
