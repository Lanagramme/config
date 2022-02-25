const express = require('express')  
const app = express()
const path = require('path')

app.get('/', (res,res) => {
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
