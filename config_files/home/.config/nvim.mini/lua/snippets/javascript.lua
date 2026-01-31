local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Arrow function
  s("af", {
    t("const "), i(1, "fn"), t(" = ("), i(2), t(") => {"),
    t({ "", "  " }), i(3),
    t({ "", "};" }),
  }),

  -- Console log
  s("cl", {
    t("console.log("), i(1), t(");"),
  }),

  -- Try/catch
  s("tc", {
    t("try {"),
    t({ "", "  " }), i(1),
    t({ "", "} catch (err) {", "  console.error(err);", "}" }),
  }),
}

