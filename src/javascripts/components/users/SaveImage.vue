<template>
  <div>
    <h2>まずは、プロフィール写真を載せましょう！</h2>
    <div class="box">
      <div class="box-good">good!</div>
      <div class="image-box">
        <div class="image-item"></div>
        <div class="image-item"></div>
        <div class="image-item"></div>
      </div>
      <div class="box-text">・顔がはっきりとわかる<br>・清潔感がある</div>
    </div>
    <div class="box">
      <div class="box-bad">bad</div>
      <div class="image-box">
        <div class="image-item"></div>
        <div class="image-item"></div>
        <div class="image-item"></div>
      </div>
      <div class="box-text">・顔が隠れている<br>・顔が映っていない<br>・写真がぼやけている</div>
    </div>
    <div class="btn">写真を追加する</div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
    }
  },
  async mounted () {
  },
  methods: {
  },
  components: {
  }
}
</script>

<style scoped>
@import '../../../style/users/save_image.scss'
</style>
