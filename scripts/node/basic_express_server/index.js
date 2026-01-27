require("dotenv").config()

const express = require("express")
const http = require("http")
const cors = require("cors")
const path = require('path')

const app = express()
const server = http.createServer(app)

// const file = require( "./modules/file.js" )

app.use(cors({
	origin: '*',
	// origin:[  'http://www.google.fr' ,'http://www.google.fr' ],
	methods: ['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH', 'OPTIONS']
}))

app.get('/', (req, res) => {
	res.sendFile(path.join(__dirname, './public/index.html'))
})

app.get("/:dir/:file", (req, res) => {
	res.sendFile(path.join(__dirname, './public/'+req.params.dir+"/"+req.params.file))
})

server.listen(process.env.PORT, ()=> console.log("Listening on ", process.env.PORT))


