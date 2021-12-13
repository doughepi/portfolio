// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "Piper Dougherty",
  tagline: '🙋‍♂️Cloud Engineer at General Mills, building the next generation of hybrid-cloud infrastructure.',
  url: 'https://piper.codes',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'doughepi',
  projectName: 'portfolio',

  plugins: [
    'plugin-image-zoom'
  ],

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/doughepi/portfolio/edit/main/',
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/doughepi/portfolio/edit/main/blog/',
          feedOptions: {
            type: 'all',
            copyright: `Copyright © ${new Date().getFullYear()} Piper Dougherty`,
          },
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
        googleAnalytics: {
          trackingID: 'UA-89087341-4',
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Piper Dougherty',
        logo: {
          alt: 'A picture of a laptop computer.',
          src: 'img/laptop.png',
        },
        items: [
          {
            type: 'doc',
            docId: 'about-me',
            position: 'left',
            label: 'About Me',
          },
          { to: '/blog', label: 'Blog', position: 'left' },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Social Media',
            items: [
              {
                label: 'LinkedIn',
                href: 'https://www.linkedin.com/in/doughepi/',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/doughepi',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Piper Dougherty. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};

module.exports = config;
