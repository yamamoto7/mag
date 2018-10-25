<template>
  <div>
    <h2>ユーザー登録</h2>
    <div>フルネーム</div>
      {{ this.errors }}
    <input type="text" v-model="user.first_name" placeholder="姓"/>
    <input type="text" v-model="user.last_name" placeholder="名"/><br>
    <input type="text" v-model="user.first_kana" placeholder="セイ"/>
    <input type="text" v-model="user.last_kana" placeholder="メイ"/><br>

    <select v-model="user.birth_year" @change="get_days">
      <option v-for="n in 100" :value="n + 1917">
        {{ n + 1917 }}
      </option>
    </select>年
    <select v-model="user.birth_month" @change="get_days">
      <option v-for="n in 12" :value="n">
        {{ n }}
      </option>
    </select>月
    <select v-model="user.birth_date">
      <option v-for="n in parseInt(days_max, 10)" :value="n">
        {{ n }}
      </option>
    </select>日

    <div>メールアドレス</div>
    {{ this.errors['email'] }}
    <input v-model="user.email" /><br>
    <div>パスワード</div>
    <input type="password" v-model="user.password" /><br>
    <div>電話番号</div>
    <input v-model="user.phone_number" placeholder="入力してください"/><br>
    <button type="submit" @click="submitUser">ユーザー登録</button>
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
          await this.$router.go()
          this.$router.push('/')
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