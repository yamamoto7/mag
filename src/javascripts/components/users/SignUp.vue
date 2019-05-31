<template>
  <div>
    <h2>基本情報入力</h2>
    <div class="wrap">
      <div class="label-box"><span class="label">フルネーム</span><span class="hissu">※必須</span>{{ this.errors['first_kana'] }}{{ this.errors['last_kana'] }}{{ this.errors['first_name'] }}{{ this.errors['last_name'] }}</div>
      <input class="text-form" type="text" v-model="user.first_name" placeholder="姓"/>
      <input class="text-form" type="text" v-model="user.last_name" placeholder="名"/><br>
      <input class="text-form" type="text" v-model="user.first_kana" placeholder="セイ"/>
      <input class="text-form" type="text" v-model="user.last_kana" placeholder="メイ"/><br>

      <div class="label-box"><span class="label">性別</span><span class="hissu">※必須</span>{{ this.errors['sex'] }}</div>
      <div class="radio-form">
        <input class="radio02-input" type="radio" id="one" value="One" v-model="user.sex">
        <label for="one">男性</label>
      </div>
      <div class="radio-form">
        <input class="radio02-input" type="radio" id="two" value="Two" v-model="user.sex">
        <label for="two">女性</label>
      </div>


      <div class="label-box"><span class="label">生年月日</span><span class="hissu">※必須</span>{{ this.errors['birth_year'] }}{{ this.errors['birth_month'] }}{{ this.errors['birth_date'] }}</div>
      <select v-model="user.birth_year" @change="get_days">
        <option v-for="n in 90" :value="n + 1910">
          {{ n + 1910 }}
        </option>
      </select>
      <select v-model="user.birth_month" @change="get_days">
        <option v-for="n in 12" :value="n">
          {{ n }}
        </option>
      </select>
      <select v-model="user.birth_date">
        <option v-for="n in parseInt(days_max, 10)" :value="n">
          {{ n }}
        </option>
      </select>

      <div class="label-box"><span class="label">メールアドレス</span><span class="hissu">※必須</span>{{ this.errors['email'] }}</div>
      
      <input class="text-form text-form-long" v-model="user.email" /><br>
      <div class="label-box"><span class="label">パスワード</span><span class="hissu">※必須</span>{{ this.errors['password'] }}</div>
      <input class="text-form text-form-long" type="password" v-model="user.password" /><br>
      <input class="text-form text-form-long" type="password" placeholder="もう一度入力してください" /><br>
      <div class="label-box"><span class="label">電話番号</span><span class="hissu">※必須</span>{{ this.errors['phone_number'] }}</div>
      <input class="text-form text-form-long" v-model="user.phone_number"/><br>
      <button class="btn" type="submit" @click="submitUser">次へ</button>
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      // フォームなどで送信する亀の情報を保存
      user: {
        first_name: '',
        last_name: '',
        first_kana: '',
        last_kana: '',
        birth_year: '',
        birth_month: '',
        birth_date: '',
        email: '',
        password: '',
        phone_number: ''
      },
      days_max: '0',
      errors: []
    }
  },
  mounted () {
  },
  methods: {
    // ---------------------- ユーザー登録 ----------------------
    async submitUser () {
      // ユーザー登録を行っている。メールアドレス、パスワードが必須で情報は
      // data()のuserに詰めて渡している。
      try {
        const response = await http.post('/api/users/sign_up', this.user)
        // バリデーションのエラーが返ってきた場合の処理。
        // Emailアドレスが既に使われているなど。
        if (response.status === 202) {
          // エラー内容をdataに入れる。
          this.errors = response.data.error
        } else {
          // リダイレクト先指定。
          document.location = '/save_image'
        }
      } catch (error) {
        // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
        console.log(error)
      }
    },
    // ---------------------- フォームに入力してある値をdata()にある値に保存するための関数。
    get_days () {
      this.days_max = new Date(this.user.birth_year, this.user.birth_month, 0).getDate()
    }
  },
  components: {
  }
}
</script>

<style scoped>
@import '../../../style/users/sign_up.scss'
</style>
