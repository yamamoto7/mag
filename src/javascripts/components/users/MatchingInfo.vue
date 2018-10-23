<template>
  <div>
    <div class="tabs">
    <div
      v-for="page in pages"
      v-bind:key="page.id"
      class="tab-item"
      :active="page.id === current_page"
      @click.prevent="changePage(page.id)"
    >{{ page.label }}</div>
    </div>
    <div v-show="current_page == 1">1111</div>
    <div v-show="current_page == 2">2222</div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      current_page: 1,
      pages: [
        {
          id: 1,
          label: 'マッチングリスト'
        },
        {
          id: 2,
          label: 'メッセージ'
        }
      ]
    }
  },
  async mounted () {
 },
  methods: {
    async changePage (id) {
      this.current_page = id
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/matching_info.scss'
</style>
