<template>
  <footer
    v-if="!['UserChatRoom','UserShowDetail'].includes($route.name)"
  >
    <div
      v-for="page in pages"
      v-bind:key="page.id"
      class="item"
      :style="'background-image: url(' + (current_page ===  page.image_path ? page.image_path.replace('w_', 'g_') : page.image_path) + ')'"
      :data-badge="page.badge"
      :active="page.name === current_page"
      @click.prevent="changePage(page.path, page.name)"
    ></div>

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
          image_path: '/assets/w_mag.png',
          badge: false
        },
        {
          id: 5,
          path: '/suggested',
          name: 'UserSuggestedList',
          label: 'S',
          image_path: '/assets/w_fate.png',
          badge: false
        },
        {
          id: 2,
          path: '/likes',
          name: 'ReceivedLikesList',
          label: 'G',
          image_path: '/assets/w_heart.png',
          badge: false
        },
        {
          id: 3,
          path: '/matchings',
          name: 'MatchingInfo',
          label: '✉',
          image_path: '/assets/w_chat.png',
          badge: false
        },
        {
          id: 4,
          path: '/mypage',
          name: 'UserShowProfile',
          label: '●',
          image_path: '/assets/w_account.png',
          badge: false
        }
      ],
      message_count: false
    }
  },
  async mounted () {
    setInterval(async () => {
      const response = await http.get('/api/users/chats/new_message_count')
      if(response.data.count > 0)
        this.pages[3].badge = response.data.count
      else
        this.pages[3].badge = false
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
