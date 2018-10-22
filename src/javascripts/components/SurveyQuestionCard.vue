<template>
  <p>
    {{index}}: {{question.title}}
  </p>
</template>

<script>
export default {
  data() {
    return {
    }
  },
  props: ['question', 'index'],
  methods: {
  },
  async mounted() {
  // const res = await http.post('/api/daily_reports/suggestion', {id: this.dailyReport.id})
  // console.log(res.data)
  // this.suggestReports = res.data
  },
};
</script>

<style scoped>
@import '../../style/survey_question_card.scss'
</style>
