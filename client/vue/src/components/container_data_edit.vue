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
            <p class="input_title">Дата</p>
            <input v-model="date" type="date">
        </div>
        <div class="wrapper_input">
            <p class="input_title">Биография</p>
            <textarea v-model="text"></textarea>
        </div>
        <div class="wrapper_input">
            <button class="btn" v-on:click="sendData">Обновить данные</button>
            <button class="btn margin_10" v-on:click="deleteUser">Удалить пользователя</button>
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
			(async () => {
				const id = this.$route.params.id
				const response = await DAL_Employees.getDataById(id)
				if(response.data.status === '200'){
					this.name = response.data.data.name
					this.department = response.data.data.department
					this.chief = response.data.data.chief
					this.thumbnail = response.data.data.thumbnail
					this.date = response.data.data.date
                    this.text = response.data.data.text
                }
			})()
		},
		methods: {
			async sendData(){ const data = { name: this.name,
                department: this.department,
                chief: this.chief,
                thumbnail: this.thumbnail,
                date: this.date.substr(0, 10),
                text: this.text
                }
                console.log(data)
				const id = this.$route.params.id
                await DAL_Employees.updateDataById(id, data)
                alert("Данные обновлены")
            },
            async deleteUser(){
				console.log('delete')
				const id = this.$route.params.id
				const result = await DAL_Employees.deleteUser(id)
                console.log(result)
				if(result.data.status === 'ok') {
					this.$router.push('/list')
				} else { alert('Error') }
			}
		}
	}
</script>
<style>
    .wrapper_input{
        width: 100%;
        padding: 15px;
    }
    .wrapper_input input {
        height: 50px;
        border-bottom: 3px solid rgba(5,181,229,.7);
        width: 400px;
        padding: 10px;
        font-weight: bold;
        box-sizing: border-box;
    }
    .wrapper_input textarea {
        width: 100%;
        height: 150px;
    }
    .input_title {
        margin-bottom: 15px;
        font-size:22px;
        font-weight: bold;
    }
    .user_container {
        display: flex;
        flex-wrap: wrap;
    }
    .margin_10 {
        margin-left: 10px;
        margin-right: 10px;
    }
</style>