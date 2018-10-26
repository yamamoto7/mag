<template>
  <footer>
    <div>
      <button
        @click="ClickBeforeLink"
        class='before_link_btn'
      >戻る</button>
    </div>
    <div class='bar-container'>
      <progress-bar :percent="Math.floor( Number(this.$route.params.question_id)/ 18 * 100)" />
    </div>
  </footer>
</template>

<script>
import http from '../../http'
import ProgressBar from '../ProgressBar.vue'

export default {
  data() {
    return {
      question_id: Number(this.$route.params.question_id),
      percent: 0,
    }
  },
  methods: {
    ClickBeforeLink(){
      this.$router.push({
        name: 'SurveyQuestionScreen',
        params: { question_id: this.question_id -= 1 }
      });
    },
  },
  mounted() {
    this.question_id = Number(this.$route.params.question_id);
  },
  components: {
    ProgressBar
  }
}
</script>

<style scoped>
@import '../../../style/surveys/survey_footer.scss'
</style>
