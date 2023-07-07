-- decompiled by Sentinel (took 183.464µs)
if not game:IsLoaded() then
	game.Loaded:Wait()
end
game:GetService("ContentProvider"):PreloadAsync((game:GetDescendants()))
