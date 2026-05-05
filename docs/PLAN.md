# AVL Curious — Asheville Real Estate Discovery Site (Lead-Gen Plan)

## Context

Karin Wulff is a Realtor® at Nexus Realty (Arden/Asheville, NC). Her current online presence is fragmented across third-party profiles (Nexus, Zillow, Homes.com, LinkedIn) and a Lovable-generated SPA prototype at [asheville-welcome-hub.lovable.app](https://asheville-welcome-hub.lovable.app/). The prototype is useful for tone but is a client-rendered SPA with no IDX or SEO infrastructure — not viable for production.

We are building a **content-led real estate discovery site** under the **AVL Curious** brand. Karin is the agent behind it, but the brand and the SEO play are content-first, not name-first. The site exists to (1) win **non-branded discovery SEO** (luxury, neighborhood, relocation, lifestyle queries), (2) generate lead volume from people who didn't know Karin before they landed, and (3) gate **lead quality** at the form. Land/lot leads and sub-$400K leads aren't worth her time; the funnel must tilt toward $750K+ buyers and relocators.

**Why not personal-brand-led:** the searches that close high-value deals aren't "Karin Wulff" — they're "Asheville luxury homes," "Biltmore Forest real estate," "moving to Asheville," "[neighborhood] vs [neighborhood]." That's a content-led acquisition lane where a brandable, shareable, link-attracting domain wins. Karin still appears prominently — bio, headshot, brand pillars, contact — but the site's authority compounds under AVL Curious, not under her name.

**Hosting constraint:** static HTML/CSS/JS deployed to AWS S3 to keep monthly costs near zero. No origin server, no SSR at request time.

**Locked decisions:**
- **Primary brand and domain:** **AVL Curious** at `avlcurious.com`. Content-led brand. The homepage hero leads with the *area + lifestyle + buying-discovery* promise, not Karin's name.
- **Name-capture domain:** `karinwulff.com` registered and 301-redirected to `avlcurious.com` — captures any name-search traffic into the same SEO authority bucket. ~$15/yr insurance.
- **Karin as the agent of record:** prominent on `/about/`, in the footer (NCREC-required: name + license # + Nexus Realty firm name), in the brand-pillar surfaces, and in lead-form follow-up. The site is hers; the brand is the entry point.
- Listings: **Build-time MLS feed → static listing pages** (highest SEO upside).
- Leads: **Email only via 3rd-party form endpoint** (no CRM yet).
- Audience tilt: **Luxury-leaning, out-of-area-buyer-friendly** — same funnel, luxury-priced hero. **Relocation is not a packaged service offering** (decided 2026-05-05) — no `/relocate/` hub, no "Relocate" nav, no "Relocating to WNC" intent in the lead form. Out-of-area buyers are served by the same content (neighborhoods, market data, schools research, BRP living, etc.) without being labeled "relocators."

## Brand pillars — what every page must convey

These six attributes are the differentiators that convert higher-end buyers. They drive copy, imagery, IA ordering, and testimonial selection. Any section that conveys none of them is filler.

1. **Easy to work with.** Warm, accessible, not pushy. The voice from the prototype ("I'll tell you where to find the best guac") nails this — keep it.
2. **Relentless and thorough at finding the best values.** "I will not let you overpay." Surfaces undervalued and off-market opportunities. This is the anti-commodity-agent message.
3. **Logistically capable.** Moves, financing timelines, inspections, contingencies, contractor coordination. Concierge-level execution, especially for relocators.
4. **Deep local network of bankers, lenders, and real estate attorneys.** Means smoother closings and often better rates. List the relationship categories (not necessarily individual partner names).
5. **WNC neighborhood/city coach.** Helps buyers *choose* the right community before house-hunting — Asheville vs. Black Mountain vs. Hendersonville vs. Brevard, schools, commute, climate, vibe. This is where the relocation and luxury funnels converge and is a major SEO/content hook (see neighborhood pages).
6. **Proven track record.** Actual sold transactions. Some are visible on her Zillow/Homes.com profiles; we'll surface curated recent solds + summary stats (transactions closed, total volume, $1M+ deals) on the homepage and `/sold/` page.

**Application across the site:**

| Surface | How the pillars show up |
|---|---|
| Homepage hero | One-line value prop hits #2 + #5, framed as the AVL Curious promise: "Find — and *win* — the right home in the right corner of WNC." Sub-hero adds #1 + #3 + #4 in a 3-up. Karin's name is in the sub-hero and in the byline-style "with Karin Wulff, Realtor at Nexus Realty," not in the H1. |
| Homepage social-proof strip | Track-record stats (#6): "X closings · $Y volume · Z% above asking saved." |
| Homepage testimonial block | Curate quotes that reinforce #1 (easy), #2 (saved me money), #3 (handled everything). |
| `/about/` | Karin's story → why she's relentless, how she built the WNC network, her relocation perspective (she was a relocator). The /about/ page is also where the AVL Curious brand is anchored to a specific human, which Google's E-E-A-T signals reward. |
| `/buy/` | Lead with #2 + #5 + #4. Sections: "Choosing your community," "Finding hidden value," "Lender & attorney network," "What I handle for you." |
| `/sell/` | #2 + #3 + #6. Sections: "Pricing strategy," "Marketing & staging coordination," "My recent sold record." |
| `/relocate/` | #5 first, then #3. Visit packages embed #1. The quiz is the primary CTA on this page. |
| `/where-should-you-live/` quiz | #1 + #5 incarnate — playful, neighborhood-matching, ends in a soft lead capture pre-filled with quiz answers. |
| Neighborhood pages | #5 in the descriptive copy — "What it's like to live here, who it's right for, what you can walk to." Karin's first-person take, not Wikipedia paste. Includes drive-times to downtown, hospital, BRP entry, nearest brewery + trailhead. |
| Listing pages | #2 framing — "I'll tell you what's *actually* worth this price" via tour-request CTA. |
| Footer / About sidebar | #6 stats and credentials. |
| Lead form | Pre-headline reinforces #1 + #5: "Tell me what you're looking for — I'll help you find the right neighborhood and the right house, at the right price." |

## Success criteria

The site wins or loses on **non-branded discovery traffic and lead quality**, not on name SEO.

- **SEO (non-branded discovery is the scoreboard):**
  - Page 1 for ≥ 8 of these high-intent commercial queries by month 9: `Asheville luxury homes`, `Asheville luxury real estate`, `Biltmore Forest real estate`, `Biltmore Park real estate`, `Walnut Cove real estate`, `Grove Park homes for sale`, `Black Mountain real estate`, `Weaverville real estate`, `Hendersonville luxury homes`, `[neighborhood] homes for sale` (any of the cornerstone neighborhoods).
  - Page 1 for ≥ 5 of these top-of-funnel relocation/lifestyle queries by month 12: `moving to Asheville`, `relocating to Asheville`, `where to live near Asheville`, `Asheville vs Hendersonville`, `Black Mountain vs Asheville`, `living near Blue Ridge Parkway`, `Asheville neighborhoods guide`.
  - **The interactive tools** (`/where-should-you-live/`, `/buyer-readiness/`, `/seller-readiness/`) earn ≥ 25 inbound links collectively by month 12 — these are the link-bait engine.
  - Core Web Vitals all green sitewide (LCP <2.0s, INP <100ms, CLS <0.05).
  - "Karin Wulff" name search is NOT a target — it's expected to be served by the `karinwulff.com` 301 + her existing GBP / Zillow / Nexus / homes.com profiles. Tracking but not optimizing for it.
- **Volume:** ≥ 20 qualified form leads/month by month 6, ≥ 40 qualified leads/month by month 12.
- **Quality:**
  - ≥ 40% of leads in the $750K+ budget tier or relocation-with-budget by month 6.
  - <10% land-only inquiries (filtered by form structure and content focus).
  - Tool-sourced leads (any of the three calculators) outperform cold form leads on closing rate — measure and tune at month 6.

## Tech stack

| Concern | Choice | Why |
|---|---|---|
| Framework | **Astro 5.x** | Pure static output, zero-JS by default → best-in-class Core Web Vitals → SEO advantage. Markdown/MDX content collections fit "edit locally" workflow perfectly. |
| Styling | **Tailwind CSS** + a small custom token layer | Fast iteration, tiny CSS via JIT, great with Astro. |
| Content | Markdown/MDX in `src/content/` with Zod-schema collections | Git-as-CMS. Antonio edits locally, commits, site rebuilds. |
| Images | Astro's `<Image>` + Sharp; AVIF/WebP with fallbacks | Auto-resize/optimize at build, big LCP win. |
| Forms | **Web3Forms** (free tier viable) or **Formspree** ($10/mo) | Static-friendly POST endpoint → email. Honeypot + reCAPTCHA v3 for spam. |
| Analytics | **GA4** + **Google Search Console** + **Plausible** (optional) | GA4 + GSC are free and necessary for SEO measurement. Plausible is cleaner if Karin wants it. |
| Hosting | **S3 + CloudFront + ACM + Route 53** | Static hosting, HTTPS, edge cache, Brotli, HTTP/2-3. Total infra cost ~$2–6/mo. |
| CI/CD | **GitHub Actions** | Two workflows: (a) on push → build + deploy; (b) nightly cron → fetch MLS → rebuild + deploy. |
| MLS feed | **Canopy MLS** RESO Web API (Trestle by CoreLogic) | The MLS for WNC. Karin requests IDX feed access through her broker at Nexus. |

**Estimated monthly cost:** ~$15–25/mo (S3 + CloudFront + Route 53 + form service + domain amortized). MLS feed cost depends on Canopy/Nexus arrangement; most agent IDX feeds are included with brokerage membership.

## Compliance & legal — non-negotiable constraints

This is a real estate marketing site. It sits inside seven overlapping regulatory regimes: (1) the federal **Fair Housing Act**, (2) **NCREC** rules at 21 NCAC 58A, (3) the **NAR Code of Ethics**, (4) **Canopy MLS** IDX rules, (5) **ADA / WCAG**, (6) **CAN-SPAM / TCPA**, and (7) state privacy law (NC + CCPA/CPRA for CA visitors). Karin's **broker-in-charge** at Nexus has supervisory liability — **all final copy must be reviewed and approved by the broker-in-charge before launch**, and ambiguous Fair Housing language goes to NC REALTORS Legal Hotline or counsel. The plan author is not a lawyer; this section identifies the rules but does not constitute legal advice.

### 1. Fair Housing Act — what we cannot say about neighborhoods

Protected classes: race, color, national origin, religion, sex, familial status, disability (plus state-additional). The doctrine of **steering** prohibits agents from directing buyers toward or away from areas based on these traits, including via website copy.

| Banned in copy | Allowed in copy |
|---|---|
| "Good/best/bad schools" — even with caveats | Link to NCDPI report cards, GreatSchools, district websites, school zone maps; let buyers research |
| "Safe," "low-crime," "up-and-coming" | Crime statistics from objective sources, with attribution and a "verify yourself" note |
| "Family-friendly," "great for kids," "perfect for retirees" | "Within X miles of [named park/playground/trail]"; lot size; school bus route data |
| "Quiet" / "lively" framed against another area | Density, traffic counts, named amenities, sound-impact data if relevant |
| Any racial / ethnic / religious / national-origin / disability composition descriptor | Demographic data only via links to Census/data.gov, with no editorial framing |
| Subjective vibe labels that map to stereotypes ("artsy," "refined," "blue-collar") | Concrete amenities: galleries, breweries, farms, golf courses, named by name |

**Practical impact across the plan:**
- **Neighborhood pages** must be rebuilt around objective, factual amenity descriptions plus links to third-party data sources. No editorialized "vibe." Karin's first-person voice still works for *amenities and her own experiences* — "I bike Beaverdam Road every Saturday morning" is fine; "Beaverdam attracts the active outdoor type" is steering.
- **WNC quiz** archetype framing (originally "weird and arty / refined and quiet / small-town porches / off-grid mountain") must be **replaced with objective preference axes** — see the rewritten quiz section below.
- **Blog topics** with steering risk are removed or recast — see the revised list in Site structure.
- **MLS-supplied listing copy** is generally required to be reproduced verbatim under IDX rules; we do not author our own listing descriptions for IDX listings. For Karin's *own* listings (where she's the listing agent), copy must avoid steering language.

### 2. NCREC advertising rules (21 NCAC 58A .0105)

Required on every page (in the footer at minimum):
- **Firm name: "Nexus Realty"** — prominence equal to or greater than Karin's name.
- Karin's full name + **NC license number** + license type ("Broker" — NC uses "Broker" for licensees).
- "REALTOR®" mark only if Karin is a NAR member (verify before adding).
- The Equal Housing Opportunity statement and HUD logo.

### 3. NC "Working With Real Estate Agents" (WWREA) disclosure

NCREC requires this disclosure at first substantial contact with a prospective client. A web form submission is generally not first substantial contact, but lead-form pages should include a short notice: *"When we connect, I'll share the NC Working With Real Estate Agents disclosure — it explains how agents represent buyers and sellers in North Carolina."* Link to the WWREA PDF on the NCREC site.

### 4. Canopy MLS IDX compliance

Beyond what's in the MLS Integration section:
- IDX Participant (Karin's broker) branding **must be at least as prominent** as the site brand on IDX pages.
- Each listing detail page must include: listing-broker attribution ("Listing courtesy of [broker]"), listing-broker phone or email, and the Canopy-supplied data attribution + copyright + disclaimer.
- Verify Canopy's current refresh-frequency rule against our nightly cadence; some MLSes require shorter intervals.
- Photos display under IDX license — disable right-click download on listing detail pages; do not redistribute.
- Honor opt-in/opt-out flags on each listing record.

### 5. Privacy, CAN-SPAM, TCPA

- **`/privacy/` page** covering: data collected (name/email/phone/form data, GA4 cookies, IP); purposes (lead follow-up, analytics); third-party processors (Web3Forms or Formspree, Google Analytics, Search Console, AWS); retention; user rights; contact for requests. Templates from Termly or Iubenda are acceptable starting points.
- **Cookie consent banner** for GA4 — lightweight, static-friendly (Klaro is one option). Block analytics until consent.
- **TCPA** — lead form includes explicit opt-in language: *"By submitting, I agree Karin Wulff may contact me by phone, email, or text at the contact info provided."* Required next to the submit button or as a checked-by-default consent line.
- **CAN-SPAM** — any marketing emails Karin sends from the site's lead pipeline must include the Nexus office physical address and a working unsubscribe link.

### 6. ADA / WCAG 2.1 AA

Real estate sites are a serial-plaintiff target. Build to **WCAG 2.1 AA** from day one (cheaper than retrofitting).
- Keyboard navigation throughout; visible focus indicators.
- Color contrast ≥ 4.5:1 (3:1 for large text).
- Alt text on every meaningful image; empty alt only for decorative.
- Proper form label association; clear error messaging.
- Skip-to-content link; semantic heading order.
- ARIA only where native HTML semantics fall short.
- Pre-launch QA: axe DevTools, Lighthouse accessibility, keyboard-only walkthrough, one screen-reader pass (VoiceOver or NVDA).
- Publish an `/accessibility/` statement describing conformance target and a contact for reports.

### 7. Required footer content (every page)

- Firm name: **Nexus Realty** + Arden, NC office address + main office phone.
- Karin's name + NC license # + "Broker" + "REALTOR®" (if applicable).
- HUD **Equal Housing Opportunity** logo + statement.
- Canopy MLS attribution + logo on any page displaying IDX data.
- Links: Privacy Policy, Accessibility Statement.
- Copyright line.

### 8. Photography & copyright

- MLS listing photos: display under IDX license only; no redistribution; right-click download disabled on listing detail pages.
- Karin's commissioned photography: photographer contracts must assign copyright to Karin or Nexus, with explicit web/marketing rights in writing.

### 9. Pre-launch compliance checklist (gate to launch)

- [ ] All site copy reviewed and approved by Nexus broker-in-charge.
- [ ] Any ambiguous Fair Housing language run by NC REALTORS Legal Hotline.
- [ ] NCREC footer requirements verified on every page.
- [ ] EHO logo + statement in footer.
- [ ] WWREA notice on lead form pages; PDF link working.
- [ ] Canopy IDX attribution + listing-broker info on every listing page.
- [ ] `/privacy/` and `/accessibility/` pages live.
- [ ] Cookie consent banner active and blocking GA4 until accepted.
- [ ] TCPA opt-in language present on every form.
- [ ] Lighthouse accessibility ≥ 95 site-wide; manual screen-reader pass complete.
- [ ] Right-click disabled on listing photos.

## Site structure (URL inventory)

```
/                              Homepage — luxury hero, featured neighborhoods, recent listings, lead form
/about/                        Karin's story (NJ → Catskills → Asheville, Tony & Siena, 5 yrs local)
/contact/                      Full contact + lead form

# Service pillars
/buy/                          Buyer services — pre-qual form embedded
/sell/                         Seller services — home valuation request form
/relocate/                     Relocation hub (replaces the prototype's "Move to Asheville")
  /relocate/visit-packages/    Weekend & week-long visit experiences (from prototype)
  /relocate/moving-to-asheville/  Pillar guide

# Listings (MLS-fed, build-time generated)
/homes-for-sale/                       Master search index w/ client-side filter
/homes-for-sale/[city]/                Asheville, Hendersonville, Black Mountain, Weaverville, Arden, Fletcher
/homes-for-sale/[neighborhood]/        Filtered by neighborhood
/luxury-homes-asheville/               Pillar: $1M+ tier
/listing/[mls-id]-[slug]/              Individual listing detail page

# Programmatic area pages — Asheville core + WNC towns (~20-25 to start)
# Karin's coverage is regional, not just city limits. Each page = "What it's like to live here,
# who it's right for, market snapshot, active listings, drive-time to downtown AVL + nearest hospital + BRP access."
/neighborhoods/

# Asheville core
/neighborhoods/biltmore-forest/        $1M-$10M tier — top luxury target
/neighborhoods/biltmore-park/
/neighborhoods/the-cliffs-at-walnut-cove/
/neighborhoods/reynolds-mountain/
/neighborhoods/grove-park/
/neighborhoods/montford/
/neighborhoods/kenilworth/
/neighborhoods/north-asheville/        Beaverdam, Lakeview Park — biking/hiking access
/neighborhoods/west-asheville/         Arts, breweries, walkable
/neighborhoods/south-asheville/
/neighborhoods/river-arts-district/

# WNC towns Karin covers (outside Asheville city limits — equally important)
/neighborhoods/black-mountain/         "America's prettiest small town" — luxury & retirement
/neighborhoods/weaverville/            North of AVL, mountain views, growing fast
/neighborhoods/fairview/               East of AVL, large lots, Cane Creek Valley
/neighborhoods/arden/                  South corridor, Nexus's home base
/neighborhoods/fletcher/
/neighborhoods/mills-river/            Western reaches — French Broad, growing luxury
/neighborhoods/candler/
/neighborhoods/leicester/              West/rural — for the "land + a few acres" buyer
/neighborhoods/swannanoa/              East of AVL, Warren Wilson, BRP-adjacent
/neighborhoods/hendersonville/         Apple country, retiree-friendly, downtown charm
/neighborhoods/flat-rock/              Hendersonville-area luxury, Carl Sandburg's town
/neighborhoods/brevard/                Pisgah Forest, waterfalls, music festival
/neighborhoods/lake-lure/              Resort/second-home market — Chimney Rock views
... etc.

# Lifestyle / interactive
/where-should-you-live/                 Gamified WNC neighborhood-match quiz (see below)
/where-should-you-live/result/[slug]/   Shareable, indexable result pages
/buyer-readiness/                       "Are you ready to buy?" calculator (see below)
/buyer-readiness/result/[band]/         Score bands: list-ready, almost-there, foundation-phase
/seller-readiness/                      "Is your house ready to sell?" calculator (see below)
/seller-readiness/result/[band]/        Score bands: list-ready, prep-needed, strategic-phase

# Content hub — all titles audited for Fair Housing safety (no "best schools," no demographic framing)
/guides/                                Index
/guides/asheville-school-research/      How to research Asheville-area schools — links to NCDPI, GreatSchools,
                                        district maps; objective info only, no editorial rankings
/guides/asheville-private-schools-directory/  Listing of private schools (Carolina Day, Asheville Christian,
                                              Hanger Hall, Montessori options) with links to each school's
                                              own materials. Directory format, no comparative judgments.
/guides/cost-of-living-asheville/       Data-driven (BLS, ACS, BEA), with sources cited
/guides/asheville-property-taxes/       Buncombe + Henderson tax rates, exemptions
/guides/buying-a-second-home-asheville/ Tax/financing/insurance considerations
/guides/luxury-home-features-mountain-homes/  Architecture & build features
/guides/asheville-vs-greenville-vs-charlotte/  Objective side-by-side: distance, population, median home
                                                price, market trends — no quality-of-life rankings
/guides/blue-ridge-parkway-living/      Access points, BRP regulations, what's nearby
/guides/biking-in-asheville/            Routes by area: Bent Creek, MTB trails, road-biking loops
/guides/hiking-near-asheville/          DuPont, Pisgah, MST trail access
/guides/paddleboarding-and-water/       French Broad, Lake Lure, Lake Julian access points
/guides/asheville-breweries-by-neighborhood/  Brewery directory by area
/guides/downtown-asheville-events/      Orange Peel, Grey Eagle, Downtown After 5, LEAF — venue facts
/guides/asheville-cocktail-bars/        Sovereign Remedies, The Crow & Quill, Antidote — venue directory

# Blog (cadence: 2-4/mo) — Fair-Housing-safe titles only
/blog/
/blog/buncombe-county-school-research-guide/    "How to research" framing, no rankings
/blog/montessori-schools-asheville-directory/   Directory + links, no comparative claims
/blog/downtown-after-5-2026/                    Event guide, annually refreshed
/blog/orange-peel-grey-eagle-music-venues/      Venue facts, not personality typing
/blog/asheville-cocktail-bar-directory/
/blog/north-asheville-biking-routes/
/blog/where-to-paddle-near-asheville/
/blog/weaverville-market-snapshot-2026/         Data-driven; not "having a moment"
/blog/black-mountain-asheville-objective-comparison/  Side-by-side facts; not "which is right for you"
/blog/blue-ridge-parkway-access-by-area/        Distance/access facts
/blog/asheville-fall-color-driving-routes/      Seasonal, lifestyle (not neighborhood ranking)
/blog/wnc-quarterly-market-report-q1-2026/      Quarterly cadence

# Social proof / market authority
/market-reports/                       Quarterly Asheville/WNC reports
/sold/                                 Recent transactions (when permitted)
/reviews/                              Aggregated client testimonials

# Tech
/sitemap.xml, /robots.txt, /rss.xml
/404
```

## SEO strategy

The strategy is **content-led discovery, not name-based local SEO**. We win by stacking topical authority around luxury, neighborhoods, and relocation, with the interactive tools as link-bait engines that compound over time.

**Topical authority (the main lever):**
- Cornerstone luxury content: `/luxury-homes-asheville/` pillar, the Biltmore Forest / Biltmore Park / Walnut Cove / Grove Park / Reynolds neighborhood pages, and a recurring quarterly luxury market report. These pages must be the deepest, freshest, best-cited treatment of those topics on the open web.
- Cornerstone relocation content: `/relocate/`, `/relocate/moving-to-asheville/`, `/guides/cost-of-living-asheville/`, `/guides/asheville-property-taxes/`, `/guides/blue-ridge-parkway-living/`. These rank for top-of-funnel queries before buyers know agents exist.
- Cornerstone lifestyle/long-tail content: `/guides/biking-in-asheville/`, `/guides/hiking-near-asheville/`, the brewery/cocktail/event directories. Lower commercial intent but high link velocity.
- Quarterly market reports: data-rich, cite-able, refreshed every quarter — these earn the bulk of inbound links over time.

**Link-bait engines (the compounding lever):**
- The three interactive tools (`/where-should-you-live/`, `/buyer-readiness/`, `/seller-readiness/`) are the most shareable assets on the site. They get linked from Reddit relocation threads, local Facebook groups, lifestyle publications, and other Asheville sites. Every tool needs a great social card, a memorable URL, and pre-generated shareable result pages.

**On-page:**
- Per-page `<title>`, meta description, canonical (always pointing at `avlcurious.com`), OG/Twitter cards via a shared `<SEO>` Astro component.
- JSON-LD: site-wide `RealEstateAgent` (Karin, with the AVL Curious brand as `worksFor` or as the publisher); `LocalBusiness` for Nexus; `Person` on /about; `Place` on neighborhood pages; `Residence`/`Product` on listings; `BreadcrumbList` site-wide; `FAQPage` on guides where applicable. Anchoring the brand to a real licensed human is critical for E-E-A-T; the site is not a faceless content farm.
- Strict heading hierarchy (one H1, semantic H2/H3).
- Image alt text discipline — no decorative `alt=""` on content images.

**Site architecture:**
- Hub-and-spoke internal linking. `/luxury-homes-asheville/` (pillar) ↔ each $1M+ neighborhood page ↔ active listings in that neighborhood ↔ relevant guides. Aim for 3–5 contextual internal links per content page.
- The tools cross-promote each other and feed back into the neighborhood/listing graph.
- Breadcrumbs on every page.
- One sitemap, partitioned by section if it grows.

**Performance (SEO ranking factor):**
- Static HTML, zero JS by default, hydrate only what needs it (search filters, form validation, tool islands).
- Inline critical CSS, defer non-critical.
- Preload hero image, lazy-load below the fold.
- Self-host fonts (woff2, `font-display: swap`).
- Brotli at CloudFront, HTTP/3 enabled.

**Off-page:**
- **Karin's existing third-party profiles get updated to link to `avlcurious.com`**: Nexus profile, Zillow profile, Homes.com profile, LinkedIn, Realtor.com, NAR find-a-realtor. Each is a quality backlink to the new site.
- **Google Business Profile**: complete, verify, post weekly. Links to `avlcurious.com`. Note: GBP is a name-search asset for "Karin Wulff" / "Realtor near me" queries — it complements the discovery site without competing with it.
- **Outreach for backlinks**: pitch the three interactive tools to Asheville lifestyle blogs, the local Reddit, relocation Facebook groups, the WNC Magazine, and Mountain Xpress. Each is shareable on its own merit.
- NAP (Name, Address, Phone) — Karin + Nexus consistent across all pages and external citations.

## Lead capture & quality filtering

The form is the quality gate. Same form everywhere, but field structure pre-segments leads:

| Field | Why |
|---|---|
| Name, email, phone (required) | Standard. Phone format validation. |
| **Budget** (radio) — Under $500K / $500–750K / $750K–1M / $1M–2M / $2M+ / Just looking | Primary quality signal. The email subject line and routing logic key off this. |
| **Timeline** — < 3 mo / 3–6 mo / 6–12 mo / > 12 mo / Exploring | Secondary quality signal. |
| **What you're looking for** — Buy / Sell / Relocate / Visit package / Other | Routes content of follow-up. |
| **Property type interest** — Single-family / Condo/Townhome / **Estate / Mountain home** / Land/Lot / Investment | "Land/Lot" leads route to a separate digest, not Karin's phone. |
| Message (optional) | Open-ended. |
| Honeypot field | Spam. |

**Routing (handled in Web3Forms/Formspree custom subject + cc rules, or via a tiny CloudFront Function if we want server logic):**
- $750K+ AND timeline ≤ 6 mo → email subject prefixed `[HOT]`, sent to Karin's primary inbox immediately.
- Buyer-readiness or Seller-readiness score 90+ → `[HOT]` regardless of budget tier (high readiness is itself a quality signal).
- Land/Lot only → email subject `[LAND]`, sent to a digest folder Karin reviews weekly.
- Everything else → standard `[LEAD]` to her inbox.

Lead body always includes: form source surface, calculator score band (if applicable), all answers, UTM params, landing page, referrer.

**Surfaces:**
1. Hero CTA — "Book a free Asheville home consultation."
2. Sticky bottom bar on mobile.
3. End-of-content forms on every guide and neighborhood page.
4. `/contact/` full form.
5. Listing-detail page: "Request a private tour of [address]" (auto-fills the listing reference).
6. Exit-intent modal (desktop only, throttled to once per 7 days per visitor).

**UTM/source tracking:** capture `utm_*` params + landing page + referrer in a hidden field so Karin sees what's converting.

## MLS / IDX integration (build-time)

**Goal:** Listings render as fully static HTML — same SEO power as a content page.

**Pipeline (nightly GitHub Actions cron):**
1. Authenticate to Canopy MLS RESO Web API (Trestle credentials stored in GitHub Actions secrets).
2. Fetch all active listings in target service area (Buncombe + Henderson + parts of Madison/Haywood).
3. **Filter for lead quality:**
   - Exclude: `PropertyType = Land` and `PropertySubType = Lot` and acreage-only listings.
   - Exclude: list price < $400K (configurable; this is a knob to tune).
   - Include: SFR, condo, townhome, multi-family, farm-with-residence.
4. Download listing photos to `public/listings/[mls-id]/` (resized via Sharp at build).
5. Write each listing as a JSON entry to `src/content/listings/`.
6. Build Astro → all listings now exist as static `/listing/[mls-id]-[slug]/` pages.
7. `aws s3 sync` to bucket; `aws cloudfront create-invalidation` for changed paths.

**Compliance:** Canopy MLS IDX rules require attribution, broker info, accurate fields, refresh frequency, and no scraping. Read the Canopy IDX policy carefully and add the required disclaimers to listing pages and footer.

**Featured listings logic on homepage:** sort the filtered set by price desc, take top N (e.g., 6), prefer "new this week" if available.

## AWS infrastructure

```
Route 53  (avlcurious.com — primary)        Route 53  (karinwulff.com — name-capture)
   │                                              │
   ▼                                              ▼
CloudFront (HTTPS via ACM, Brotli, HTTP/3,   CloudFront distribution that 301-redirects
   custom error pages, redirect-to-          all paths → https://avlcurious.com$path
   trailing-slash)                           (or use S3 redirect bucket — cheaper)
   │
   ▼
S3 bucket (private, accessed via OAC) — static site assets
```

- **Two domains, one site of truth.** `avlcurious.com` serves the site; `karinwulff.com` 301-redirects every path to its `avlcurious.com` equivalent. Implement the redirect via either (a) a tiny S3 redirect-only bucket fronted by its own CloudFront + ACM cert, or (b) a CloudFront Function on the `karinwulff.com` distribution. Option (a) is cheaper at near-zero traffic and simpler to reason about.
- Bucket policy: deny public; only CloudFront OAC can read.
- ACM cert in `us-east-1` (CloudFront requirement) — separate certs for `avlcurious.com`+`www.avlcurious.com` and `karinwulff.com`+`www.karinwulff.com`.
- CloudFront cache policy: long TTL on `/_astro/*`, `/listings/*` images, fonts; short TTL on HTML.
- Security headers via CloudFront response-headers policy: HSTS, CSP (allow GA4 + form endpoint), X-Content-Type-Options, Referrer-Policy.
- Provision via Terraform or AWS CDK in `infra/` (Terraform recommended — simpler for this scope). Both domains live in the same Terraform stack.
- All canonical URLs in the site reference `avlcurious.com`; sitemap, OG/Twitter cards, JSON-LD, internal links, and the `<link rel="canonical">` all point to the AVL Curious origin so SEO authority cannot leak to the redirect domain.

## "Where Should You Live in WNC?" — neighborhood-match quiz (Fair-Housing-safe)

A playful, fully client-side quiz that recommends 2–3 WNC areas based on **objective preference axes** — not lifestyle archetypes or vibe labels. Triple duty: top-of-funnel SEO, share magnet, lead-capture surface. The voice can still be playful (this is Asheville); the *scoring* must be amenity-and-fact-based to stay clear of Fair Housing steering.

> **Compliance principle:** the quiz recommends neighborhoods based on what a buyer says they want in a *house and location* (lot size, distance, named amenities, price), never on inferred demographic, family, religious, or socio-cultural traits. Result pages describe each neighborhood with the same objective vocabulary used on the neighborhood pages themselves.

**Mechanics (pure JS, static page, no backend):**
- 8–10 questions, multiple choice. Each answer scores against a matrix of neighborhoods on **objective attributes only**.
- Question themes (rewritten to remove subjective vibe framing):
  - **Lot & density preference:** walkable urban (small lot, sidewalks) / suburban (1/4–1 acre) / large-lot (1–5 acres) / acreage (5+).
  - **Commute / distance to downtown Asheville:** 0–5 mi / 5–15 mi / 15–30 mi / 30+ mi.
  - **Outdoor recreation proximity (multi-select named amenities):** mountain biking trailhead (Bent Creek, DuPont, Kitsuma) / hiking (Pisgah, MST, BRP overlooks) / paddling (French Broad, Lake Lure, Lake Julian) / golf (Walnut Cove, Biltmore Forest CC, Grove Park) / Blue Ridge Parkway entry within 10 minutes.
  - **Walk-to amenities priority:** none required / ≥1 brewery within 1 mi / ≥1 grocery within 1 mi / ≥1 cafe + restaurant cluster within 1 mi.
  - **Downtown Asheville access frequency:** weekly+ / monthly / occasional / rarely.
  - **Architectural character preference:** historic / cottage / modern / mountain contemporary / estate / no preference. (Building features, not demographic descriptors.)
  - **Public-school research interest:** "Yes, I want to research school districts" → result page links to NCDPI report cards, GreatSchools, and district zone maps; **no editorial scoring on school quality**. "No / not applicable" is a valid answer with no scoring penalty.
  - **Price tier** — same options as the lead form; doubles as the quality gate.
  - **Timeline + intent.**
- Each result is a **shareable, indexable** page at `/where-should-you-live/result/[slug]/`, pre-generated for the top combinations of *objective preference clusters* (e.g. `/result/large-lot-trail-adjacent-15-30-mi/`). The slug describes attributes, not stereotypes.
- Result page shows: 2 primary recommendations + 1 "wildcard" pick, each linking to its neighborhood page, with a *factual* "why this matches" paragraph (e.g. "You said you want ≥1 acre and a 10-minute drive to a mountain-biking trailhead. Fairview has a median lot of 1.2 acres and is 12 minutes from Bent Creek.").
- **Lead capture:** result shown immediately (no email-wall — kills shares). Soft form below: *"Want Karin to put together a curated list of homes matching your criteria? Drop your email and budget."* Pre-fills budget from the quiz.
- **Voice:** still playful. The voice lives in the *question copy and loading states* ("Consulting the topo map…", "Pick your Saturday: trail by 8am / brunch at 11 / both, somehow"), **never** in the recommendation rationale, which stays factual.

**Tech notes:**
- Astro page with a small client-island (~10–15kb JS, code-split). State in URL params so back-button and shares work.
- Scoring logic in a single TS module; question + neighborhood-attribute matrix in JSON for easy tuning and broker review.
- No tracking of individual answers (privacy). Just quiz starts, completions, and result→lead conversions in GA4.
- **Broker review required** of the question wording, the neighborhood attribute matrix, and at least a sample of the pre-generated result pages before launch.

## Buyer Readiness & Seller Readiness calculators

Two short interactive tools modeled on the same tech foundation as the WNC quiz (pure client-side, static, no backend). Both serve as **lead-quality multipliers**: people who finish them have already pre-qualified themselves on the dimensions Karin cares about, and the score band tells her exactly how to follow up. Both also rank for high-intent search queries ("am I ready to buy a house," "how to prepare my house to sell").

### `/buyer-readiness/` — "Are you ready to buy?"

**Questions (~8, weighted scoring):**

| Question | Weight | Why it matters |
|---|---|---|
| Lender status: none / verbal pre-qual / written pre-approval / cash buyer | **High** | The single biggest signal — sellers don't take unverified buyers seriously, and neither does Karin. |
| Down-payment funds in hand (% of target price): <5 / 5–10 / 10–20 / 20+ / cash | **High** | Real money, ready to deploy. |
| Have you checked your credit in the last 6 months? Any known issues? | Medium | Surfaces problems before they kill a deal. |
| Current housing: renting / own + already sold / own + listed / own + not yet listed | Medium | Chain risk — own-not-listed = far from ready. |
| Timeline urgency: job already relocating / lease ending soon / flexible / exploring | Medium | Pairs with budget for the "[HOT]" lead-routing decision. |
| Budget tier (same options as the lead form) | Medium | Quality gate, also pre-fills the lead form. |
| Have you spoken with a lender? If yes — which one? | Low (data) | Signals seriousness; surfaces partners Karin already knows. |
| Are you familiar with closing costs and reserves? | Low | Gentle education check; opens door for Karin's lender network. |

**Score bands & result-page tone:**

- **90+ "List-ready buyer."** "You're ready to make offers." Result page shows current active listings in their budget + a one-click "Have Karin send a curated list this week" CTA.
- **60–89 "Almost there."** "Two or three small gaps to close." Personalized punch-list (e.g., "Get a written pre-approval — I can introduce you to two lenders I trust"). Soft CTA: book a 20-min call.
- **0–59 "Foundation phase."** "You're earlier in the journey — let's chart it." Educational primer (down-payment math, credit health, timing). CTA: "Get on Karin's monthly market intel email," low-pressure, long-nurture.

**Brand-pillar tie-ins:** explicit references to #4 (lender/attorney network) on the gap-closing recommendations, and #3 (logistics) on the closing-process explainer.

### `/seller-readiness/` — "Is your house ready to sell?"

**Questions (~8, weighted scoring):**

| Question | Weight | Why it matters |
|---|---|---|
| Reason for selling: relocation / downsize / upsize / estate / divorce / investment exit | Medium | Drives urgency framing; some categories are time-sensitive (relocation, estate). |
| Timeline: < 1 mo / 1–3 mo / 3–6 mo / 6–12 mo / exploring | **High** | Direct urgency signal. |
| Have you had a recent market valuation? When? By whom? | Medium | If no, that's job #1 — Karin offers a free CMA. |
| Mortgage situation: paid off / significant equity / break-even / underwater | Medium | Affects pricing strategy and net-proceeds expectations. |
| Are you replacing this home? Have you found the next one? | Medium | Chain risk; Karin's logistics shine here. |
| Prep status (multi-select checklist): deferred maintenance addressed / decluttered / professional photos / staged / pre-inspection done / paperwork organized | **High** | Each unchecked item is a Karin-managed deliverable (#3 logistics, #4 network of photographers/stagers/inspectors). |
| Pricing posture: aggressive for speed / market price / aspirational | Low | Signals strategy; opens the pricing conversation. |
| Listing platform expectations: just MLS / MLS + heavy marketing / off-market first | Low | Surfaces alignment with Karin's marketing approach. |

**Score bands & result-page tone:**

- **90+ "List-ready in 1–2 weeks."** "Your house could be on the market this month." CTA: "Schedule the photographer — Karin's photographer + stager are her people; we can move fast."
- **60–89 "Prep needed: 4–8 weeks."** Customized checklist of unchecked prep items, with Karin's vendor network ready to plug into each gap.
- **0–59 "Strategic phase."** "Start with a valuation, then we'll build a phased plan." CTA: free CMA request.

**Brand-pillar tie-ins:** every gap-closing recommendation routes through pillar #3 (logistics) and #4 (network). The seller calculator is one of the strongest places on the site to demonstrate that Karin doesn't just list houses — she runs the whole prep operation.

### Shared mechanics for both calculators

- Same tech as the WNC quiz: small Astro client-island, scoring in a single TS module, config in JSON, state in URL params for share/back-button support.
- Score bands have **pre-generated static result pages** at `/buyer-readiness/result/list-ready/` etc. — fully indexable, sharable, and the answers are encoded in URL params so the result is personalized but the underlying page is static HTML.
- Result page lead form is **pre-filled** from the calculator answers (budget, timeline, intent) so the lead form feels like a natural continuation, not a second ask. Submission tags the lead with the score band.
- **Lead routing impact:** any lead from the 90+ band of either calculator gets the `[HOT]` subject prefix regardless of budget, because high-readiness signal is itself a quality filter.
- **Optional PDF take-away:** "Email me my personalized next-steps PDF" generates a templated MDX → HTML → PDF (via build-time pre-rendering of all common bands, served as a static asset). This is a low-friction email capture for the 0–89 bands who aren't ready to book a call.

### Tools navigation grouping

The three interactive tools (`/where-should-you-live/`, `/buyer-readiness/`, `/seller-readiness/`) get a shared `/tools/` index page in the main nav for discoverability, while keeping their top-level URLs for SEO. The index cross-promotes them — a buyer who finishes the readiness check gets a "Now find your neighborhood →" CTA, and so on.

## Content strategy

**Tier 1 (launch must-have):**
- Homepage, About (Karin's story), Buy, Sell, Contact, Relocate hub.
- 10 cornerstone area pages spanning luxury + WNC coverage: Biltmore Forest, Biltmore Park, Walnut Cove, Grove Park, Montford, Kenilworth, North Asheville, **Black Mountain**, **Weaverville**, **Hendersonville**.
- 5 cornerstone guides: Moving to Asheville, Asheville Public Schools, Asheville Private Schools (Montessori focus), Cost of Living, Blue Ridge Parkway Living.
- "Where Should You Live in WNC?" quiz live at launch (it's a launch hook for social).

**Tier 2 (weeks 3–6):**
- Remaining 10–15 area pages (Fairview, Arden, Fletcher, Mills River, Candler, Leicester, Swannanoa, Flat Rock, Brevard, Lake Lure, RAD, West AVL, South AVL).
- Lifestyle guides: Biking in Asheville, Hiking near Asheville, Paddleboarding, Breweries by Neighborhood, Downtown Events, Cocktail Bars.
- Visit Packages page (port from prototype).
- First quarterly Market Report.

**Tier 3 (ongoing):**
- 2–4 blog posts/month — alternate between SEO-utility (school deep-dives, school-district maps, market trends) and voice-forward lifestyle (`Orange Peel vs. Grey Eagle`, `Where locals actually paddle`, seasonal Downtown After 5 recap).
- Quarterly market reports — separate sub-reports for Asheville core, Black Mountain/Weaverville corridor, and Hendersonville/Brevard.
- Listings auto-refresh nightly.

**Voice:** warm, specific, locally-informed, and unafraid of Asheville's quirky spirit — but **disciplined about Fair Housing**. The voice lives in *Karin's first-person experiences* and *named amenities*, not in characterizations of who lives somewhere. Reference real venues and amenities by name — Orange Peel, Grey Eagle, Sovereign Remedies, Highland Brewing, Wedge at Foundation, LEAF Festival, Downtown After 5, Bent Creek, DuPont, Pisgah, Mountains-to-Sea Trail, the French Broad, Looking Glass Falls, Chimney Rock. Karin's voice from the prototype works (`"I'll tell you where to find the best guac"` — that's about a *thing she knows*, not about who lives in a neighborhood). Keep first-person Karin throughout — never "we."

**Voice red lines (Fair Housing):**
- Don't characterize *people* who live in any area: no "the Biltmore Forest set," "West AVL is full of artists," "Black Mountain folks," etc.
- Don't grade schools, school districts, or compare them. Provide links to NCDPI and GreatSchools and let buyers research.
- Don't use "family-friendly," "great for kids," "perfect for retirees," "low-crime," "safe," "quiet," "up-and-coming."
- Subjective takes are fine when they're about *Karin's own experiences with named amenities* ("I bike Beaverdam Road every Saturday — it's the climb that hooks people"), but not about *the type of person a place suits*.

Anchor the About page in Karin's real story (NJ roots, Rutgers, NY/Catskills real estate, 5 years in Asheville with Tony and Siena).

**What we still need from Karin:**
- Headshots (high-res, multiple).
- Recorded answers to interview questions for the About page and FAQ.
- Permission to publish recent solds and any client testimonials.
- Canopy MLS IDX feed credentials (request from Nexus broker).
- Domain selection — confirm `karinwulff.com` availability/preference.

## Phasing & milestones

| Phase | Scope | Timeline |
|---|---|---|
| **0. Foundation** | Confirm domain; register; Astro repo scaffold; Tailwind + design tokens; layout components; SEO component; CI/CD; AWS infra (S3 + CloudFront + ACM + Route 53); deploy "Hello world" | Week 1 |
| **1. Core pages** | Homepage, About, Buy, Sell, Contact, Relocate hub; lead form (all surfaces); Web3Forms wired; analytics installed | Weeks 2–3 |
| **2. Neighborhoods + guides + tools** | 10 cornerstone area pages (incl. Black Mountain, Weaverville, Hendersonville); 5 cornerstone guides; all three interactive tools (Where Should You Live, Buyer Readiness, Seller Readiness) with shareable static result pages; `/tools/` index; internal linking finalized | Weeks 4–5 |
| **3. MLS integration** | Trestle API connector; nightly cron; listing index; listing detail template; featured listings on homepage | Weeks 6–7 |
| **4. Compliance & accessibility gate** | Broker-in-charge copy review; Fair Housing audit of every neighborhood page, blog post, and quiz result; NCREC footer verified; EHO + WWREA + Canopy IDX attribution + Privacy/Accessibility pages live; WCAG 2.1 AA + screen-reader pass; cookie consent + TCPA opt-in active. **Launch is gated on this checklist passing.** | Week 7.5 |
| **5. Polish & launch** | Schema audit; Lighthouse pass; GSC submission; Google Business Profile sync; redirects from Nexus profile/Zillow profile pointing here | Week 8 |
| **6. Content engine** | Editorial cadence: market reports, blog posts, neighborhood expansion, sold listings. Every piece passes the Fair Housing audit before publish. | Ongoing |

## Critical files (to be created)

- `astro.config.mjs` — site URL, integrations (sitemap, mdx, tailwind), image config.
- `src/content.config.ts` — Zod schemas for `listings`, `neighborhoods`, `guides`, `posts`, `testimonials`.
- `src/components/SEO.astro` — title/meta/OG/canonical/JSON-LD, single source of truth.
- `src/components/LeadForm.astro` — the qualification form, with variants (`hero`, `inline`, `tour-request`).
- `src/components/Schema/RealEstateAgent.astro`, `Residence.astro`, `Place.astro`, `BreadcrumbList.astro`.
- `src/layouts/Base.astro` — header, footer, schema, fonts, analytics.
- `src/pages/index.astro`, `about.astro`, `buy.astro`, `sell.astro`, `contact.astro`, `relocate/index.astro`.
- `src/pages/neighborhoods/[slug].astro`, `src/pages/listing/[id].astro`, `src/pages/homes-for-sale/[location].astro`.
- `scripts/fetch-mls.ts` — RESO Web API client → writes content collection JSON.
- `.github/workflows/deploy.yml` — on-push build + deploy.
- `.github/workflows/refresh-listings.yml` — nightly cron: fetch MLS → build → deploy → invalidate.
- `infra/main.tf` (or `infra/cdk/`) — Terraform for S3, CloudFront, ACM, Route 53.

## Verification

- **Local dev:** `npm run dev` → site renders at localhost:4321; all pages reachable; forms validate; Lighthouse mobile ≥ 95 on every category.
- **Build:** `npm run build` produces a `dist/` of pure static HTML/CSS/JS; no runtime JS on content pages except the lead form and listing search.
- **MLS pipeline (after credentials available):** `npm run fetch-mls` populates `src/content/listings/`; build produces one HTML file per listing; spot-check 3 listings against MLS source for accuracy.
- **SEO sanity:** Each generated page has unique title/description/canonical/JSON-LD; sitemap covers every URL; `robots.txt` allows all; no orphan pages.
- **Forms end-to-end:** Submit each form variant from prod URL → confirm Karin receives email with correct subject prefix per budget tier; honeypot blocks bot submissions.
- **Performance budget:** Real-device mobile 4G test in PageSpeed Insights — LCP <2.0s on homepage, neighborhood page, listing page.
- **GSC:** Property verified, sitemap submitted, no coverage errors after first crawl.

## Open items requiring user input before/during build

1. **Domain decision flipped to AVL Curious primary.** Register `avlcurious.com` (primary) AND `karinwulff.com` (301-redirect, name-capture). Both available as of 2026-05-04 whois check. Antonio registers.
2. Karin requests Canopy MLS IDX feed credentials via Nexus broker — start this now; it can take 1–4 weeks. While at it, request the current Canopy IDX rules document and the required attribution boilerplate.
3. Karin sends headshots + a 30-min recorded interview for the About page.
4. AWS account access for Antonio (assumed available; confirm region preference — `us-east-1` recommended for CloudFront/ACM simplicity).
5. Decide on Web3Forms vs Formspree (Web3Forms free tier may be sufficient initially).
6. **Confirm Karin's NC license number, NAR membership status, and broker-in-charge contact** — needed for footer compliance and pre-launch review.
7. **Identify the broker-in-charge as the formal copy reviewer** — schedule a single review pass for all launch copy in week 7.
8. Confirm whether Karin will use NC REALTORS Legal Hotline (free for members) or external counsel for any Fair Housing language flags.
