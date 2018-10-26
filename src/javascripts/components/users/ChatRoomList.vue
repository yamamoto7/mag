<template>
  <div class="wrap">
    <div class='home-slim-users'
      v-for="user in this.users"
      @click="goShow(user.id)"
    >
      <div class='d-flex flex-row card-slim-container'>
        <div class='user-slim-img' :style="'background-image: url(' + user.image + ')'">
          <div class="rate-box"></div>
          <div class="matching-rate">{{ user.first_name }}</div>
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
      users: [],
    }
  },
  async mounted () {
    try{
      const response = await http.get('/api/users/matching')
      this.users = await response.data
    } catch(e) {
      console.log(e)
    }
 },
  methods: {
    async goShow (id) {
      this.$router.push('/users/' + id)
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/chat_room_list.scss'
</style>
