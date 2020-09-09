<template>
    <main class="main_page_template">
        <div class="container_form">
            <form class="login_form" method="post" action="" @submit.prevent="sendData">
                <h2>Login form</h2>
                <div class="inputBox">
                    <input type="text"
                           name="login"
                           placeholder="Login"
                           v-model="login"
                           class="input_mm js_login"
                    >
                </div>
                <div class="inputBox">
                    <input
                            type="password"
                            name="password"
                            placeholder="Password"
                            v-model="password"
                            class="input_mm js_password"
                    >
                </div>
                <button class="submit_mm">Login</button>
                <div class="error_block"></div>
            </form>
        </div>
    </main>
</template>

<script>
    export default {
        name: 'login',
        data(){
            return {
                login: '',
                password: ''
            }
        },
        methods: {
           async sendData(){
                const API_URL = 'http://localhost:3000/api'
                const login = this.login
                const password = this.password

                const result = await fetch(API_URL, {
						method: 'POST',
						body: JSON.stringify({login, password})
					}
				)
					.then(response => response.json())
					.then( data => data )
                console.log(result)
            }
        }
    }
</script>

<style>
    .main_page_template {
        width: 100%;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #000;
        font-family: 'Forum', cursive;
    }
    .container_form
    {
        position: relative;
        width: 450px;
        min-height:320px;
        background: rgba(255, 255, 255, 0.05);
        box-shadow: 0 5px 15px rgba(0,0,0,1);
    }
    .container_form:before
    {
        content: '';
        position: absolute;
        top:0;
        left:0;
        width:50%;
        height:100%;
        pointer-events: none;
    }
    .container_form:after
    {
        content:'';
        position: absolute;
        top:-5px;
        left:-5px;
        right:-5px;
        bottom: -5px;
        background: linear-gradient(45deg, #ff0047, #6eff00);
        pointer-events: none;
        animation: animate 10s linear infinite;
    }
    @keyframes animate
    {
        0%
        {
            filter:blur(60px) hue-rotate(0deg);
        }
        100%
        {
            filter:blur(60px) hue-rotate(360deg);
        }
    }
    .login_form {
        position: absolute;
        width: 100%;
        height: 100%;
        padding: 40px;
        box-sizing: border-box;
        z-index: 1;
    }
    h2
    {
        margin: 0px;
        padding: 0px;
        color: #fff;
        font-size: 24px;
    }
    .input_mm
    {
        max-width: none;
        width: 100%;
        margin-top: 20px;
        background: transparent;
        border:none;
        border-bottom: 2px solid #fff;
        outline: none;
        font-size: 18px;
        color:#fff;
        padding: 5px 0px;
        font-family: 'Forum', cursive;
    }
    .input_mm:focus, .input_mm:active
    {
        background: transparent;
    }
    .submit_mm
    {
        background: #fff;
        color: #000;
        border:none;
        font-weight: 900;
        font-family: 'Forum', cursive;
        font-size: 18px;
        margin-left: 0px;
        width: 100px;
        padding: 5px 0px;
        text-transform: none;
        margin-top: 20px;
        cursor: pointer;
        display: inline-block;
        text-align: center;
    }
    .error_block {
        margin-top: 15px;
        text-align: center;
        margin-bottom: 0px;
        color:#eee;
        font-family: 'Forum', cursive;
    }
    .input_mm::placeholder {
        color: #eee;
    }
</style>