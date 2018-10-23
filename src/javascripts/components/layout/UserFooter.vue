<template>
  <footer>
    <div
      v-for="page in pages"
      v-bind:key="page.id"
      class="item"
      :data-badge="page.badge"
      :active="page.name === current_page"
      @click.prevent="changePage(page.path, page.name)"
    >{{ page.label }}</div>
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
          path: '/',
          name: 'LikesList',
          label: 'G',
          badge: false
        },
        {
          id: 3,
          path: '/',
          name: 'RoomsList',
          label: '✉',
          badge: 7
        },
        {
          id: 4,
          path: '/examples',
          name: 'MyPage',
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
  components: {
  }
}
</script>

<style scoped>
@import '../../../style/layout/user_footer.scss'
</style>
