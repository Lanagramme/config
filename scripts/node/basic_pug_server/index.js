const 
	express = require('express')
	app = express()

app.set('view engine', 'pug')
app.use(express.static('public'))

app.get('/', (req, res) => {
	res.render('index.pug', {
		title: "app list"
	})
})

app.get('/about', (req, res) => {
	res.render('about.pug', {
		title: "app list"
	})
})

app.listen(1234, () => {
	console.log('server is running on 1234')
})
