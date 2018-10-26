<template>
  <div class='card'>
    <p class='question_number'>
      Q{{question.id}}
    </p>

    <p class='title'>
      {{question.title}}
    </p>

    <div class='survey-question--form'>
      <p class='survey-question--form__btn circle dislike' :value='1' @click='updateSurveyAnswer'/>
      <p class='survey-question--form__btn circle so dislike' :value='2' @click='updateSurveyAnswer'/>
      <p class='survey-question--form__btn circle so like' :value='3' @click='updateSurveyAnswer'/>
      <p class='survey-question--form__btn circle like' :value='4' @click='updateSurveyAnswer'/>
    </div>

    <div class='labels'>
      <p class='label dislike'>嫌い</p>
      <p class='label like'>好き</p>
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data() {
    return {
      question_id: Number(this.$route.params.question_id),
      question: {},
      survey_answer_value: null,
    }
  },
  methods: {
    ClickBeforeLink(){
      this.$router.push({
        name: 'SurveyQuestionScreen',
        params: { question_id: this.question_id -= 1 }
      });

      this.fetchQuestionView();
    },
    async fetchQuestionView(){
      const res = await http.get(`/api/survey/questions/${this.question_id}`);
      this.question = res.data;
    },
    async submitQuestionForm() {
      if (!this.survey_answer_value) return;

      try {
        const response = await http.post(`/api/surveys/${this.question.survey_id}/answer`, {
          value: this.survey_answer_value,
          survey_questions_id: this.question_id
        });

        // 何がしたいんやこいつ
        await this.$router.go();
        if (this.question_id !== 18) {
          this.$router.push({
            name: 'SurveyQuestionScreen',
            params: { question_id: this.question_id += 1 }
          });
        } else {
          // TODO 最後の設問の時だけ別のところに飛ばす
          this.$router.push('/')
          window.reload(); // FXIME ごめんなさい。なんかリダイレクトがうまく行かなかったんです。
          return; // 74の処理はしたくないから return;
        }
      } catch (error) {
        console.log(error)
      }
      this.fetchQuestionView();
    },
    updateSurveyAnswer (e) {
      this.survey_answer_value = Number(e.currentTarget.getAttributeNode('value').value);
      this.submitQuestionForm();
    },
  },
  async mounted() {
    this.fetchQuestionView();
  },
};
</script>

<style scoped>
@import '../../../style/surveys/survey_question_card.scss'
</style>
