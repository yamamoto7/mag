<template>
  <div>
    <div class='logo'>
      <!-- FIXME Withのロゴパクったw https://with.is/welcome -->
      <!--
      <img src='http://cdn.with.is/assets/welcome/variety_lp/with_report_photo2-6fea5b8cc98790c2499aa7e963c4234d.png'>
      -->
    </div>

    <div class='login-container'>
      <h2>
        ログイン
      </h2>
      <div class="custom-form">
        <div class="group" ng-class="{'not-empty': userName.length}">
          <input
            type="text"
            class="form-control"
            @input="updateUserEmail"
            :value="user.email"
            name='email'
            id='email'
          />
          <label for="email" class="animated-label">メールアドレス</label>
        </div>
        <div class="group" ng-class="{'not-empty': passWord.length}">
            <input
              type='password'
              class='form-control'
              name='pass'
              id='pass'
              @input="updateUserPass"
              :value="user.password"
            />
            <label for="pass" class="animated-label">パスワード</label>
        </div>
      </div>

      <button
        type="submit"
        @click="newUserSession"
        class='login-btn btn'
      >ログイン</button>
    </div>

    <div
      class='register-container'
    >
      <button class='register-btn btn'>
        新規会員登録
      </button>
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
      }
    }
  }
</script>

<style scoped>
  @import '../../style/users/login.scss'
</style>

