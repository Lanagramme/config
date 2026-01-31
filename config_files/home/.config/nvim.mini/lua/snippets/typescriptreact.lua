local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

return {
  -- React function component
  s("rfc", {
    t("const "), i(1, "Component"), t(" = () => {"),
    t({ "", "  return (" }),
    t({ "", "    <div>" }),
    t({ "", "      " }), i(2),
    t({ "", "    </div>" }),
    t({ "", "  );" }),
    t({ "", "};", "", "export default " }),
    f(function(args) return args[1][1] end, {1}),
  }),

  -- useState
  s("us", {
    t("const ["), i(1, "state"), t(", set"),
    f(function(args)
      return args[1][1]:gsub("^%l", string.upper)
    end, {1}),
    t("] = useState("), i(2), t(");"),
  }),

  -- useEffect
  s("ue", {
    t("useEffect(() => {"),
    t({ "", "  " }), i(1),
    t({ "", "}, [" }), i(2), t("]);"),
  }),
}

