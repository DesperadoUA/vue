import axios from 'axios'

class DAL_Employees {
	static getPosts(limit, offset) {
		const API_URL = 'http://localhost:3000/api'
		return axios.post(API_URL, {limit, offset})
	}
	static getDataById(id){
		const API_URL = 'http://localhost:3000/api/id'
		return axios.post(API_URL, {id})
	}
	static updateDataById(id, data){
		const API_URL = 'http://localhost:3000/api/edit'
		const request = {
			id,
			data
		}
		return axios.post(API_URL, request)
	}
	static detTotalCount(){
		const API_URL = 'http://localhost:3000/api/total'
		return axios.post(API_URL)
	}
	static getDataForFilters(){
		const API_URL = 'http://localhost:3000/api/filters'
		return axios.post(API_URL)
	}
	static getDataFilterPosts(settings) {
		const API_URL = 'http://localhost:3000/api/filters-post'
		return axios.post(API_URL, settings)
	}
	static addUser(data){
		const API_URL = 'http://localhost:3000/api/add'
		return axios.post(API_URL, data)
	}
	static deleteUser(id){
		const API_URL = 'http://localhost:3000/api/delete'
		const request = {id}
		return axios.post(API_URL, request)
	}
}
export default DAL_Employees