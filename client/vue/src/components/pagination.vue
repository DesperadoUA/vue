<template>
    <div class="wrapper_pagination">
        <ul class="pagination">
            <li
                    v-for="item in pagination"
                    :key="item.value"
                    v-on:click="activate"
                    v-bind:class="item.activate"
            >{{item.value}}</li>
        </ul>
    </div>
</template>
<script>
	import DAL_Employees from '../dal/employees'
	export default {
		name: 'pagination',
		data(){
			return {
				limit: 3,
                offset: 0,
                totalCount: 0,
                pagination: []
			}
		},
		mounted() {
            (async () => {
				let pagination = [];
                const result = await DAL_Employees.detTotalCount()
                const numberPage = Math.ceil(result.data.count / this.limit)
				for(let i=1; i<=numberPage; i++)
				{ const obj = {
                    value: i,
                    activate: 'default'
                }
                    if( i === 1 ) obj.activate = 'active'
					pagination.push(obj)
                }
				this.pagination = pagination
            })()
		},
        methods: {
			activate(event){
				const currentPage = Number(event.target.textContent)
                const newPagination = this.pagination
                for(let i=0; i<newPagination.length; i++)
                { if(newPagination[i].value === currentPage) newPagination[i].activate = 'active'
                  else newPagination[i].activate = 'default'
                }
                this.pagination = newPagination
                this.$emit('changePagination', currentPage)
            }
        }
	}
</script>
<style>
    .wrapper_pagination {
        width: 100%;
        text-align: center;
        padding: 15px;
    }
    .pagination li {
        display: inline-block;
        padding: 10px;
        font-weight: bold;
        cursor: pointer;
    }
    .active {
        color: #e91c60;
    }
</style>