<template>
    <div class="card">
        <img :src="post.thumbnail" class="thumbnail">
        <div class="card_desc_wrapper">
            <p class="card_desc">
                <router-link :to="{ name: 'user', params: { id: post.id }}">{{post.name}}</router-link>
            </p>
            <p class="card_desc">{{post.department}}</p>
            <p class="card_desc">{{post.chief}}</p>
            <p class="card_desc">{{post.date | changeData}}</p>
            <p class="card_desc" v-if="status">
                <router-link :to="{ name: 'edit', params: { id: post.id }}">Редактировать</router-link>
            </p>
        </div>
    </div>
</template>
<script>
	export default {
		name: 'card',
        props: ['post'],
		data(){
			return {
				status: false,
			}
		},
		mounted(){
            const status = localStorage.getItem('status')
            if(status === 'admin') this.status = true
        },
        filters: {
            changeData(item){ return item.substr(0, 10)
            }
        }
	}
</script>
<style>
    .card {
        width:320px;
        border:3px solid gray;
        border-radius: 4px;
        margin: 10px;
    }
    .card_desc {
        font-weight: bolder;
        margin-bottom: 10px;
    }
    .card img {
        width: 100%;
        max-width: 100%;
    }
    .card_desc_wrapper {
        padding: 15px;
    }
</style>