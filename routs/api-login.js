const {Router} = require('express')
const router = Router()
const UsersModel = require('../models/users')

router.post('/', async (req, res) => {
	const data_post = {
		'status': '',
		'confirm': 'not found'
	}
	const [rows] = await UsersModel.checkLogin(req.body.login, req.body.password)
	if(rows) {
		data_post.status = rows.status
		data_post.confirm = 'ok'
	}
	res.send(JSON.stringify(data_post))
})

module.exports = router