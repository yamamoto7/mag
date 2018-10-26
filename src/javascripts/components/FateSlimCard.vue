<template>
  <div class='home-slim-users'>
    <div class='d-flex flex-row card-slim-container' @click="jumpPage(user.id)">
      <img class='user-slim-img' :src="user.image">
    </div>
  </div>
</template>


<script>
  // import http from '../../http'

  export default {
    data () {
      return {
      }
    },
    props: ['user'],
    async mounted () {
    },
    methods: {
      async jumpPage (id) {
        this.$router.push('/users/' + id)
      }
    },
    components: {
    }
  }
</script>

<style scoped>
  @import '../../style/fate-slim-card.scss'
</style>

