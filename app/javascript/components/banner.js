import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to CarClique"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };

