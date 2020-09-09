const {Router} = require('express')
const router = Router()
const EmployeesModel = require('../models/employees')

router.get('/', async (req, res) => {
    const data_post = await EmployeesModel.getAllData()
    res.send(JSON.stringify(data_post))
})
router.post('/', async (req, res) => {
	const data_post = await EmployeesModel.getAllData()
	res.send(JSON.stringify(data_post))
})

module.exports = router