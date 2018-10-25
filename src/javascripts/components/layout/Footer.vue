<template>
  <footer>
    <div
      v-for="page in pages"
      v-bind:key="page.id"
      class="item"
      :data-badge="message_count"
      :active="page.name === current_page"
      @click.prevent="changePage(page.path, page.name)"
    >{{ page.label }}</div>
  </footer>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      current_page: this.$route.name,
      pages: [
        {
          id: 1,
          path: '/',
          name: 'MainScreen',
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
      ],
      message_count: false
    }
  },
  async mounted () {
    setInterval(async () => {
      const response = await http.get('/api/users/chats/new_message_count')
      if(response.data.length > 0)
        this.message_count = response.data.length
      else
        this.message_count = false
    }, 3000)
  },
  methods: {
    async changePage (path, name) {
      this.$router.push(path)
    }
  },
  watch: {
    '$route' (to, from) {
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
@import '../../../style/layout/footer.scss'
</style>
