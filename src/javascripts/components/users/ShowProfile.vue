<template>
  <div>
    <div class="bar-box">
      <div class="bar-text">プロフィール充実度</div>
      <div class="bar">
        <div class="bar-content" :style="{width: this.count + '%'}">{{ this.count }}%</div>
      </div>
    </div>
    <div class="prof-box">
      <div class="image-box">
        <div
          class="prof-image"
          v-for="image in this.images"
          :style="'background-image:url(' + image.url + ')'"
        >
        </div>
        <label v-if="this.images.length < 5" for="selector">+
          <input type="file" id="selector" v-on:change="onSubmit($event.target.files)" accept="image/*" />
        </label>
      </div>
      <div class="prof-item">
        <h3>基本情報</h3>
        <div class="prof-edit">
          <div>自己紹介</div>
          <div>
            <textarea class="prof-text-form" type="text" v-model="user.profile" :placeholder="user.tall"/><br>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>血液型</div>
          <div>
            <select class="text-form" v-model="user.blood_type">
              <option value="0">A型</option>
              <option value="1">B型</option>
              <option value="2">O型</option>
              <option value="3">AB型</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>体型</div>
          <div>
            <select class="text-form" v-model="user.weight_type">
              <option value="0">小柄</option>
              <option value="1">スレンダー</option>
              <option value="2">ふつう</option>
              <option value="3">ふっくら</option>
              <option value="4">太め</option>
              <option value="5">筋肉質</option>
              <option value="6">グラマー</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>身長</div>
          <div>
            <select class="text-form" v-model="user.tall">
              <option v-for="n in 150" :value="n + 100">
                {{ n + 100 }}cm
              </option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>出身地</div>
          <div>
            <select class="text-form"
              v-model="user.state"
              >
              <option value='北海道'>北海道</option>
              <option value='青森県'>青森県</option>
              <option value='岩手県'>岩手県</option>
              <option value='宮城県'>宮城県</option>
              <option value='秋田県'>秋田県</option>
              <option value='山形県'>山形県</option>
              <option value='福島県'>福島県</option>
              <option value='茨城県'>茨城県</option>
              <option value='栃木県'>栃木県</option>
              <option value='群馬県'>群馬県</option>
              <option value='埼玉県'>埼玉県</option>
              <option value='千葉県'>千葉県</option>
              <option value='東京都'>東京都</option>
              <option value='神奈川県'>神奈川県</option>
              <option value='新潟県'>新潟県</option>
              <option value='富山県'>富山県</option>
              <option value='石川県'>石川県</option>
              <option value='福井県'>福井県</option>
              <option value='山梨県'>山梨県</option>
              <option value='長野県'>長野県</option>
              <option value='岐阜県'>岐阜県</option>
              <option value='静岡県'>静岡県</option>
              <option value='愛知県'>愛知県</option>
              <option value='三重県'>三重県</option>
              <option value='滋賀県'>滋賀県</option>
              <option value='京都府'>京都府</option>
              <option value='大阪府'>大阪府</option>
              <option value='兵庫県'>兵庫県</option>
              <option value='奈良県'>奈良県</option>
              <option value='和歌山県'>和歌山県</option>
              <option value='鳥取県'>鳥取県</option>
              <option value='島根県'>島根県</option>
              <option value='岡山県'>岡山県</option>
              <option value='広島県'>広島県</option>
              <option value='山口県'>山口県</option>
              <option value='徳島県'>徳島県</option>
              <option value='香川県'>香川県</option>
              <option value='愛媛県'>愛媛県</option>
              <option value='高知県'>高知県</option>
              <option value='福岡県'>福岡県</option>
              <option value='佐賀県'>佐賀県</option>
              <option value='長崎県'>長崎県</option>
              <option value='熊本県'>熊本県</option>
              <option value='大分県'>大分県</option>
              <option value='宮崎県'>宮崎県</option>
              <option value='鹿児島県'>鹿児島県</option>
              <option value='沖縄県'>沖縄県</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>兄弟姉妹</div>
          <div>
            <select class="text-form" v-model="user.brother">
              <option value="その他">その他</option>
              <option value="長男、長女">長男、長女</option>
              <option value="次男、次女">次男、次女</option>
              <option value="三男、三女">三男、三女</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>結婚歴</div>
          <div>
            <select class="text-form" v-model="user.martial_status">
              <option value="なし">なし</option>
              <option value="あり（離婚）">あり（離婚）</option>
              <option value="あり（死別）">あり（死別）</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>子供の有無</div>
          <div>
            <select class="text-form" v-model="user.children">
              <option value="いない">いない</option>
              <option value="いる（同居）">いる（同居）</option>
              <option value="いる（別居）">いる（別居）</option>
            </select>
          </div>
        </div>
        <h3>職業、学歴</h3>
        <div class="prof-btm-item">
          <div>学歴</div>
          <div>
            <select class="text-form" v-model="user.academic">
              <option value="0">義務教育</option>
              <option value="1">高等学校</option>
              <option value="2">高等専門学校</option>
              <option value="3">専門学校</option>
              <option value="4">短大</option>
              <option value="5">大学</option>
              <option value="6">大学院</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>最終学歴の状態</div>
          <div>
            <select class="text-form" v-model="user.academic_status">
              <option value="卒業">卒業</option>
              <option value="中退">中退</option>
              <option value="在学">在学</option>
            </select>
          </div>
        </div>
        <div class="prof-btm-item">
          <div>職業</div>
          <div>
            <select class="text-form" v-model="user.job">
              <option value="会社員（技術）">会社員（技術）</option>
              <option value="会社員（営業）">会社員（営業）</option>
              <option value="会社員">会社員</option>
              <option value="学生">学生</option>
            </select>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <button class="logout" type="submit" @click="updateUser">更新</button>
        <button class="logout" type="submit" @click="destroyUserSession">ログアウト</button>
      </div>
    </div>
  </div>
</template>

<script> 
import http from '../../http'

export default {
  data () {
    return {
      file: '',
      user: '',
      images: '',
      edit: [true, true],
      count: 0
    }
  },
  async mounted () {
    try {
      const response = await http.get('/api/users/get_info')
      this.user = await response.data
      const get_images = await http.get('/api/users/images/' + this.user.id)
      this.images = await get_images.data
      console.log(this.images)

      let i = 0
      let j = 0
      const users = Object.keys(this.user);
      for (i = 0; i < users.length; i++) {
        if (this.user[users[i]] == null) {
          j++
        }
      }
      this.count = 100 - Math.floor(j*100/i)
    } catch (e) {
      console.log(e)
    }
  },
  methods: {
    async onSubmit (e) {
      try {
        const data = new FormData()
        data.append('profile_image', e[0])
        await http.post('/api/users/images', data)
        this.$router.go('/mypage')
      } catch (e) {
        console.log(e)
      }
    },
    async clickEdit (i) {
      this.edit[i] = false
      console.log(this.edit)
    },
    async updateUser () {
      try {
        await http.put('/api/users', this.user)
      } catch (e) {
        console.log(e)
      }
    },
    async destroyUserSession () {
      try {
        await http.delete('/api/users/sign_out')
        // リダイレクト先指定。
        await this.$router.go()
        this.$router.push('/')
      } catch (error) {
        // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/show_profile.scss'
</style>
