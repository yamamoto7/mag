<template>
  <footer>
    <div
      v-for="page in pages"
      v-bind:key="page.id"
      class="item"
      :data-badge="page.badge"
      :active="page.name === current_page"
      @click.prevent="changePage(page.path, page.name)"
    >{{ page.label }}aaa</div>
  </footer>
</template>

<script>
export default {
  data () {
    return {
      current_page: this.$route.name,
      pages: [
        {
          id: 1,
          path: '/',
          name: 'UserList',
          label: '★',
          badge: false
        },
        {
          id: 2,
          path: '/likes',
          name: 'ReceivedLikesList',
          label: 'G',
          badge: false
        },
        {
          id: 3,
          path: '/matchings',
          name: 'MatchingInfo',
          label: '✉',
          badge: 7
        },
        {
          id: 4,
          path: '/mypage',
          name: 'UserShowProfile',
          label: '●',
          badge: false
        }
      ]
    }
  },
  mounted () {
  },
  methods: {
    async changePage (path, name) {
      this.$router.push(path)
      this.current_page = name
    }
  },
  watch: {
    '$route' (to, from) {
      console.log("aaaaaaaaaaaaaaaa")
      if (to.path !== from.path) {
        this.current_page = this.$route.name
      }
    }
  },
  components: {
  }
}
</script>

<style scoped>
@import '../../../style/layout/user_footer.scss'
</style>
