data:extend{
  {
    type = "item-subgroup",
    name = "ll-polaritons",
    group = "intermediate-products",
    order = "g-c"
  },
  {
    type = "item",
    name = "ll-superposed-polariton",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton.png",
    icon_size = 64,
    pictures = {
      filename = "__LunarLandings__/graphics/icons/polariton/polariton.png",
      scale = 0.25,
      size = 64,
      draw_as_glow = true
    },
    subgroup = "ll-polaritons",
    order = "a[superposed-polariton]",
    stack_size = 1
  },
  {
    type = "item",
    name = "ll-right-polariton",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-right.png",
    icon_size = 64,
    pictures = {
      filename = "__LunarLandings__/graphics/icons/polariton/polariton-right.png",
      scale = 0.25,
      size = 64,
      draw_as_glow = true
    },
    subgroup = "ll-polaritons",
    order = "b[polariton]-b[right]",
    stack_size = 1
  },
  {
    type = "item",
    name = "ll-left-polariton",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-left.png",
    icon_size = 64,
    pictures = {
      filename = "__LunarLandings__/graphics/icons/polariton/polariton-left.png",
      scale = 0.25,
      size = 64,
      draw_as_glow = true
    },
    subgroup = "ll-polaritons",
    order = "b[polariton]-d[left]",
    stack_size = 1
  },
  {
    type = "item",
    name = "ll-up-polariton",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-up.png",
    icon_size = 64,
    pictures = {
      filename = "__LunarLandings__/graphics/icons/polariton/polariton-up.png",
      scale = 0.25,
      size = 64,
      draw_as_glow = true
    },
    subgroup = "ll-polaritons",
    order = "b[polariton]-a[up]",
    stack_size = 1
  },
  {
    type = "item",
    name = "ll-down-polariton",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-down.png",
    icon_size = 64,
    pictures = {
      filename = "__LunarLandings__/graphics/icons/polariton/polariton-down.png",
      scale = 0.25,
      size = 64,
      draw_as_glow = true
    },
    subgroup = "ll-polaritons",
    order = "b[polariton]-c[down]",
    stack_size = 1
  },
  {
    type = "recipe",
    name = "ll-superposition-right-left",
    enabled = false,
    category = "ll-quantum-resonating",
    energy_required = 10,
    ingredients = {
      {type="item", name="ll-right-polariton", amount=1},
      {type="item", name="ll-left-polariton", amount=1},
    },
    results = {
      {type = "item", name = "ll-superposed-polariton", amount = 2, probability = 0.99},
    },
    show_amount_in_title = false,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "ll-superposition-up-down",
    enabled = false,
    category = "ll-quantum-resonating",
    energy_required = 10,
    ingredients = {
      {type="item", name="ll-up-polariton", amount=1},
      {type="item", name="ll-down-polariton", amount=1},
    },
    results = {
      {type = "item", name = "ll-superposed-polariton", amount = 2, probability = 0.99},
    },
    show_amount_in_title = false,
    always_show_products = true,
  },
  {
    type = "recipe",
    name = "ll-polarisation-up",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-up.png",
    icon_size = 64,
    subgroup = "ll-polaritons",
    order = "b[polarisation]-a[up]",
    enabled = false,
    category = "ll-quantum-resonating",
    energy_required = 10,
    ingredients = {
      {type="item", name="ll-up-polariton", amount=1},
    },
    results = {
      {type = "item", name = "ll-right-polariton", amount = 1, probability = 0.60},
      {type = "item", name = "ll-down-polariton", amount = 1, probability = 0.25},
      {type = "item", name = "ll-left-polariton", amount = 1, probability = 0.1},
      {type = "item", name = "ll-up-polariton", amount = 1, probability = 0.05},
    },
  },
  {
    type = "recipe",
    name = "ll-polarisation-right",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-right.png",
    icon_size = 64,
    subgroup = "ll-polaritons",
    order = "b[polarisation]-b[right]",
    enabled = false,
    category = "ll-quantum-resonating",
    energy_required = 10,
    ingredients = {
      {type="item", name="ll-right-polariton", amount=1},
    },
    results = {
      {type = "item", name = "ll-down-polariton", amount = 1, probability = 0.60},
      {type = "item", name = "ll-left-polariton", amount = 1, probability = 0.25},
      {type = "item", name = "ll-up-polariton", amount = 1, probability = 0.1},
      {type = "item", name = "ll-right-polariton", amount = 1, probability = 0.05},
    },
  },
  {
    type = "recipe",
    name = "ll-polarisation-down",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-down.png",
    icon_size = 64,
    subgroup = "ll-polaritons",
    order = "b[polarisation]-c[down]",
    enabled = false,
    category = "ll-quantum-resonating",
    energy_required = 10,
    ingredients = {
      {type="item", name="ll-down-polariton", amount=1},
    },
    results = {
      {type = "item", name = "ll-left-polariton", amount = 1, probability = 0.60},
      {type = "item", name = "ll-up-polariton", amount = 1, probability = 0.25},
      {type = "item", name = "ll-right-polariton", amount = 1, probability = 0.1},
      {type = "item", name = "ll-down-polariton", amount = 1, probability = 0.05},
    },
  },
  {
    type = "recipe",
    name = "ll-polarisation-left",
    icon = "__LunarLandings__/graphics/icons/polariton/polariton-left.png",
    icon_size = 64,
    subgroup = "ll-polaritons",
    order = "b[polarisation]-d[left]",
    enabled = false,
    category = "ll-quantum-resonating",
    energy_required = 10,
    ingredients = {
      {type="item", name="ll-left-polariton", amount=1},
    },
    results = {
      {type = "item", name = "ll-up-polariton", amount = 1, probability = 0.60},
      {type = "item", name = "ll-right-polariton", amount = 1, probability = 0.25},
      {type = "item", name = "ll-down-polariton", amount = 1, probability = 0.1},
      {type = "item", name = "ll-left-polariton", amount = 1, probability = 0.05},
    },
  },
}