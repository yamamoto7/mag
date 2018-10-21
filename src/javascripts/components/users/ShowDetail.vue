<template>
  <div>
    <h2>〇〇さんの詳細({{ this.$route.params.user_id }}番)</h2>
    {{ user.id }}/{{ user.email }}
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      user_id: this.$route.params.user_id,
      user: ''
    }
  },
  async mounted () {
    const response = await http.get('/api/users/' + this.user_id)
    this.user = response.data
  },
  methods: {
  }
}
</script>

<style scoped>
@import '../../../style/users/show_detail.scss'
</style>
