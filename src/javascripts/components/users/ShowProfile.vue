<template>
  <div>
    <input type="file" v-on:change="onSubmit($event.target.files)" accept="image/*" />
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      file: ''
    }
  },
  async mounted () {
  },
  methods: {
    async onSubmit (e) {
      try {
        const data = new FormData()
        data.append('profile_image', e[0])
        await http.post('/api/users/images', data)
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
