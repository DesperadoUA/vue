<template>
    <div>
        <Header />
        <containerEmployees />
    </div>
</template>

<script>
    import Header from '../components/header'
    import containerEmployees from '../components/container_employees'
	export default {
		name: 'App',
		components: {
			Header, containerEmployees
		},
        mounted() { const status = localStorage.getItem('status')
            if(!status) this.$router.push('/')
        }
	}
</script>