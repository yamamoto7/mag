<template>
  <div class='home-slim-users'>
    <div class='d-flex flex-row card-slim-container' @click="jumpPage(user.id)">
      <div class='user-slim-img' :style="'background-image: url(' + user.image + ')'">
        <div class="rate-box"></div><div class="rate-heart"></div><div class="matching-rate">{{ this.rate }}%  {{ user.first_name }}</div>
      </div>
    </div>
  </div>
</template>


<script>
  // import http from '../../http'

  export default {
    data () {
      return {
        rate: ''
      }
    },
    props: ['user'],
    async mounted () {
      this.rate = Math.floor( Math.random() * 40 ) + 60
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

