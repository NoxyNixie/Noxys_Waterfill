local waters = {
  ["waterfill"] = { result = "water", order = "a" },
  ["deepwaterfill"] = { result = "deepwater", order = "b" },
  ["waterfill-green"] = { result = "water-green", order = "e" },
  ["deepwaterfill-green"] = { result = "deepwater-green", order = "f" },
  ["shallowwaterfill"] = { result = "water-shallow", order = "c" },
  ["mudwaterfill"] = { result = "water-mud", order = "d" },
  ["water-wubefill"] = { result = "water-wube", order = "e" },
}

for k, v in pairs(waters) do
  data:extend({
    -- Item
    {
      type = "item",
      name = k,
      icon = "__Noxys_Waterfill__/graphics/icons/hr_" .. k .. ".png",
      icon_size = 128,
      subgroup = "terrain",
      order = "c[landfill]-z-" .. v.order .. "[water]",
      stack_size = 100,
      place_as_tile =
      {
        result = v.result,
        condition_size = 1,
        condition = { layers = {} },
      },
    },
    -- Recipe
    {
      type = "recipe",
      name = k,
      energy_required = 1,
      enabled = false,
      category = "crafting-with-fluid",
      ingredients =
      {
        { type = "fluid", name = "water", amount = 1000 },
      },
      results = {
        { type = "item", name = k, amount = 1 },
      }
    },
  })
end
