table.insert(libcamera_monitor.rules, {
  matches = {
    {
      { "node.name", "matches", "libcamera_input.*" },
    },
  },
  apply_properties = {
    ["priority.session"] = 1000,
  },
})
