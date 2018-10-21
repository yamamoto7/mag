const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
module.exports = environment

environment.loaders.get('vue').use[0].options.extractCSS = false