<template>
  <div class='question--card'>
    <h2 class='question--card__title'>
      {{question.id}}: {{question.title}}
    </h2>

    <p class='answer--select__message'>
      次の選択肢から選んでね :)
    </p>

    <div class='survey-question--form'>
      <div
        class='flex-container flex--row'
      >
        <label
          v-for="(label, index) in this.question_labels"
          class='survey-question--form__btn'
        >
         <input
          type='radio'
          name='survey-type'
          :value='index + 1'
          @click='updateSurveyAnswer'
         >
            {{label}}
          </input>
        </label>
      </div>
      <button
        type="submit"
        @click="submitQuestionForm"
      >
        確定する
      </button>
    </div>

    <div>
      <button
        @click="ClickBeforeLink"
        class='before_link_btn'
      >
        前へ
      </button>
      <button
        @click="ClickNextLink"
        class='next_link_btn'
      >
        次へ
      </button>
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
      question_labels: [],
      survey_answer_value: null,
    }
  },
  methods: {
    ClickNextLink(e){
      this.$router.push({
        name: 'SurveyQuestionScreen',
        params: { question_id: this.question_id += 1 }
      });

      this.fetchQuestionView();
    },
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

      this.renderQuestion();
    },
    renderQuestion() {
      this.question_labels = [];
      const text = ['当てはまる', '少し当てはまる', 'あまり当てはまらない', '当てはまらない']
      for ( let i = 0; i < this.question.question_type; i++){
        this.question_labels.push(text[i]);
      }
    },
    async submitQuestionForm() {
      if (!this.survey_answer_value) return;

      try {
        const response = await http.post(`/api/surveys/${this.question.survey_id}/answer`, {
          value: this.survey_answer_value,
          survey_questions_id: this.question_id
        });

        await this.$router.go()
        if (this.question_id !== 18) {
          this.$router.push({
            name: 'SurveyQuestionScreen',
            params: { question_id: this.question_id += 1 }
          });
        } else {
          // TODO 最後の設問の時だけ別のところに飛ばす
          this.$router.push('/')
        }
      } catch (error) {
        console.log(error)
      }
    },
    updateSurveyAnswer (e) {
      this.survey_answer_value = e.currentTarget.value;
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
