import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  site: 'https://avlcurious.com',
  trailingSlash: 'always',
  build: {
    format: 'directory',
  },
  integrations: [sitemap()],
  vite: {
    plugins: [tailwindcss()],
    server: {
      // Allow DDEV's hostname to access the Astro dev server
      host: '0.0.0.0',
      port: 4321,
      strictPort: true,
      hmr: {
        clientPort: 4321,
      },
      allowedHosts: true,
    },
  },
});
