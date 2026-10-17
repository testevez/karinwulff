import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwindcss from '@tailwindcss/vite';
import { execSync } from 'node:child_process';
import { existsSync } from 'node:fs';

// Sitemap <lastmod>: the last git commit touching the page's source file.
// Pages without a matching file (or outside git) simply get no lastmod.
function lastModified(pathname) {
  const slug = pathname.replace(/^\/|\/$/g, '') || 'index';
  const file = `src/pages/${slug}.astro`;
  if (!existsSync(file)) return undefined;
  try {
    const iso = execSync(`git log -1 --format=%cI -- "${file}"`, { encoding: 'utf8' }).trim();
    return iso || undefined;
  } catch {
    return undefined;
  }
}

export default defineConfig({
  site: 'https://avlcurious.com',
  trailingSlash: 'always',
  build: {
    format: 'directory',
  },
  integrations: [
    sitemap({
      serialize(item) {
        const lastmod = lastModified(new URL(item.url).pathname);
        return lastmod ? { ...item, lastmod } : item;
      },
    }),
  ],
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
      allowedHosts: ['avlcurious.ddev.site', 'localhost', '.ddev.site'],
    },
    preview: {
      host: '0.0.0.0',
      port: 4321,
      strictPort: true,
      allowedHosts: ['avlcurious.ddev.site', 'localhost', '.ddev.site'],
    },
  },
});
