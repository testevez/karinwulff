# Stock photos — vetted Unsplash sources

All photos here are downloaded from [Unsplash](https://unsplash.com). The
[Unsplash License](https://unsplash.com/license) allows free commercial use
without attribution — using them on `avlcurious.com` is fine. Attribution is
nice but not legally required, and we don't display attribution on the site
to keep the visual surface clean.

These are committed to the repo (~1MB each, 5 photos = ~5MB) so the build
works on any clone without re-downloading. Convert to gitignored-originals
+ committed-derivatives later if the catalog gets bigger.

## Catalog

| File | Original size | Source | Used for |
|---|---|---|---|
| `blue-ridge-mountains.jpg` | 2400×1600 | [photo-1678073236214-76c5fbaf315d](https://images.unsplash.com/photo-1678073236214-76c5fbaf315d) | Homepage hero |
| `asheville-aerial.jpg` | 2400×1600 | [photo-1732646117345-593b37ccdea6](https://images.unsplash.com/photo-1732646117345-593b37ccdea6) | About page background, future neighborhood map context |
| `biltmore-estate.jpg` | 2400×1600 | [photo-1666387681397-0c98be7f9a1e](https://images.unsplash.com/photo-1666387681397-0c98be7f9a1e) | Future Biltmore Forest / luxury neighborhood pages |
| `downtown-asheville.jpg` | 2400×1600 | [photo-1651315521257-0d9078f3acbf](https://images.unsplash.com/photo-1651315521257-0d9078f3acbf) | Future downtown / Montford / urban-area pages |
| `asheville-residential.jpg` | 2400×1600 | [photo-1648919406182-722f525695c7](https://images.unsplash.com/photo-1648919406182-722f525695c7) | Future buyer-services page imagery |

## Adding more

When pulling new photos:

1. Search Unsplash via the website (`unsplash.com/s/photos/<query>`)
2. Copy the photo's permalink ID (the part after `photo-` in the image src URL)
3. Download via:
   ```sh
   curl -sL -o photos/<descriptive-name>.jpg \
     "https://images.unsplash.com/photo-<ID>?w=2400&h=1600&fit=crop&q=85"
   ```
4. Add a row to the catalog above with the source link.

Astro's `<Image>` component will resize / convert to WebP / optimize at build
time. Reference photos with relative imports from `src/pages/*.astro`:

```astro
import heroPhoto from '../../photos/blue-ridge-mountains.jpg';
```
