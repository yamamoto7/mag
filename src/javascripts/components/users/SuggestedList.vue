<template>
  <div>
    <h2>今までの運命の相手かも</h2>
    <div class="box-wrapper">
      <fate-history-card
        style="margin-bottom: 15px;"
        v-for="user_item in users"
        v-bind:key="user_item.id"
        :user="user_item"
      />
    </div>
  </div>
</template>

<script>
import FateHistoryCard from '../FateHistoryCard.vue'
import http from '../../http'

export default {
  components: {
    FateHistoryCard
  },
  data () {
    return {
      users: []
    }
  },
  async mounted () {
    try{
      const response = await http.get('/api/users')
      this.users = response.data
    } catch(e) {
      console.log(e)
    }
 },
  methods: {
  }
}
</script>

<style scoped>
@import '../../../style/users/received_likes_list.scss'
</style>
