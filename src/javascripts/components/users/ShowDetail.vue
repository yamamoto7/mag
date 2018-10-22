<template>
  <div>
    <h2>〇〇さんの詳細({{ this.$route.params.user_id }}番)</h2>
    {{ user.id }}/{{ user.email }}/{{ this.have_already_liked }}
    
    <p v-if="have_already_liked">イイネ済みです</p>
    <button v-else @click="submitLike">いいね</button>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      user_id: this.$route.params.user_id,
      have_already_liked: false,
      user: ''
    }
  },
  async mounted () {
    const response = await http.get('/api/users/' + this.user_id)
    console.log(response.data)
    this.user = response.data.user
    this.have_already_liked = response.data.have_already_liked
  },
  methods: {
    async submitLike () {
      try {
        const response = await http.post('/api/users/likes', {user_id: this.user_id})
        this.have_already_liked = response.data
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/show_detail.scss'
</style>
