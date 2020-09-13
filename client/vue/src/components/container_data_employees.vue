<template>
    <div class="container user_container">
        <div class="user_container_thumbnail">
            <img :src="thumbnail">
        </div>
        <div class="user_container_desc">
            <p class="card_desc">{{name}}</p>
            <p class="card_desc">{{department}}</p>
            <p class="card_desc">{{chief}}</p>
            <p class="card_desc">{{date}}</p>
        </div>
        <div class="user_container_main_desc" v-html="text">
        </div>
    </div>
</template>
<script>
	import DAL_Employees from '../dal/employees'
	export default {
		name: 'data_user',
		data(){
			return {
				name: '',
				department: '',
				chief: '',
				thumbnail: '',
				date: '',
				text: ''
			}
		},
		mounted() {
			const id = this.$route.params.id;
			(async () => {
				const response = await DAL_Employees.getDataById(id)
				if(response.data.status === '200'){
					this.name = response.data.data.name
					this.department = response.data.data.department
					this.chief = response.data.data.chief
					this.thumbnail = response.data.data.thumbnail
					this.date = response.data.data.date.substr(0, 10)
					this.text = response.data.data.text
				}
			})()
		},
	}
</script>
<style>
    .user_container {
        display: flex;
        flex-wrap: wrap;
    }
    .user_container_thumbnail, .user_container_desc {
        padding: 15px;
        width: 50%;
        box-sizing: border-box;
    }
    .user_container_main_desc {
        width: 100%;
        padding: 15px;
    }
    .user_container_thumbnail img {
        width: 100%;
    }
    p {
        margin-bottom: 15px;
    }
    h1,h2,h3,h4,h5,h6 {
        margin-bottom: 25px;
    }
</style>