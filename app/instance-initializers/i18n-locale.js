import Settings from 'frontend/models/local-settings';

export function initialize(application) {
  let localSettings = Settings.create();
  let locale = localSettings.get('locale');

  let currentLocale;
  typeof(locale) === 'undefined' ? currentLocale = 'en' : currentLocale = locale;

  I18n.locale = currentLocale;
}

export default {
  name: 'i18n-locale',
  initialize
};