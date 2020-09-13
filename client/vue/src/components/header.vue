<template>
    <header class="header">
        <div class="container nav-container">
            <button class="btn" v-on:click="logout">Logout</button>
            <nav>
                <ul class="nav_list">
                    <li>
                        <router-link to="/list">Все сотрудники</router-link>
                    </li>
                    <li v-if="status">
                        <router-link to="/add">Добавить сотрудника</router-link>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
</template>
<script>
	export default {
		name: 'header',
		data(){
			return {
				status: false
			}
		},
		methods: {
			logout(){
				localStorage.clear()
				this.$router.push('/')
            }
		},
        mounted(){
			const status = localStorage.getItem('status')
			if(status === 'admin') this.status = true
        }
	}
</script>
<style>
    .header {
        padding: 15px;
        background: rgba(5,181,229,.7);
    }
    .container {
        width: 90%;
        max-width: 1280px;
        margin: 0 auto;
        text-align: left;
    }
    .btn {
        padding: 15px 25px;
        background: #e91c60;
        text-transform: uppercase;
        font-weight: bolder;
        cursor: pointer;
        color: white;
        border-radius: 4px;
    }
    .nav-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .nav_list {
        list-style: none;
        margin: 0px;
        padding: 0px;
        font-weight: bolder;
    }
    .nav_list a {
        text-decoration: none;
        text-transform: uppercase;
    }
    .nav_list li {
        display: inline-block;
        padding: 15px;
    }
</style>