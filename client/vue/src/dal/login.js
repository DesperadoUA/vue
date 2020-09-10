import axios from 'axios'

class DAL_Login {
	static checkLogin(url, login, password) {
		return axios.post(url, {login, password})
	}
}
export default DAL_Login