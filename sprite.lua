sprite = {}
sprite.__index = sprite

function sprite.new(image, x, y)
    local self = setmetatable({}, Sprite)
    self.image = image
    self.x = x or 0
    self.y = y or 0
    self.visible = true
    self.rotation = 0
    self.scale = 1
    return self
end

function sprite:moveTo(x, y)
    self.x = x
    self.y = y
end

function Sprite:moveBy(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

function sprite:setVisible(visible)
    self.visible = visible
end

function sprite:setRotation(radians)
    self.rotation = radians
end

function Sprite:setScale(scale)
    self.scale = scale
end

function sprite:draw()
    if self.visible and self.image then
        local ox = self.image:getWidth() / 2
        local oy = self.image:getHeight() / 2
        love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scale, self.scale, ox, oy)
    end
end
