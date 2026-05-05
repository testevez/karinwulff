import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const listings = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/listings' }),
  schema: z.object({
    // MLS / source
    mls_id: z.string().optional(),
    source: z.enum(['mls', 'curated', 'sample']).default('curated'),
    status: z.enum(['active', 'pending', 'sold', 'draft', 'sample']).default('active'),

    // Surfacing
    title: z.string(),
    featured: z.boolean().default(false),
    draft: z.boolean().default(false),

    // Price + property facts
    list_price: z.number(),
    beds: z.number(),
    baths: z.number(),
    sqft: z.number().optional(),
    lot_acres: z.number().optional(),
    year_built: z.number().optional(),
    property_type: z.enum([
      'single-family',
      'condo',
      'townhome',
      'multi-family',
      'farm-with-residence',
    ]),

    // Location
    address: z.object({
      street: z.string(),
      city: z.string(),
      state: z.string().default('NC'),
      zip: z.string(),
    }),
    neighborhood: z.string().optional(),
    county: z.string().optional(),
    geo: z
      .object({
        lat: z.number(),
        lng: z.number(),
      })
      .optional(),

    // Media
    hero_image: z.string(),
    photos: z
      .array(
        z.object({
          src: z.string(),
          alt: z.string(),
          caption: z.string().optional(),
        })
      )
      .default([]),

    // Optional financial details
    hoa_dues_monthly: z.number().optional(),
    taxes_annual: z.number().optional(),

    // Highlights for listing card / detail page
    features: z.array(z.string()).default([]),

    // IDX compliance — required when listing is from Canopy MLS but Karin
    // is not the listing agent. Placeholder for samples.
    listing_broker: z
      .object({
        name: z.string(),
        phone: z.string().optional(),
        email: z.string().email().optional(),
      })
      .optional(),

    // Dates
    listed_on: z.coerce.date(),
    last_updated: z.coerce.date().optional(),
  }),
});

export const collections = { listings };
