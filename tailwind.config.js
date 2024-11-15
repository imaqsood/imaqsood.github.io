/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./**/*.{html,js}", ],
  theme: {
    backgroundImage: {
      'ruby': "url('https://www.ruby-lang.org/images/header-ruby-logo@2x.png')",
      'python': "url(https://banner2.cleanpng.com/20190623/yp/kisspng-python-computer-icons-programming-language-executa-1713885634631.webp)",
      'perforce': "url('https://avatars.githubusercontent.com/u/29477654?s=200&v=4')",
      'puppet': "url('/img/puppet-logo.png')",
    },
    backgroundSize:{
      '16': '16px',
      '20': '20px',
    },
    extend: {},
  },
  plugins: [],
}
