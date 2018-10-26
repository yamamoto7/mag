<template>
  <div class='home--users'>
    <div class='d-flex flex-row card-container' @click="jumpPage(user.id)">
      <div class='user-img' :style="'background-image: url(' + user.image + ')'"><div class="rate-box"></div><div class="rate-heart"></div><div class="matching-rate">78%</div></div>
      <div class='user-prf'>
        <p class='mt-1 w-100 name'>{{ user.first_name }} {{ user.state }}</p>
        <p class='mt-1 w-100 job sub-label'>職業
          <span class='value'>{{ user.job }}</span>
        </p>
        <p class='mt-1 w-100 salaly sub-label'>年収
          <span class='value'>{{ user.salary }}</span>
        </p>
        <p class='profile'>{{ user.profile }}</p>
      </div>
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
  @import '../..//style/fate-card.scss'
</style>

