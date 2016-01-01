import Settings from 'frontend/models/local-settings';

export function initialize(application) {
  let intl = application.container.lookup('service:intl');
  let localSettings = Settings.create();

  let locale = localSettings.get('locale');

  let currentLocale;

  typeof(locale) === 'undefined' ? currentLocale = 'en' : currentLocale = locale;
  intl.setLocale(currentLocale);
}

export default {
  name: 'ember-intl-locale',
  initialize
};