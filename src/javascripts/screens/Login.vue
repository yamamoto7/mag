<template>
  <div class='screen'>
    <div class='logo'/>

    <div class='login-container'>
      <div class="form">
        <input
          type="text"
          @input="updateUserEmail"
          :value="user.email"
          placeholder="メールアドレス"
        />
        <input
          type='password'
          @input="updateUserPass"
          :value="user.password"
          placeholder="パスワード"
        />
      </div>

      <button
        type="submit"
        @click="newUserSession"
        class='login-btn btn'
      >ログイン</button>
    </div>

    <div class='register-footer' >
      <p class='register-btn btn' @click='RegisterBtn'>
        新規会員登録
      </p>
    </div>
  </div>
</template>

<script>
  import http from '../http'

  export default {
    data () {
      return {
        // フォームなどで送信する亀の情報を保存
        user: {
          email: '',
          password: '',
        }
      }
    },
    mounted () {
    },
    methods: {
      // ---------------------- フォームに入力してある値をdata()にある値に保存するための関数。
      updateUserEmail (e) {
        this.user.email = e.target.value
      },
      updateUserPass (e) {
        this.user.password = e.target.value
      },
      // ---------------------- ログイン ----------------------
      async  newUserSession () {
        try {
          const response = await http.post('/api/users/sign_in', this.user)
          // リダイレクト先指定。
          await this.$router.go()
          this.$router.push('/')
        } catch (error) {
          // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
          console.log(error)
        }
      },
      RegisterBtn: function(){
        // FIXME Router使って
        // this.$router.push('/sign_up');
        window.location.pathname = '/sign_up';
      }
    }
  }
</script>

<style scoped>
  @import '../../style/users/login.scss'
</style>

