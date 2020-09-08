const express = require('express')
const path = require('path')
const apiRoutes = require('./routs/api')

const app = express()
app.use('/api', apiRoutes)

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
    console.log(`Server is Run on port ${PORT}`)
})