<template>
    <div class="container container_loop">
        <Filters v-on:changeFilters="changeFilters" />
        <card
                v-for="post of posts"
                v-bind:key="post"
                v-bind:post="post"
        />
        <Pagination v-on:changePagination="changePagination"/>
    </div>
</template>
<script>
    import card from './card'
	import Pagination from './pagination'
    import Filters from './filters'
    import DAL_Employees from '../dal/employees'
	export default {
		data(){
			return {
				posts: [],
                limit: 3,
                offset: 0
			}
		},
		mounted() {
            (async () => { const limit = this.limit
                const offset = this.offset
                const response = await DAL_Employees.getPosts(limit, offset)
				this.posts = response.data
			})()
		},
        components: {
			Pagination,
			card,
			Filters
        },
		methods: {
            async changePagination(number) { this.offset = this.limit * (number - 1)
				const offset = this.offset
				const limit = this.limit
				const response = await DAL_Employees.getPosts(limit, offset)
				this.posts = response.data
            },
            async changeFilters(settings){ const response = await DAL_Employees.getDataFilterPosts(settings)
                console.log(response.data)
                this.posts = response.data.posts
            }
		}
	}
</script>
<style>
    .container_loop {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
    }
</style>