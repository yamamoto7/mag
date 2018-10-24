<template>
  <div>
    {{ this.user }}
    <div v-for="i in this.images">
      <img :src="i.profile_image.blob.service_url">
    </div>
    <input type="file" v-on:change="onSubmit($event.target.files)" accept="image/*" />
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
      // const user_response = await http.get('/api/users/get_info')
      // const user_id = await user_response.data.id
      // console.log(user_id)
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
        this.$router.push('/mypage')
      } catch (e) {
        console.log(e)
      }
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/chat_room_list.scss'
</style>
