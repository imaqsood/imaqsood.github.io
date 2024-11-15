/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./**/*.{html,js}", ],
  theme: {
    extend: {
      fontFamily: {
        satisfy: ['Satisfy', 'cursive'],
        'great-vibes': ["Great Vibes", 'cursive'],
        notable:["Notable", 'sans-serif'],
      },
      backgroundImage: {
        'ruby': "url('https://www.ruby-lang.org/images/header-ruby-logo@2x.png')",
        'python': "url(https://banner2.cleanpng.com/20190623/yp/kisspng-python-computer-icons-programming-language-executa-1713885634631.webp)",
        'perforce': "url('https://avatars.githubusercontent.com/u/29477654?s=200&v=4')",
        'puppet': "url('/img/puppet-logo.png')",
        'profile': "url(https://media.licdn.com/dms/image/v2/D4D03AQG5C7HKgZLXpQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1700072404726?e=1736985600&v=beta&t=O1tItssM43KlYX_UrDKv2wuYdrbsgs9rhCqMdIrbY0o)",
        'mu': "url(/img/mu-logo.png)",
        'msbte': "url(/img/msbte.png)",
        'title': "url(/img/title.png)"
      },
      backgroundSize:{
        '16': '16px',
        '20': '20px',
        '28': '28px',
        'cover': 'cover'
      },
    },
  },
  plugins: [],
}
