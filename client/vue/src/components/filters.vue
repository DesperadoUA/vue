<template>
    <div class="container container_filters">
        <select
                v-model="filterName"
                @change="changeFiltersName"
        >
            <option
                    v-for="item of name"
                    v-bind:key="item.id"
            >{{item.value.name}}
            </option>
        </select>
        <select
                v-model="filterDepartment"
                @change="changeFiltersDepartment"
        >
            <option
                    v-for="item of department"
                    v-bind:key="item.id"
            >{{item.value.department}}
            </option>
        </select>
        <select
                v-model="filterChief"
                @change="changeFiltersChief"
        >
            <option
                    v-for="item of chief"
                    v-bind:key="item.id"
            >{{item.value.chief}}
            </option>
        </select>
    </div>
</template>
<script>
	import DAL_Employees from '../dal/employees'
	export default {
		name: 'filters',
		data(){
			return {
				name:[],
                department:[],
                chief:[],
                filterName: 'Все',
                filterDepartment: 'Все',
				filterChief: 'Все',
			}
		},
		mounted() {
			(async () => {
				const result = await DAL_Employees.getDataForFilters()

                const newName = [{value: {name: 'Все'}, id: result.data.name.length}]
                for(let item of result.data.name) newName.push(item)
                this.name = newName

				const newDepartment = [{value: {department: 'Все'}, id: result.data.department.length}]
				for(let item of result.data.department) newDepartment.push(item)
				this.department = newDepartment

				const newChief = [{value: {chief: 'Все'}, id: result.data.chief.length}]
				for(let item of result.data.chief) newChief.push(item)
				this.chief = newChief
			})()
		},
		methods: {
            changeFiltersName(){
                const settings = { name: this.filterName,
                    department: this.filterDepartment,
                    chief: this.filterChief
                }
				this.$emit('changeFilters', settings)
            },
			changeFiltersDepartment(){
				const settings = {
					name: this.filterName,
					department: this.filterDepartment,
					chief: this.filterChief
				}
				this.$emit('changeFilters', settings)
			},
			changeFiltersChief(){
				const settings = {
					name: this.filterName,
					department: this.filterDepartment,
					chief: this.filterChief
				}
				this.$emit('changeFilters', settings)
			}
		}
	}
</script>
<style>
    .container_filters {
        width: 100%;
        display: flex;
        justify-content: space-between;
        padding: 15px;
    }
    .container_filters select {
        width:250px;
        border-bottom: 3px solid rgba(5,181,229,.7);
        padding: 5px;
    }

</style>