<template>
  <div>
    <div class="bar-box">
      <div class="bar-text">プロフィール充実度</div>
      <div class="bar">
        <div class="bar-content" :style="{width: this.count + '%'}">{{ this.count }}%</div>
      </div>
      <!-- <profile-editor></profile-editor> -->
      <div class="btn-box">
        <button class="logout" type="submit" @click="updateUser">更新</button>
        <button class="logout" type="submit" @click="destroyUserSession">ログアウト</button>
      </div>
    </div>
  </div>
</template>

<script>
import http from '../../http'
import ProfileEditor from './ProfileEditor.vue'

export default {
  data () {
    return {
      file: '',
      user: '',
      images: '',
      edit: [true, true],
      count: 0
    }
  },
  async mounted () {
    try {
      const response = await http.get('/api/users/get_info')
      this.user = await response.data
      const get_images = await http.get('/api/users/images/' + this.user.id)
      this.images = await get_images.data
      console.log(this.images)

      let i = 0
      let j = 0
      const users = Object.keys(this.user);
      for (i = 0; i < users.length; i++) {
        if (this.user[users[i]] == null) {
          j++
        }
      }
      this.count = 100 - Math.floor(j*100/i)
    } catch (e) {
      console.log(e)
    }
  },
  methods: {
    async onSubmit (e) {
      try {
        const data = new FormData()
        data.append('profile_image', e[0])
        await http.post('/api/users/images', data)
        this.$router.go('/mypage')
      } catch (e) {
        console.log(e)
      }
    },
    async clickEdit (i) {
      this.edit[i] = false
      console.log(this.edit)
    },
    async updateUser () {
      try {
        await http.put('/api/users', this.user)
        await this.$router.go()
      } catch (e) {
        console.log(e)
      }
    },
    async destroyUserSession () {
      try {
        await http.delete('/api/users/sign_out')
        // リダイレクト先指定。
        await this.$router.go()
        this.$router.push('/')
      } catch (error) {
        // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
        console.log(error)
      }
    }
  },
  components: {
    ProfileEditor,
  }
}
</script>

<style scoped>
  @import '../../../style/users/show_profile.scss'
</style>
