<template>
  <div>
    <h2>チャットルーム</h2>
    <div v-for="message in messages">
      <div>
        {{ message.body }} / {{ message.user_id }}
      </div>
    </div>
    <div>
      <input v-model="msgBox" placeholder="message here"></input>
      <button v-if="roomChannel" @click="speak">送信</button>
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
data() {
  return {
    msgBox: "",
    messages: [],
    roomChannel: null,
  };
},
async created() {
  const response = await http.get('/api/users/chats/1')
  console.log(response.data)
  this.messages = response.data

  this.roomChannel = this.$cable.subscriptions.create( {channel: "RoomChannel", room_id: 1}, {
    received: (data) => {
      this.messages.push(data)
    },
  })
},
methods: {
  speak() {
    this.roomChannel.perform('speak', {message: this.msgBox});
  },
},
}
</script>
