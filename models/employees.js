const mysql = require('mysql2/promise')
const config = require('../config')

class Model {
    static async getAllData() {
        const conn = await mysql.createConnection(config)
        const [rows] = await conn.execute("SELECT * FROM employees")
        conn.end()
        return rows
    }
    static async getLastPosts(number) {
        const conn = await mysql.createConnection(config)
        const postType = 'blog'
        const [rows] = await conn.execute(`SELECT post_title, slug, permalink, thumbnail, desc_post, data_published FROM posts 
		WHERE post_type = '${postType}' ORDER BY data_published DESC LIMIT `+number)
        conn.end()
        return rows
    }
    static async getPostsCategory(number) {
        const conn = await mysql.createConnection(config)
        const numberPostsInCategory = 6
        const postType = 'blog'
        const offset = numberPostsInCategory*number
        let query = ''
        if(offset === 0){
            query = `SELECT post_title, slug, permalink, thumbnail, desc_post, data_published FROM posts 
		WHERE post_type = '${postType}' ORDER BY data_published DESC LIMIT ` + numberPostsInCategory
        }
        else {
            query = `SELECT post_title, slug, permalink, thumbnail, desc_post, data_published FROM posts 
		WHERE post_type = '${postType}' ORDER BY data_published DESC LIMIT `+numberPostsInCategory+` OFFSET `+offset
        }
        const [rows] = await conn.execute(query)
        conn.end()
        return rows
    }
}
module.exports = Model