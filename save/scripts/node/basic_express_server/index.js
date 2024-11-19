require("dotenv").config()

const express = require("express")
const http = require("http")
const cors = require("cors")

const app = express()
const server = http.createServer(app)

const data = require('./data/data.json')
const file = require( "./modules/file.js" )

app.use(cors({
	origin: '*',
	// origin:[  'http://www.google.fr' ,'http://www.google.fr' ],
	methods: ['GET', 'POST', 'DELETE', 'UPDATE', 'PUT', 'PATCH', 'OPTIONS']
}))

//app.get('/', (req,res) => {
//	res.sendFile(path.join(__dirname, './public/index.html'))
//})

app.use('/', express.static(path.join(__dirname, './public')))

app.listen(port, ()=>{
	console.log(`port ${port} is open`)
})

server.listen(port, ()=> console.log("Listening on ", process.env.PORT))


