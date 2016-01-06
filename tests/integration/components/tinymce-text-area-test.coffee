`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'tinymce-text-area', 'Integration | Component | tinymce text area', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{tinymce-text-area}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#tinymce-text-area}}
      template block text
    {{/tinymce-text-area}}
  """

  assert.equal @$().text().trim(), 'template block text'
