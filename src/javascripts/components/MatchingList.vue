<template>
  <div class='list'>
    <img :src="user.image" alt="" class='user-icon'>
    <div class='content left-content'>
      <p class='name'>{{ user.first_name }}</p>
      <p class='message'>今度一緒にデートしませんか？？？？？？</p>
    </div>
    <div class='content right-content'>
      <p class='config'></p>
      <p class='date-time'>16:33</p>
    </div>

  </div>
</template>

<script>
  export default {
    data () {
      return {
      }
    },
    props: ['user'],
    async mounted () {
    },
    methods: {
    }
  }
</script>

<style scoped>
@import '../../style/matching_list.scss'
</style>
