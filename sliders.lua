-- sliders.lua

local Sliders = {}

function Sliders:createSliders()
	local sliderWidth = 200
	local setPosLabelX = 10
	local setPosSliderX = 120
	local setPosSliderValueX = setPosSliderX + sliderWidth + 10
	local y_offset = 10
	local frequencySlider = LoveFrames.Create("slider")
	local thresholdSlider = LoveFrames.Create("slider")
	local octavesSlider = LoveFrames.Create("slider")
	local ampSlider = LoveFrames.Create("slider")
	local drawThresholdSlider = LoveFrames.Create("slider")
	local offsetXSlider = LoveFrames.Create("slider")
	local offsetYSlider = LoveFrames.Create("slider")
	local widthSlider = LoveFrames.Create("slider")
	local heightSlider = LoveFrames.Create("slider")

	local frequencyLabel = LoveFrames.Create("text")
	frequencyLabel:SetText("Frequency:")
	frequencyLabel:SetPos(setPosLabelX, y_offset)

	frequencySlider:SetPos(setPosSliderX, y_offset)
	frequencySlider:SetWidth(sliderWidth)
	frequencySlider:SetMinMax(0.001, 0.1)
	frequencySlider:SetDecimals(3)
	frequencySlider:SetValue(0.01)
	frequencySlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local frequencyValueLabel = LoveFrames.Create("text")
	frequencyValueLabel:SetPos(setPosSliderValueX, y_offset)
	frequencyValueLabel.Update = function(object)
		object:SetText(tostring(frequencySlider:GetValue()))
	end

	y_offset = y_offset + 40

	local thresholdLabel = LoveFrames.Create("text")
	thresholdLabel:SetText("Threshold:")
	thresholdLabel:SetPos(setPosLabelX, y_offset)

	thresholdSlider:SetPos(setPosSliderX, y_offset)
	thresholdSlider:SetWidth(sliderWidth)
	thresholdSlider:SetMinMax(0, 1)
	thresholdSlider:SetDecimals(2)
	thresholdSlider:SetValue(0.5)
	thresholdSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local thresholdValueLabel = LoveFrames.Create("text")
	thresholdValueLabel:SetPos(setPosSliderValueX, y_offset)
	thresholdValueLabel.Update = function(object)
		object:SetText(tostring(thresholdSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local octavesLabel = LoveFrames.Create("text")
	octavesLabel:SetText("Octaves:")
	octavesLabel:SetPos(setPosLabelX, y_offset)

	octavesSlider:SetPos(setPosSliderX, y_offset)
	octavesSlider:SetWidth(sliderWidth)
	octavesSlider:SetMinMax(1, 10)
	octavesSlider:SetValue(6)
	octavesSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local octavesValueLabel = LoveFrames.Create("text")
	octavesValueLabel:SetPos(setPosSliderValueX, y_offset)
	octavesValueLabel.Update = function(object)
		object:SetText(tostring(octavesSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local ampLabel = LoveFrames.Create("text")
	ampLabel:SetText("Amplitude:")
	ampLabel:SetPos(setPosLabelX, y_offset)

	ampSlider:SetPos(setPosSliderX, y_offset)
	ampSlider:SetWidth(sliderWidth)
	ampSlider:SetMinMax(0.1, 5)
	ampSlider:SetDecimals(1)
	ampSlider:SetValue(1)
	ampSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local ampValueLabel = LoveFrames.Create("text")
	ampValueLabel:SetPos(setPosSliderValueX, y_offset)
	ampValueLabel.Update = function(object)
		object:SetText(tostring(ampSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local drawThresholdLabel = LoveFrames.Create("text")
	drawThresholdLabel:SetText("Draw Threshold:")
	drawThresholdLabel:SetPos(setPosLabelX, y_offset)

	drawThresholdSlider:SetPos(setPosSliderX, y_offset)
	drawThresholdSlider:SetWidth(sliderWidth)
	drawThresholdSlider:SetMinMax(0, 1)
	drawThresholdSlider:SetDecimals(2)
	drawThresholdSlider:SetValue(0.5)
	drawThresholdSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local drawThresholdValueLabel = LoveFrames.Create("text")
	drawThresholdValueLabel:SetPos(setPosSliderValueX, y_offset)
	drawThresholdValueLabel.Update = function(object)
		object:SetText(tostring(drawThresholdSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local widthLabel = LoveFrames.Create("text")
	widthLabel:SetText("Width:")
	widthLabel:SetPos(setPosLabelX, y_offset)

	widthSlider:SetPos(setPosSliderX, y_offset)
	widthSlider:SetWidth(sliderWidth)
	widthSlider:SetMinMax(100, 10000)
	widthSlider:SetValue(WW)
	widthSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local widthValueLabel = LoveFrames.Create("text")
	widthValueLabel:SetPos(setPosSliderValueX, y_offset)
	widthValueLabel.Update = function(object)
		object:SetText(tostring(math.floor(widthSlider:GetValue())))
	end

	y_offset = y_offset + 40

	local heightLabel = LoveFrames.Create("text")
	heightLabel:SetText("Height:")
	heightLabel:SetPos(setPosLabelX, y_offset)

	heightSlider:SetPos(setPosSliderX, y_offset)
	heightSlider:SetWidth(sliderWidth)
	heightSlider:SetMinMax(100, 10000)
	heightSlider:SetValue(WH)
	heightSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local heightValueLabel = LoveFrames.Create("text")
	heightValueLabel:SetPos(setPosSliderValueX, y_offset)
	heightValueLabel.Update = function(object)
		object:SetText(tostring(math.floor(heightSlider:GetValue())))
	end


	y_offset = y_offset + 40

	local offsetXLabel = LoveFrames.Create("text")
	offsetXLabel:SetText("OffsetX:")
	offsetXLabel:SetPos(setPosLabelX, y_offset)

	offsetXSlider:SetPos(setPosSliderX, y_offset)
	offsetXSlider:SetWidth(sliderWidth)
	offsetXSlider:SetMinMax(1, 10000)
	offsetXSlider:SetValue(100)
	offsetXSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local offsetXLabelValue = LoveFrames.Create("text")
	offsetXLabelValue:SetPos(setPosSliderValueX, y_offset)
	offsetXLabelValue.Update = function(object)
		object:SetText(tostring(math.floor(offsetXSlider:GetValue())))
	end

	y_offset = y_offset + 40

	local offsetYLabel = LoveFrames.Create("text")
	offsetYLabel:SetText("OffsetY:")
	offsetYLabel:SetPos(setPosLabelX, y_offset)

	offsetYSlider:SetPos(setPosSliderX, y_offset)
	offsetYSlider:SetWidth(sliderWidth)
	offsetYSlider:SetMinMax(1, 10000)
	offsetYSlider:SetValue(100)
	offsetYSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(),
			thresholdSlider:GetValue(), octavesSlider:GetValue(), ampSlider:GetValue(),
			drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue())
	end

	local offsetYLabelValue = LoveFrames.Create("text")
	offsetYLabelValue:SetPos(setPosSliderValueX, y_offset)
	offsetYLabelValue.Update = function(object)
		object:SetText(tostring(math.floor(offsetYSlider:GetValue())))
	end
	return { widthSlider:GetValue(), heightSlider:GetValue(), frequencySlider:GetValue(), thresholdSlider:GetValue(),
		octavesSlider:GetValue(), ampSlider:GetValue(),
		drawThresholdSlider:GetValue(), offsetXSlider:GetValue(), offsetYSlider:GetValue() }
end

return Sliders
