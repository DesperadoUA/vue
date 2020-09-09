<template>
  <div id="app">
    <Login />
  </div>
</template>

<script>
import Login from '@/components/login'

export default {
  name: 'App',
  components: {
    Login
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
  *{
    padding:0px;
    margin: 0px;
  }
</style>
