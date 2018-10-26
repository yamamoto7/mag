<template>
  <div class='list' @click="goRoom">
    <img :src="user.image" alt="" class='user-icon'>
    <div class='content left-content'>
      <p class='name'>{{ user.first_name }}</p>
      <p class='message'>今度一緒にデートしませんか？？？？？？</p>
    </div>
    <div class='content right-content'>
      <p class='config' :data="badge"></p>
      <p class='date-time'></p>
    </div>

  </div>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    props: ['user', 'badge', 'room_id'],
    async mounted () {
    },
    methods: {
      async goRoom () {
        this.$router.push('/users/chats/' + this.room_id)
      }
    }
  }
</script>

<style scoped>
@import '../../style/matching_list.scss'
</style>
