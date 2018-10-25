<template>
  <div>
    <div class="image-box">
      <div
        class="prof-image"
        v-for="image in this.images"
        :style="'background-image:url(' + image.profile_image.blob.service_url + ')'"
      >
      </div>
      <label v-if="this.images.length < 5" for="selector">+
        <input type="file" id="selector" v-on:change="onSubmit($event.target.files)" accept="image/*" />
      </label>
    </div>
    <div class="bar-box">
      <div class="bar-text">プロフィール充実度</div>
      <div class="bar">
        <div class="bar-content" :style="{width: this.count + '%'}">{{ this.count }}%</div>
      </div>
    </div>
    <div class="prof-box">
      <div class="prof-item">
        <div class="prof-top">
          <div class="prof-top-name">{{ user.first_name }}</div>
          <div class="prof-top-btn" @click="updateUser">更新</div>
        </div>
        <div class="prof-btm">
          <div class="prof-btm-item">
            <div>あああ</div>
            <div>
              <input class="text-form" type="text" v-model="user.tall" :placeholder="user.tall"/><br>
            </div>
          </div>
          <div class="prof-btm-item">
            <div>身長</div>
            <div>
              <select class="text-form" v-model="user.tall">
                <option v-for="n in 150" :value="n + 100">
                  {{ n + 100 }}cm
                </option>
              </select>
            </div>
          </div>
          <div class="prof-btm-item">
            <div>血液型</div>
            <div>
              <select class="text-form" v-model="user.blood_type">
                <option value="0">A型</option>
                <option value="1">B型</option>
                <option value="2">O型</option>
                <option value="3">AB型</option>
              </select>
            </div>
          </div>
          <div class="prof-btm-item">
            <div>学歴</div>
            <div>
              <select class="text-form" v-model="user.academic">
                <option value="0">高卒</option>
                <option value="1">大卒</option>
              </select>
            </div>
          </div>
          <div class="prof-btm-item">
            <div>体型</div>
            <div>
              <select class="text-form" v-model="user.weight_type">
                <option value="0">ガリ</option>
                <option value="1">普通</option>
                <option value="2">デブ</option>
                <option value="3">巨漢</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import http from '../../http'

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
      const get_images = await http.get('/api/users/images')
      this.images = await get_images.data

      let i = 0
      let j = 0
      const users = Object.keys(this.user);
      for (i = 0; i < users.length; i++) {
        console.log(this.user[users[i]])
        if (this.user[users[i]] == null) {
          console.log(this.user[users[i]])
          j++
        }
      }
      console.log(i)
      console.log(j)
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
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/show_profile.scss'
</style>
