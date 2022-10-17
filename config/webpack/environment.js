const { environment } = require('@rails/webpacker')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)


module.exports = environment
