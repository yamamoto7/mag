<template>
  <div>
    <h2>〇〇さんの詳細(とりあえず1番)</h2>
    {{ user.id }}/{{ user.email }}
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      user: ''
    }
  },
  async mounted () {
    const response = await http.get('/api/users/1')
    this.user = response.data
  },
  methods: {
  }
}
</script>

<style scoped>
@import '../../../style/users/show_detail.scss'
</style>
