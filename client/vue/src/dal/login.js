import axios from 'axios'

class DAL_Login {
	static checkLogin(login, password) {
		const API_URL = 'http://localhost:3000/api-login'
		return axios.post(API_URL, {login, password})
	}
}
export default DAL_Login