local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend{
  {
    type = "recipe-category",
    name = "ll-arc-smelting"
  },
  {
    type = "fluid",
    name = "ll-heat",
    default_temperature = 25,
    fuel_value = "1MJ",
    --heat_capacity = "0.1KJ",
    base_color = {r = 75, g = 0, b = 130},
    flow_color = {r = 75, g = 0, b = 130},
    icon = "__core__/graphics/arrows/heat-exchange-indication.png",
    icon_size = 48, icon_mipmaps = 1,
    order = "z[heat]",
    auto_barrel = false,
  },
  {
    type = "recipe",
    name = "ll-arc-furnace",
    ingredients = {
      {"steel-plate", 25},
      {"processing-unit", 5},
      {"concrete", 50}},
    result = "ll-arc-furnace",
    energy_required = 5,
    enabled = false
  },
  {
    type = "item",
    name = "ll-arc-furnace",
    icon = "__LunarLandings__/graphics/icons/arc-furnace.png",
    icon_size = 64, icon_mipmaps = 1,
    subgroup = "smelting-machine",
    order = "e[arc-furnace]",
    place_result = "ll-arc-furnace",
    stack_size = 50
  },
  {
    name = "ll-arc-furnace",
    type = "assembling-machine",
    icon = "__LunarLandings__/graphics/icons/arc-furnace.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {
      mining_time = 0.5,
      result = "ll-arc-furnace"
    },
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-2.1, -2.1}, {2.1, 2.1}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    --map_color = ei_data.colors.assembler,
    crafting_categories = {"ll-arc-smelting"},
    crafting_speed = 3,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = 1,
      drain = "300kW",
    },
    energy_usage = "10MW",  -- 9MW will be output as heat, which the player can turn back into electricity
    --result_inventory_size = 1,
    --source_inventory_size = 1,
    --allowed_effects = {"consumption", "speed", "productivity", "pollution"},
    module_specification = {
        module_slots = 0
    },
    base_productivity = 0.5,
    fluid_boxes = {
      {
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        pipe_connections = {
          {type = "input", position = {3, 0}},
        },
        production_type = "input",
      },
      {
        base_area = 1,
        base_level = 1,
        height = 2,
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        pipe_connections = {
          {type = "output", position = {-3, 0}},
        },
        production_type = "output",
      },
      {
        base_area = 0.1,
        base_level = 1,
        height = 1,
        --pipe_covers = pipecoverspictures(),
        --pipe_picture = ei_pipe_big_insulated,
        hide_connection_info = true,
        filter = "ll-heat",
        pipe_connections = {
          {type = "output", position = {1, 2.2}},
        },
        production_type = "output",
      },
      off_when_no_fluid_recipe = true
    },
    always_draw_idle_animation = true,
    idle_animation = {
      layers = {
        {
          filename = "__LunarLandings__/graphics/entities/arc-furnace/arc-furnace-hr-shadow.png",
          size = {600, 400},
          shift = {0, 0},
          scale = 0.5,
          line_length = 1,
          frame_count = 1,
          repeat_count = 40,
          draw_as_shadow = true,
          animation_speed = 0.25,
        },
        {
          filename = "__LunarLandings__/graphics/entities/arc-furnace/arc-furnace-hr-structure.png",
          size = {320, 320},
          shift = {0, 0},
          scale = 0.5,
          line_length = 1,
          frame_count = 1,
          repeat_count = 40,
          animation_speed = 0.25,
        },
      },
    },
    working_visualisations = {{
      fadeout = true,
      secondary_draw_order = 1,
      animation = {
        layers = {
          {
            filename = "__LunarLandings__/graphics/entities/arc-furnace/arc-furnace-hr-animation-emission-1.png",
            size = {320, 320},
            shift = {0, 0},
            scale = 0.5,
            line_length = 8,
            lines_per_file = 8,
            frame_count = 40,
            --draw_as_light = true,
            draw_as_glow = true,
            blend_mode = "additive",
            animation_speed = 0.25,
            --run_mode = "backward",
          },
        },
      },
    }},
      --[[{
        light = {
          type = "basic",
          intensity = 1,
          size = 15
        }
      }]]
    --},
    working_sound =
    {
      sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.6},
      apparent_volume = 0.3,
    },
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        source_effects = {
          {
            type = "script",
            effect_id = "ll-arc-furnace-created",
          },
        }
      }
    },
    surface_conditions = {nauvis = false, luna = true},
  },
  {
    type = "reactor",
    name = "ll-arc-furnace-reactor",
    icon = "__LunarLandings__/graphics/icons/arc-furnace.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "not-deconstructable", "not-blueprintable", "no-automated-item-insertion", "no-automated-item-removal"},
    placeable_by = {item = "ll-arc-furnace", count = 1},  -- So that pipette works
    --minable = {mining_time = 0.5, result = "nuclear-reactor"},
    max_health = 500,
    --corpse = "nuclear-reactor-remnants",
    --dying_explosion = "nuclear-reactor-explosion",
    consumption = "1GW",
    --neighbour_bonus = 1,
    energy_source =
    {
      type = "fluid",
      fluid_box = {
        base_area = 1,
        base_level = -1,
        height = 2,
        --pipe_covers = pipecoverspictures(),
        --pipe_picture = ei_pipe_big_insulated,
        hide_connection_info = true,
        filter = "ll-heat",
        pipe_connections = {
          {type = "input", position = {2, 2.2}},
          {type = "input", position = {-2.2, 2}},
          {type = "input", position = {-2, -2.2}},
          {type = "input", position = {2.2, -2}},
        },
        production_type = "input",
      },
      burns_fluid = true,  -- Power is based on fluid's fuel_value
      scale_fluid_usage = true,  -- Don't waste excess
      render_no_power_icon = false,
    },
    scale_energy_usage = true,  -- Stop when temperature is at max
    neighbour_bonus = 0,
    collision_box = {{-2.1, -2.1}, {2.1, 2.1}},
    --selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {"not-colliding-with-itself"},
    surface_conditions = {nauvis = true, luna = true},
    damaged_trigger_effect = hit_effects.entity(),
    lower_layer_picture =
    {
      filename = "__LunarLandings__/graphics/entities/arc-furnace/arc-furnace-hr-heatpipes.png",
      --filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
      width = 320,
      height = 320,  -- 316
      scale = 0.5,
      shift = util.by_pixel(-1, -5)
    },
    heat_lower_layer_picture = apply_heat_pipe_glow
    {
      filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes-heated.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-0.5, -4.5)
    },

    working_light_picture = util.empty_sprite(),

    --light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}},
    -- use_fuel_glow_color = false, -- should use glow color from fuel item prototype as light color and tint for working_light_picture
    -- default_fuel_glow_color = { 0, 1, 0, 1 } -- color used as working_light_picture tint for fuels that don't have glow color defined

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {-2, -2},
          direction = defines.direction.north
        },
        {
          position = {0, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.north
        },
        {
          position = {2, -2},
          direction = defines.direction.east
        },
        {
          position = {2, 0},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.east
        },
        {
          position = {2, 2},
          direction = defines.direction.south
        },
        {
          position = {0, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.south
        },
        {
          position = {-2, 2},
          direction = defines.direction.west
        },
        {
          position = {-2, 0},
          direction = defines.direction.west
        },
        {
          position = {-2, -2},
          direction = defines.direction.west
        }
      },

      --[[heat_picture = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
        width = 108,
        height = 128,
        shift = util.by_pixel(1, -7),
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-heated.png",
          width = 216,
          height = 256,
          scale = 0.5,
          shift = util.by_pixel(3, -6.5)
        }
      },]]
    },

    connection_patches_connected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    connection_patches_disconnected =
    {
      sheet =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          scale = 0.5
        }
      }
    },

    heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow
      {
        filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
        width = 32,
        height = 32,
        variation_count = 12,
        y = 32,
        hr_version =
        {
          filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
          width = 64,
          height = 64,
          variation_count = 12,
          y = 64,
          scale = 0.5
        }
      }
    },

    --vehicle_impact_sound = sounds.generic_impact,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    --[[working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/nuclear-reactor-1.ogg",
          volume = 0.55
        },
        {
          filename = "__base__/sound/nuclear-reactor-2.ogg",
          volume = 0.55
        }
      },
      --idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
      max_sounds_per_type = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },]]
  },
  {
    type = "storage-tank",
    name = "ll-arc-furnace-storage-tank",
    icon = "__LunarLandings__/graphics/icons/arc-furnace.png",
    icon_size = 64,
    flags = {"placeable-player", "player-creation", "not-deconstructable", "not-blueprintable", "hide-alt-info"},
    --flags = {"placeable-player", "player-creation", "not-deconstructable", "not-blueprintable", "placeable-off-grid"},
    --flags = {"placeable-player", "player-creation", "not-deconstructable", "not-blueprintable"},

    max_health = 500,
    order = "zz",
    --collision_box = {{-0.25, -1}, {0.25, 1}},
    --selection_box = {{-0.25, -1}, {0.25, 1}},
    collision_box = {{-0.75, -0.25}, {0.75, 0.25}},
    selection_box = {{-0.75, -0.25}, {0.75, 0.25}},
    selectable_in_game = false,
    --collision_box = {{-1, -0.5}, {1, 0.5}},
    --selection_box = {{-1, -0.5}, {1, 0.5}},

    collision_mask = {"not-colliding-with-itself"},
    --selectable_in_game = selectable,
    fluid_box =
    {
      filter =  "ll-heat",
      base_area = 0.05, -- gets multiplied by 100 by engine
      base_level = 0, -- pull fluid in
      pipe_connections =
      {
        --{ position = {-0.5, -0.5} }, -- connects to machine
        --{ position = {-0.5, 0.5} }, -- connects to reactor
        { position = {-0.5, -1} }, -- connects to machine
        { position = {0.5, -1} }, -- connects to reactor
        --{ position = {-0.5, -0.5} }, -- connects to machine
      },
    },
    window_bounding_box = {{-0.0, 0.0}, {0.0, 1.0}},
    pictures = {
      picture = util.empty_sprite(),
      window_background = util.empty_sprite(),
      fluid_background = util.empty_sprite(),
      flow_sprite = util.empty_sprite(),
      gas_flow = util.empty_sprite(),
    },
    flow_length_in_ticks = 360,
    circuit_wire_max_distance = 0
  },
}