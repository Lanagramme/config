const express = require('express')
const userRoutes = require('./routes/userRoutes')
const bookRoutes = require('./routes/bookRoutes')

const app = express()
app.use(express.json())

app.use('api/users', userRoutes)
app.use('api/books', bookRoutes)

module.exports = app
