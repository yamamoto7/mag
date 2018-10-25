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
        <div class="bar-content" style="width: 70%;">70%</div>
      </div>
    </div>
    <div class="prof-box">
      <div class="prof-item">
        <div class="prof-top">
          <div class="prof-top-name">名前</div>
          <div class="prof-top-btn">編集</div>
        </div>
        <div class="prof-btm">
          <div class="prof-btm-item">
            <div>身長</div>
            <div>100cm</div>
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
      images: ''
    }
  },
  async mounted () {
    try {
      const response = await http.get('/api/users/1')
      console.log(response.data)
      this.user = response.data
      const get_images = await http.get('/api/users/images')
      this.images = get_images.data
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
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/show_profile.scss'
</style>
