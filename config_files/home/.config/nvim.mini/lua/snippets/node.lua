local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Express server
  s("exsrv", {
    t({
      "const express = require('express');",
      "const app = express();",
      "",
      "app.use(express.json());",
      "",
      "app.get('/', (req, res) => {",
      "  res.send('Hello World');",
      "});",
      "",
      "app.listen(",
    }),
    i(1, "3000"),
    t({ ", () => console.log('Server running'));", "" }),
  }),

  -- Express route
  s("exget", {
    t("app.get('"), i(1, "/route"), t("', (req, res) => {"),
    t({ "", "  " }), i(2),
    t({ "", "});" }),
  }),
}

