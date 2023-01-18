
for i,v in pairs(workspace.tower.sections:GetDescendants()) do
  if v.Name == "kills" then
    v.Parent.Transparency = 1
    v:Destroy()
  end
end
