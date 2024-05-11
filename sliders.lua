-- sliders.lua

local Sliders = {}

function Sliders:createSliders()
	local sliderWidth = 200
	local setPosLabelX = 10
	local setPosSliderX = 120
	local setPosSliderValueX = setPosSliderX + sliderWidth + 10
	local y_offset = 10
	self.frequencySlider = LoveFrames.Create("slider")
	self.thresholdSlider = LoveFrames.Create("slider")
	self.octavesSlider = LoveFrames.Create("slider")
	self.ampSlider = LoveFrames.Create("slider")
	self.drawThresholdSlider = LoveFrames.Create("slider")
	self.offsetXSlider = LoveFrames.Create("slider")
	self.offsetYSlider = LoveFrames.Create("slider")
	self.widthSlider = LoveFrames.Create("slider")
	self.heightSlider = LoveFrames.Create("slider")

	local frequencyLabel = LoveFrames.Create("text")
	frequencyLabel:SetText("Frequency:")
	frequencyLabel:SetPos(setPosLabelX, y_offset)

	self.frequencySlider:SetPos(setPosSliderX, y_offset)
	self.frequencySlider:SetWidth(sliderWidth)
	self.frequencySlider:SetMinMax(0.001, 0.1)
	self.frequencySlider:SetDecimals(3)
	self.frequencySlider:SetValue(0.01)
	self.frequencySlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local frequencyValueLabel = LoveFrames.Create("text")
	frequencyValueLabel:SetPos(setPosSliderValueX, y_offset)
	frequencyValueLabel.Update = function(object)
		object:SetText(tostring(self.frequencySlider:GetValue()))
	end

	y_offset = y_offset + 40

	local thresholdLabel = LoveFrames.Create("text")
	thresholdLabel:SetText("Threshold:")
	thresholdLabel:SetPos(setPosLabelX, y_offset)

	self.thresholdSlider:SetPos(setPosSliderX, y_offset)
	self.thresholdSlider:SetWidth(sliderWidth)
	self.thresholdSlider:SetMinMax(0, 1)
	self.thresholdSlider:SetDecimals(2)
	self.thresholdSlider:SetValue(0.5)
	self.thresholdSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local thresholdValueLabel = LoveFrames.Create("text")
	thresholdValueLabel:SetPos(setPosSliderValueX, y_offset)
	thresholdValueLabel.Update = function(object)
		object:SetText(tostring(self.thresholdSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local octavesLabel = LoveFrames.Create("text")
	octavesLabel:SetText("Octaves:")
	octavesLabel:SetPos(setPosLabelX, y_offset)

	self.octavesSlider:SetPos(setPosSliderX, y_offset)
	self.octavesSlider:SetWidth(sliderWidth)
	self.octavesSlider:SetMinMax(1, 10)
	self.octavesSlider:SetValue(6)
	self.octavesSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local octavesValueLabel = LoveFrames.Create("text")
	octavesValueLabel:SetPos(setPosSliderValueX, y_offset)
	octavesValueLabel.Update = function(object)
		object:SetText(tostring(self.octavesSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local ampLabel = LoveFrames.Create("text")
	ampLabel:SetText("Amplitude:")
	ampLabel:SetPos(setPosLabelX, y_offset)

	self.ampSlider:SetPos(setPosSliderX, y_offset)
	self.ampSlider:SetWidth(sliderWidth)
	self.ampSlider:SetMinMax(0.1, 5)
	self.ampSlider:SetDecimals(1)
	self.ampSlider:SetValue(1)
	self.ampSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local ampValueLabel = LoveFrames.Create("text")
	ampValueLabel:SetPos(setPosSliderValueX, y_offset)
	ampValueLabel.Update = function(object)
		object:SetText(tostring(self.ampSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local drawThresholdLabel = LoveFrames.Create("text")
	drawThresholdLabel:SetText("Draw Threshold:")
	drawThresholdLabel:SetPos(setPosLabelX, y_offset)

	self.drawThresholdSlider:SetPos(setPosSliderX, y_offset)
	self.drawThresholdSlider:SetWidth(sliderWidth)
	self.drawThresholdSlider:SetMinMax(0, 1)
	self.drawThresholdSlider:SetDecimals(2)
	self.drawThresholdSlider:SetValue(0.5)
	self.drawThresholdSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local drawThresholdValueLabel = LoveFrames.Create("text")
	drawThresholdValueLabel:SetPos(setPosSliderValueX, y_offset)
	drawThresholdValueLabel.Update = function(object)
		object:SetText(tostring(self.drawThresholdSlider:GetValue()))
	end

	y_offset = y_offset + 40

	local widthLabel = LoveFrames.Create("text")
	widthLabel:SetText("Width:")
	widthLabel:SetPos(setPosLabelX, y_offset)

	self.widthSlider:SetPos(setPosSliderX, y_offset)
	self.widthSlider:SetWidth(sliderWidth)
	self.widthSlider:SetMinMax(100, 10000)
	self.widthSlider:SetValue(WW)
	self.widthSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local widthValueLabel = LoveFrames.Create("text")
	widthValueLabel:SetPos(setPosSliderValueX, y_offset)
	widthValueLabel.Update = function(object)
		object:SetText(tostring(math.floor(self.widthSlider:GetValue())))
	end

	y_offset = y_offset + 40

	local heightLabel = LoveFrames.Create("text")
	heightLabel:SetText("Height:")
	heightLabel:SetPos(setPosLabelX, y_offset)

	self.heightSlider:SetPos(setPosSliderX, y_offset)
	self.heightSlider:SetWidth(sliderWidth)
	self.heightSlider:SetMinMax(100, 10000)
	self.heightSlider:SetValue(WH)
	self.heightSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local heightValueLabel = LoveFrames.Create("text")
	heightValueLabel:SetPos(setPosSliderValueX, y_offset)
	heightValueLabel.Update = function(object)
		object:SetText(tostring(math.floor(self.heightSlider:GetValue())))
	end


	y_offset = y_offset + 40

	local offsetXLabel = LoveFrames.Create("text")
	offsetXLabel:SetText("OffsetX:")
	offsetXLabel:SetPos(setPosLabelX, y_offset)

	self.offsetXSlider:SetPos(setPosSliderX, y_offset)
	self.offsetXSlider:SetWidth(sliderWidth)
	self.offsetXSlider:SetMinMax(1, 10000)
	self.offsetXSlider:SetValue(100)
	self.offsetXSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local offsetXLabelValue = LoveFrames.Create("text")
	offsetXLabelValue:SetPos(setPosSliderValueX, y_offset)
	offsetXLabelValue.Update = function(object)
		object:SetText(tostring(math.floor(self.offsetXSlider:GetValue())))
	end

	y_offset = y_offset + 40

	local offsetYLabel = LoveFrames.Create("text")
	offsetYLabel:SetText("OffsetY:")
	offsetYLabel:SetPos(setPosLabelX, y_offset)

	self.offsetYSlider:SetPos(setPosSliderX, y_offset)
	self.offsetYSlider:SetWidth(sliderWidth)
	self.offsetYSlider:SetMinMax(1, 10000)
	self.offsetYSlider:SetValue(100)
	self.offsetYSlider.OnValueChanged = function(object, value)
		RidgeMap = GenerateRidgeMap(self.widthSlider:GetValue(), self.heightSlider:GetValue(),
			self.frequencySlider:GetValue(),
			self.thresholdSlider:GetValue(), self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
			self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue())
	end

	local offsetYLabelValue = LoveFrames.Create("text")
	offsetYLabelValue:SetPos(setPosSliderValueX, y_offset)
	offsetYLabelValue.Update = function(object)
		object:SetText(tostring(math.floor(self.offsetYSlider:GetValue())))
	end
	return { self.widthSlider:GetValue(), self.heightSlider:GetValue(), self.frequencySlider:GetValue(), self
		.thresholdSlider:GetValue(),
		self.octavesSlider:GetValue(), self.ampSlider:GetValue(),
		self.drawThresholdSlider:GetValue(), self.offsetXSlider:GetValue(), self.offsetYSlider:GetValue() }
end

return Sliders
