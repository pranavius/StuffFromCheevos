---@class SFCMain
SFCMainMixin = Mixin({}, PortraitFrameMixin)

function SFCMainMixin:OnLoad()
    self:SetTitle("Stuff From Cheevos")
    -- Positioning logic
    self.CategoryInset:SetPoint("TOPLEFT", self.PortraitContainer.CircleMask, "BOTTOMLEFT", 2, -10)

    -- Black background for the AddOn logo on (prevents transparency)
    local pBg = self.PortraitContainer:CreateTexture(nil, "BACKGROUND")
    pBg:SetAllPoints(self.PortraitContainer.portrait)
    pBg:SetColorTexture(0, 0, 0, 1)
    pBg:AddMaskTexture(self.PortraitContainer.CircleMask)
    self:SetPortraitTextureRaw("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo-RoughSketch")
end

function SFCMainMixin:OnDragStart()
    self:StartMoving()
end

function SFCMainMixin:OnDragStop()
    self:StopMovingOrSizing()
end