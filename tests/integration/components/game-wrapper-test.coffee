`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'game-wrapper', 'Integration | Component | game wrapper', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{game-wrapper}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#game-wrapper}}
      template block text
    {{/game-wrapper}}
  """

  assert.equal @$().text().trim(), 'template block text'
