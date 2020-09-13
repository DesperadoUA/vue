<template>
    <div>
        <Header />
        <addUser />
    </div>
</template>

<script>
	import Header from '../components/header'
	import addUser from '../components/container_add'
	export default {
		name: 'Add',
		components: {
			Header, addUser
		},
		mounted() { const status = localStorage.getItem('status')
			if(!status && status !== 'admin') this.$router.push('/')
		}
	}
</script>