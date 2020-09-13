<template>
    <div>
        <Header />
        <dataUser />
    </div>
</template>

<script>
    import Header from '../components/header'
    import dataUser from '../components/container_data_employees'
	export default {
		name: 'App',
		components: {
			Header, dataUser
		},
        mounted() { const status = localStorage.getItem('status')
            if(!status) this.$router.push('/')
        }
	}
</script>