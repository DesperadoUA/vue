<template>
    <div class="container user_container">
        <div class="wrapper_input">
            <p class="input_title">Имя</p>
            <input v-model="name" />
        </div>
        <div class="wrapper_input">
            <p class="input_title">Отдел</p>
            <input v-model="department" />
        </div>
        <div class="wrapper_input">
            <p class="input_title">Руководитель</p>
            <input v-model="chief" />
        </div>
        <div class="wrapper_input">
            <p class="input_title">Изображение</p>
            <input v-model="thumbnail" />
        </div>
        <div class="wrapper_input">
            <p class="input_title">Биография</p>
            <textarea v-model="text"></textarea>
        </div>
        <div class="wrapper_input">
            <button class="btn" v-on:click="sendData">Добавить пользователя</button>
        </div>
    </div>
</template>
<script>
	import DAL_Employees from '../dal/employees'
	export default {
		name: 'add_user',
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
		methods: {
			async sendData(){ const data = { name: this.name,
				department: this.department,
				chief: this.chief,
				thumbnail: this.thumbnail,
				text: this.text
			}
				const result = await DAL_Employees.addUser(data)
                if(result.data.status === 'ok') {
					this.$router.push('/user/'+result.data.id)
                } else { alert('Error') }
			}
		}
	}
</script>