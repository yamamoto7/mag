<template>
  <div>
    <h2>チャットルームリスト</h2>
    <div
      v-for="room_item in rooms"
      v-bind:key="room_item.id"
    >
    {{ room_item.id }}
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      rooms: []
    }
  },
  async mounted () {
    const response = await http.get('/api/users/chats')
    this.rooms = response.data
 },
  methods: {
  }
}
</script>

<style scoped>
</style>
