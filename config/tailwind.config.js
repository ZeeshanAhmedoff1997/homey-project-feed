const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim}',
    './app/components/**/*.rb',
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [require('daisyui')],
  daisyui: {
    themes: [
      {
        homeytheme: {
          primary: '#7C5BFB',
          secondary: '#BFAEFD',
          accent: '#9333EA',
          neutral: '#1E293B',
          'base-100': '#FFFFFF',
          info: '#3B82F6',
          success: '#22C55E',
          warning: '#EAB308',
          error: '#EF4444',
        },
      },
      'light',
      'dark',
    ],
  },
};
