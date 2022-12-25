/*
	Basic middleware configuration

	app.METHODS(PATH, HANDLER)

	app :: get, post, put, delete
	PATH :: route
	HANDLER :: callback

	app.get('/', ( req, res ) => {
		res.json('this message will appear on the browser')
	})

*/
const app = require('express')()
const path = require('path')

app.get('/', (req,res) => {
	res.sendFile(path.join(__dirname, './index.html'))
})

app.get('/:file', (req,res) => {
	let fileName = req.params.file
	res.sendFile(path.join(__dirname, './'+ fileName))
})

app.get('/:folder/:file', (req,res) => {
	let fileName = req.params.file
	let folder = req.params.folder
	res.sendFile(path.join(__dirname, `./${folder}/${fileName}`))
})

app.listen(1337)
console.log('Server Started')
