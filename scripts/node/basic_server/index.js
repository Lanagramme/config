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

app.get("/write", async (req,res,next) => {
	data[0].valeur +=1
	file.writeData(data, "data.json")
		.then( R => {
			R.success 
				? res.send(data)
				: res.send(R.message)
		} )

})

app.get('/exist', async (req, res, next) => {
	file.fileExist("data.json")
		.then(exist => {
			console.log(exist)
			exist 
				?	res.send("Le fichier existe")
				: res.send("Le fichier n'existe pas")
		})
})

server.listen(port, ()=> console.log("Listening on ", process.env.PORT))


