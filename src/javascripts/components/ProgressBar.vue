<template>
  <div class="container">
    <div
      class="bar"
      :style="{width: this.percent + '%'}"
    >
      {{ percent }}%
    </div>
  </div>
</template>

<script>

export default {
  data () {
    return {}
  },
  props: ['percent'],
  mounted () {
  },
}
</script>

<style scoped>
@import '../../style/progress_bar.scss'
</style>
