const helpers = {
	checkLogin(){ const status = localStorage.getItem('status')
		if(!status) this.$router.push('Home')
	}
}
export default helpers