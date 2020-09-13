import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/views/Home'
import List from '@/views/List'
import User from '@/views/User'
import Edit from '@/views/Edit'
import Add from '@/views/Add'

Vue.use(Router)
export default new Router({
	mode: 'history',
	routes: [
		{
			path: '/',
			component: Home
		},
		{
			path: '/list',
			component: List
		},
		{
			path: '/user/:id',
			name: 'user',
			component: User
		},
		{
			path: '/edit/:id',
			name: 'edit',
			component: Edit
		},
		{
			path: '/add',
			name: 'add',
			component: Add
		}
	]
})