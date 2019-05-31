<template>
  <div>
    <div v-if="!image">
      <h2>まずは、プロフィール写真を載せましょう！</h2>
      <div class="box">
        <div class="box-good">good!</div>
        <div class="image-box">
          <div class="image-item a1"></div>
          <div class="image-item a2"></div>
          <div class="image-item a3"></div>
        </div>
        <div class="box-text">・顔がはっきりとわかる<br>・清潔感がある</div>
      </div>
      <div class="box">
        <div class="box-bad">bad</div>
        <div class="image-box">
          <div class="image-item n1"></div>
          <div class="image-item n2"></div>
          <div class="image-item n3"></div>
        </div>
        <div class="box-text">・顔が隠れている<br>・顔が映っていない<br>・写真がぼやけている</div>
      </div>
      <label for="selector" class="btn">写真を追加する
        <input type="file" id="selector" v-on:change="onNext($event.target.files)" accept="image/*" />
      </label>
    </div>
    <div v-if="image">
      <h2>この写真で登録しますか？<br><span class="h2-mini">写真は後からでも変更できます。</span></h2>
      <div
        :style="'background-image:url(' + imageData + ')'"
        class="selected-image"
      >
    </div>
      <div class="btn-white" @click="changeImage">写真を選びなおす</div>
      <div class="btn-orange" @click="onSubmit">登録する</div>
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      image: null,
      imageData: ''
    }
  },
  async mounted () {
  },
  methods: {
    async onNext (e) {
      try {
        this.createImage(e[0])
        const data = new FormData()
        data.append('profile_image', e[0])
        this.image = data
        // await http.post('/api/users/images', data)
        // this.$router.go('/mypage')
      } catch (e) {
        console.log(e)
      }
    },
    createImage(file) {
        var image = new Image();
        var reader = new FileReader();
        var vm = this;
        reader.onload = (e) => {
            vm.imageData = e.target.result;
        };
        reader.readAsDataURL(file);
    },
    async changeImage (e) {
      this.image = null
    },
    async onSubmit () {
      try {
        await http.post('/api/users/images', this.image)
        document.location = ('/surveys')
      } catch (e) {
        console.log(e)
      }
    }
  },
  components: {
  }
}
</script>

<style scoped>
@import '../../../style/users/save_image.scss'
</style>
